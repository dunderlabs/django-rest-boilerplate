class Test_Get:
    def test_status_code_is_200(self, admin_client):
        url = "/"
        response = admin_client.get(url)
        assert response.status_code == 200

    def test_response_is_json(self, admin_client):
        url = "/"
        response = admin_client.get(url)
        expected = {}
        assert response.json() == expected
