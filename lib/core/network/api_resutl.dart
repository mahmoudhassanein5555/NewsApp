sealed class ApiResult<T> {}

class ApiSuccess<T> implements ApiResult<T> {
  ApiSuccess(this.data);
  final T data;
}

class ApiError<T> implements ApiResult<T> {
  ApiError(this.errorMessage);
  final String errorMessage;
}
