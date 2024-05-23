import pytest
from signLanguage.exception import SignException

def test_sign_exception():
    try:
        raise SignException("Test error", sys)
    except SignException as e:
        assert str(e) == "Error occurred python script name [test_main_utils.py] line number [6] error message [Test error]"
