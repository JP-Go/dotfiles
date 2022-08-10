from typing import Sequence
from input_handlers import read_user_input, get_answer


def pick_among_programs(
    programs: Sequence[str], picks_list: list[str | None]
) -> list[str | None]:
    while True:
        user_choice = read_user_input(len(programs))
        if user_choice is None:
            continue
        print(f"Chose {programs[user_choice]}")
        picks_list.append(programs[user_choice])
        return picks_list


def pick_among_bundles(
    bundles_dict: dict[str, list[str]], picks_list: list[str | None]
) -> list[str | None]:
    bundles_names = list(bundles_dict.keys())
    while True:
        user_choice = read_user_input(len(bundles_names))
        if user_choice is None:
            continue
        chosen_bundle = bundles_names[user_choice]
        print(f"Chose {chosen_bundle}")
        picks_list.extend(bundles_dict[chosen_bundle])
        return picks_list


def pick_program(program: str, picks_list: list[str | None]) -> list[str | None]:
    if picks_list is None:
        picks_list = []
    while True:
        should_add = get_answer()
        if should_add is None:
            continue
        print(f"Chose {'yes' if should_add else 'no'}")
        if should_add is False:
            return picks_list
        picks_list.append(program)
        return picks_list
