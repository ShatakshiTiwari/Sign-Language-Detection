import os
import pytest
from signLanguage.utils.main_utils import read_yaml_file, write_yaml_file, decodeImage, encodeImageIntoBase64

@pytest.fixture
def yaml_test_file(tmpdir):
    file_path = tmpdir.join("test.yaml")
    content = {"key": "value"}
    write_yaml_file(file_path, content)
    return file_path

def test_read_yaml_file(yaml_test_file):
    content = read_yaml_file(yaml_test_file)
    assert content == {"key": "value"}

def test_write_yaml_file(tmpdir):
    file_path = tmpdir.join("write_test.yaml")
    content = {"key": "value"}
    write_yaml_file(file_path, content)
    assert os.path.exists(file_path)
    read_content = read_yaml_file(file_path)
    assert read_content == content

def test_decode_encode_image(tmpdir):
    original_image_path = "path/to/sample/image.jpg"
    encoded_string = encodeImageIntoBase64(original_image_path)
    decoded_image_path = tmpdir.join("decoded_image.jpg")
    decodeImage(encoded_string, decoded_image_path)
    assert os.path.exists(decoded_image_path)
