/// Wrapper simples de resultado para operações de Services/Repositories.
///
/// Evita o uso de exceptions "cruas" chegando até a UI e força o
/// tratamento explícito de erro nos Providers.
sealed class Result<T> {
  const Result();

  factory Result.success(T data) = Success<T>;
  factory Result.failure(String message, [Object? cause]) = Failure<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(String message, Object? cause) failure,
  }) {
    final self = this;
    if (self is Success<T>) return success(self.data);
    if (self is Failure<T>) return failure(self.message, self.cause);
    throw StateError('Result subtype desconhecido');
  }
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  final Object? cause;
  const Failure(this.message, [this.cause]);
}
