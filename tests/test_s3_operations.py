import boto3
from moto import mock_s3
from signLanguage.utils.s3_operations import upload_file

@mock_s3
def test_upload_file():
    s3 = boto3.client('s3')
    s3.create_bucket(Bucket='test-bucket')
    result = upload_file("test.txt", "test-bucket", "test.txt")
    assert result is True
    response = s3.list_objects_v2(Bucket='test-bucket')
    assert 'Contents' in response
    assert any(item['Key'] == 'test.txt' for item in response['Contents'])
