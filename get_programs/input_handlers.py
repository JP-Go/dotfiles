from constants import EXIT_MSG, YES_OR_NO


def handle_user_exit(user_input: str):
    if user_input == "exit":
        exit()


def read_user_input(max: int) -> int | None:
    try:
        user_input = input(f"Choice {EXIT_MSG}: ")
        handle_user_exit(user_input)
        if int(user_input) not in range(0, max):
            raise ValueError
        return int(user_input)
    except ValueError:
        print("Invalid choice. Try again")
        return None
    except Exception as e:
        raise e


def get_answer() -> bool | None:
    options = ' or '.join(YES_OR_NO)
    user_input = input(f"Type {options} {EXIT_MSG}: ")
    handle_user_exit(user_input)
    if user_input not in YES_OR_NO:
        return None
    return True if user_input == "yes" else False
