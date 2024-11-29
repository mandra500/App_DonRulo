enum ResultStatus { success, error }

class Result<T, E> {
  final E? error;
  final T? value;
  final ResultStatus status;

//constructor cuando  no hay error
  Result.success(this.value)
      : status = ResultStatus.success,
        error = null;

//constructor cuando hay error
  Result.failure(this.error)
      : status = ResultStatus.error,
        value = null;

// constructor por defecto donde se pasan los 3 valores
  Result(this.status, this.error, this.value);
}
