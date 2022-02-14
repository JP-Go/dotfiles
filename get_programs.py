from os import EX_USAGE
import sys

INSTALL_CMD = {"pacman": "-S", "apt": "install"}
EXIT_PROMPT = "(OR type 'exit' to leave)"
TERM_EMULATORS = ("alacritty", "kitty", "xterm")
WANTS_ZSH = ("Yes", "No")


def prompt_options(prompt: str, default: str, *others: str) -> None:
    print(prompt)
    options = (default, *others)
    for i, option in enumerate(options):
        print(f"{i}: {option}")
    print(f"Default is {default}")


def read_user_input(max: int) -> int | None:
    try:
        user_in = input(f"Choice {EXIT_PROMPT}: ")
        if user_in == "exit":
            exit()
        result = int(user_in)
        if result not in range(0, max):
            raise ValueError
        return result
    except ValueError as _:
        print("Invalid choice. Try again")
        return None


def pick_program(picks_list: list[str], *args: str) -> None:
    while True:
        user_choice = read_user_input(len(args))
        if user_choice is None:
            continue
        print(f"Chose {args[user_choice]}")
        picks_list.append(args[user_choice])
        return


def main():
    if not len(sys.argv) > 1:
        print("[ERROR]: Incorrect Usage")
        print("usage: ./get_programs.py <package_manager>")
        exit(EX_USAGE)
    picks = []
    prompt_options("Which terminal emulator would you like?", *TERM_EMULATORS)
    pick_program(picks, *TERM_EMULATORS)
    print(picks)


if __name__ == "__main__":
    main()
