import pytest

from src.main import main
from src.main import fibonacci

class TestMainOperations(object):

    @pytest.mark.dependency()
    def test_fibonacci_generator(self):
        """
        Document test.
        """

        assert fibonacci(-99) is None
        assert fibonacci(9) == 34

    @pytest.mark.dependency(
        depends = [
            "TestMainOperations::test_fibonacci_generator"
        ]
    )
    def test_main_executes_properly(self):
        """
        Document test.
        """

        assert main() is None