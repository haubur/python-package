"""
Document module.
"""

def fibonacci(index: int) -> int:
    """
    Document function.
    """

    result = None

    if index == 0:
        result = 0
    elif index == 1:
        result = 1
    elif index > 1:
        result = fibonacci(index - 1) + fibonacci(index - 2)

    return result

def main() -> None:
    """
    Document function.
    """

    for index in range(0,10):
        template = "fibonacci({index}) = {result}"
        print(template.format(index = index, result = fibonacci(index)))

if __name__ == "__main__":
    main()