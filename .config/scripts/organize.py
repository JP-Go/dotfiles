#!/usr/bin/python3
import re
from os import getcwd, listdir, mkdir, system, path


def main():
    pattern = ''
    while pattern == '':
        pattern = input(
            "Give a regex pattern to lookup for or type 'exit' to cancel \n" +
            "(https://www.w3schools.com/python/python_regex.asp for more info): "
        )
        if (pattern == 'exit'):
            exit()

    def filter_list(alist, pattern):
        return [
            element for element in alist
            if (re.match(re.compile(pattern), element) and (
                element != "organize.py"))
        ]

    def get_new_dir_name(filename):
        if (filename.find('.') > 0):
            return filename[0:filename.find('.')]
        return filename

    all_files = sorted(filter_list(listdir('./'), pattern))

    directories = {
        get_new_dir_name(f): filter_list(all_files, get_new_dir_name(f))
        for f in all_files
    }

    if (len(directories)) == 0:
        print("No directories to create")
        exit()

    print(directories)
    for directory, files in directories.items():
        cwd = getcwd()
        if not path.exists(f'{cwd}/{directory}'):
            mkdir(f'{cwd}/{directory}')
        for afile in files:
            system(f"mv {afile} {cwd}/{directory}")

    response = input("Do you want to organize more files (y/N)?: ")
    if (response != "y"):
        return False
    return True


if __name__ == "__main__":
    while True:
        wants_to_organize_again = main()
        if (not wants_to_organize_again):
            break
