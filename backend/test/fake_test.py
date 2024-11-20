import pytest

def fake():
    return True


def test_case1():
    assert fake() == True

def test_case2():
    assert fake() == True

def test_case3():
    assert fake() == True
