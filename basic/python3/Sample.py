def get_password() -> str:
    # Hardcoded for demonstration purposes only
    return "SuperSecret123!"


def display_password() -> None:
    try:
        password = get_password()

        if not password:
            raise ValueError("Password is empty!")

        print(f"The saved password is: {password}")

    except ValueError as ve:
        print(f"Error: {ve}")
    except Exception as e:
        print(f"Unexpected error occurred: {e}")


if __name__ == "__main__":
    display_password()