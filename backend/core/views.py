from typing import Any

from rest_framework import status
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.views import APIView


class IndexView(APIView):
    def get(self, request: Request, *args: Any, **kwargs: Any) -> Response:
        return Response(data={}, status=status.HTTP_200_OK)
