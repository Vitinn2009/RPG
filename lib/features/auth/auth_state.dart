import '../../core/models/user_account_model.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

/// Estado do sistema de autenticação local.
///
/// `unknown` = ainda checando a sessão salva (usado pela Splash Screen).
///
/// Classe escrita à mão (sem Freezed/build_runner) para o projeto
/// compilar e rodar sem etapa de geração de código.
class AuthState {
  final AuthStatus status;
  final UserAccountModel? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.user,
    this.errorMessage,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;

  AuthState copyWith({
    AuthStatus? status,
    UserAccountModel? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          user == other.user &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => Object.hash(status, user, errorMessage);

  @override
  String toString() => 'AuthState(status: $status, user: $user)';
}
