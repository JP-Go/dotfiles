#!/usr/bin/env python3

from os import EX_USAGE
import sys
from input_handlers import get_answer
from typing import Sequence, Union
from constants import DE_OR_WM_BUNDLES, TERMINAL_EMULATORS
from pickers import pick_program, pick_among_programs, pick_among_bundles

packages = Union[Sequence[str], str, dict[str, list[str]]]


def enumerate_options(packages: Sequence[str] | dict[str, list[str]]):
    if isinstance(packages, dict):
        packages = list(packages.keys())
    for i, option in enumerate(packages):
        print(f"{i}: {option}")
    if not isinstance(packages, dict):
        print(f"Default is {packages[0]}")
        return
    print(f"Default is {list(packages.keys())[0]}")


def present_packages(prompt: str, packages: packages):
    print(prompt)
    enumerate_options(packages)


def confirm_coiches(packages: list[str | None]) -> bool | None:
    print(f"Are these the packages you want to install? {packages} ?")
    result = get_answer()
    return result


def install_packages(command, packages):
    print(f" Installing {','.join(str (x) for x in packages)} with {command}")


if __name__ == "__main__":
    while True:
        picks = []
        if not len(sys.argv) > 1:
            print("[ERROR]: Incorrect Usage")
            print("usage: ./get_programs.py <package_manager>")
            exit(EX_USAGE)

        present_packages("Which terminal emulator would you like?", TERMINAL_EMULATORS)
        picks = pick_among_programs(TERMINAL_EMULATORS, picks)
        print()

        print("Would you like to use zsh?")
        picks = pick_program("zsh", picks)
        print()

        present_packages("Which DE or WM would you like to use? ", DE_OR_WM_BUNDLES)
        picks = pick_among_bundles(DE_OR_WM_BUNDLES, picks)
        print()

        print("Would you like to use polybar?")
        picks = pick_program("polybar", picks)
        print()

        print(f"Are these the packages you want to install? {picks} ?")
        confirmed = get_answer()
        if confirmed:
            install_packages("yay", picks)
            break
        print("Do you want to star from the beginning")
        wants_redo = get_answer()
        if not wants_redo:
            exit(0)
