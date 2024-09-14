"""A one-line summary of the module or program, terminated by a period.

Leave one blank line.  The rest of this docstring should contain an
overall description of the module or program.  Optionally, it may also
contain a brief description of exported classes and functions and/or usage
examples.

Typical usage example:

  foo = ClassFoo()
  bar = foo.FunctionBar()
"""

def fibonacci(index: int) -> int:
    """Computes fibonacci number.

    Some more details on what the function does.

    Args:
      index:
        Integer value.

    Returns:
      Integer value.

    Raises:
      IOError: Example.
    """
    result = -1

    if index == 0:
        result = 0
    elif index == 1:
        result = 1
    elif index > 1:
        result = fibonacci(index - 1) + fibonacci(index - 2)

    return result

def main() -> None:
    for index in range(0, 10):
        template = "fibonacci({index}) = {result}"
        print(template.format(index=index, result=fibonacci(index)))

if __name__ == "__main__":
    main()
