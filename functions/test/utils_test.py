"""
Unit tests for utility functions in the utils module.

"""
# ---------- Unit Test for Random Avatar Generator ----------

from utils import create_random_avatar


def test_create_random_avatar():
    """Test that create_random_avatar returns a valid URL"""
    url = create_random_avatar()
    assert isinstance(url, str)
    assert url.startswith("https://api.dicebear.com/9.x/adventurer/svg")
    assert "seed=" in url
    assert "scale=110" in url
    assert "backgroundColor=transparent" in url
