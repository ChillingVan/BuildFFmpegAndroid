import os
import sys
import re
from collections import Counter

REGEX_DOT_O = r'[A-Za-z0-9_]+\.o'


def cur_file_dir():
    path = sys.path[0]
    if os.path.isdir(path):
        return path
    elif os.path.isfile(path):
        return os.path.dirname(path)


def read_string(filename):
    with open(filename, 'r') as fl:
        all_str = fl.read()
        fl.close()
    return all_str


def read_file_lines(file_path, on_read_line):
    with open(file_path, "r") as fl:
        for line in fl:
            on_read_line(line)


def read_files(directory, on_read_file, *arg):
    _recursive_read_files(directory, on_read_file, *arg)


def _recursive_read_files(path, on_read_fl, *arg):
    if os.path.isdir(path):
        for file_in_dir in os.listdir(path):
            _recursive_read_files(os.path.join(path, file_in_dir), on_read_fl, *arg)

    else:
        on_read_fl(path, *arg)


def write_file(file_name, output_str):
    with open(file_name, 'w') as fl:
        fl.write(output_str)


# makedirs for the path
def gen_dir(path):
    if os.path.exists(path) is False:
        os.makedirs(path)
    return path


def gen_dir_for_file(fl):
    return gen_dir(os.path.dirname(fl))


def parse_config_h(file_name):
    key_val = {}

    def on_r_line(line):
        if "define" in line:
            eles = line.split(" ")
            if len(eles) == 3:
                key_val[eles[1]] = eles[2]

    read_file_lines(file_name, on_r_line)
    print(key_val)
    return key_val


def parse_make_file(file_name):
    key_map_list = {}
    default_list = []

    class MultiLine:
        is_multi = False
        save_config_name = ""

    multi = MultiLine()

    def on_r_line(line):
        if not multi.is_multi and "$" not in line and ".o" in line:
            default_list.extend(re.findall(REGEX_DOT_O, line))
        else:
            if multi.is_multi:
                multi.is_multi = "\\" in line
                key_map_list[multi.save_config_name].extend(re.findall(REGEX_DOT_O, line))
            elif ".o" in line:
                multi.save_config_name = ""
                var_match = re.findall(r'\$\(([A-Za-z0-9_]+)\)', line)
                if var_match is not None and len(var_match) > 0:
                    config_name = var_match[0]
                    if "\\" in line:
                        multi.is_multi = True
                        multi.save_config_name = config_name
                    key_map_list[config_name] = re.findall(REGEX_DOT_O, line)

    read_file_lines(file_name, on_r_line)
    print(key_map_list)
    print("----------------")
    print("----------------")
    print(default_list)
    return key_map_list, default_list


def intersection(allow_keys, key_file_map):
    result = []
    for key, val in allow_keys.items():
        if '0' not in val and key in key_file_map:
            result.extend(key_file_map[key])

    return result


# This is used to get the needed .c source from makefile according to config.h
if __name__ == '__main__':
    # argv[1]:config.h path argv[2]:makefile path argv[3]: name: such as libavfilter
    configh = sys.argv[1]
    makefile = sys.argv[2]
    out_name = sys.argv[3]

    allow_keys = parse_config_h(configh)
    print("----------------")
    print("----------------")
    key_file_map, df_list = parse_make_file(makefile)
    print("----------------")
    print("----------------")
    allow_c_list = intersection(allow_keys, key_file_map)
    allow_c_list.extend(df_list)
    orig = re.findall(REGEX_DOT_O, read_string(makefile))
    # print("Is input dublicated?:", Counter(orig))
    # print("Is output dublicated?:", Counter(allow_c_list))
    allow_c_list_no_dup = list(set(allow_c_list))
    allow_c_list_no_dup.sort(key=allow_c_list.index)

    print(allow_c_list_no_dup)
    print("input size:", len(set(orig)))
    print("output size:", len(set(allow_c_list)))
    print("diff set:", set(orig) - set(allow_c_list))
    print("output no_dup size:", len(allow_c_list_no_dup))
    result = []
    for item in allow_c_list_no_dup:
        result.append("$(FFMPEG_ROOT)/" + out_name + "/" + item.replace(".o", ".c") + "  \\" + "\n")
    write_file(out_name + "support_c.txt", "".join(result))
