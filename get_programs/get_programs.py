#!/usr/bin/env python3

from os import EX_USAGE
import sys
from typing import Sequence
from constants import DE_OR_WM_BUNDLES, TERMINAL_EMULATORS
from pickers import pick_program, pick_among_programs, pick_among_bundles


def enumerate_options(options: Sequence[str] | dict[str, list[str]]):
    if isinstance(options, dict):
        options = list(options.keys())
    for i, option in enumerate(options):
        print(f"{i}: {option}")
    if not isinstance(options, dict):
        print(f"Default is {options[0]}")
        return
    print(f"Default is {list(options.keys())[0]}")


if __name__ == "__main__":
    if not len(sys.argv) > 1:
        print("[ERROR]: Incorrect Usage")
        print("usage: ./get_programs.py <package_manager>")
        exit(EX_USAGE)

    print("Which terminal emulator would you like?")
    enumerate_options(TERMINAL_EMULATORS)
    picks = pick_among_programs(TERMINAL_EMULATORS)
    print()

    print("Would you like to use zsh?")
    picks = pick_program("zsh", picks)
    print()

    print("Which DE or WM would you like to use? ")
    enumerate_options(DE_OR_WM_BUNDLES)
    picks = pick_among_bundles(DE_OR_WM_BUNDLES, picks)
    print()

    print("Would you like to use polybar?")
    picks = pick_program("polybar", picks)
    print()

    print(picks)
