import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/user_account_model.dart';
import '../../core/providers/core_providers.dart';
import 'auth_service.dart';
import 'auth_state.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

/// Controla o ciclo de vida da sessão local (checar, registrar, logar,
/// deslogar).
///
/// Toda regra de negócio (hash de senha, validação) fica em
/// [AuthService]; toda persistência fica em `AuthRepository`. Este
/// notifier apenas orquestra as duas camadas e expõe o estado para a
/// UI (Splash Screen hoje; Login Screen em prompt futuro).
class AuthNotifier extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    final repository = ref.watch(authRepositoryProvider);
    final sessionResult = repository.getSessionUserId();

    return sessionResult.when(
      success: (userId) {
        if (userId == null) {
          return const AuthState(status: AuthStatus.unauthenticated);
        }
        final accountResult = repository.getAccountById(userId);
        return accountResult.when(
          success: (account) => account == null
              ? const AuthState(status: AuthStatus.unauthenticated)
              : AuthState(status: AuthStatus.authenticated, user: account),
          failure: (message, _) => AuthState(
            status: AuthStatus.unauthenticated,
            errorMessage: message,
          ),
        );
      },
      failure: (message, _) => AuthState(
        status: AuthStatus.unauthenticated,
        errorMessage: message,
      ),
    );
  }

  /// Cria uma nova conta local e autentica automaticamente.
  Future<void> register({required String username, required String password}) async {
    final repository = ref.read(authRepositoryProvider);
    final service = ref.read(authServiceProvider);

    final usernameError = service.validateUsername(username);
    final passwordError = service.validatePassword(password);
    if (usernameError != null || passwordError != null) {
      state = AsyncData(AuthState(
        status: AuthStatus.unauthenticated,
        errorMessage: usernameError ?? passwordError,
      ));
      return;
    }

    final existingResult = repository.findByUsername(username);
    final alreadyExists = existingResult.when(
      success: (account) => account != null,
      failure: (_, __) => false,
    );
    if (alreadyExists) {
      state = const AsyncData(AuthState(
        status: AuthStatus.unauthenticated,
        errorMessage: 'Usuário já existe',
      ));
      return;
    }

    state = const AsyncLoading();

    final salt = service.generateSalt();
    final account = UserAccountModel(
      id: service.generateAccountId(),
      username: username.trim(),
      passwordHash: service.hashPassword(password, salt),
      salt: salt,
      createdAt: DateTime.now(),
    );

    final saveResult = await repository.saveAccount(account);
    await saveResult.when(
      success: (_) async {
        await repository.setSessionUserId(account.id);
        state = AsyncData(AuthState(status: AuthStatus.authenticated, user: account));
      },
      failure: (message, _) async {
        state = AsyncData(AuthState(status: AuthStatus.unauthenticated, errorMessage: message));
      },
    );
  }

  /// Autentica uma conta existente.
  Future<void> login({required String username, required String password}) async {
    final repository = ref.read(authRepositoryProvider);
    final service = ref.read(authServiceProvider);

    state = const AsyncLoading();

    final result = repository.findByUsername(username);
    await result.when(
      success: (account) async {
        final valid = account != null &&
            service.verifyPassword(
              password: password,
              salt: account.salt,
              expectedHash: account.passwordHash,
            );

        if (!valid) {
          state = const AsyncData(AuthState(
            status: AuthStatus.unauthenticated,
            errorMessage: 'Usuário ou senha inválidos',
          ));
          return;
        }

        final updated = account.copyWith(lastLoginAt: DateTime.now());
        await repository.saveAccount(updated);
        await repository.setSessionUserId(updated.id);
        state = AsyncData(AuthState(status: AuthStatus.authenticated, user: updated));
      },
      failure: (message, _) async {
        state = AsyncData(AuthState(status: AuthStatus.unauthenticated, errorMessage: message));
      },
    );
  }

  /// Encerra a sessão local atual.
  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.setSessionUserId(null);
    state = const AsyncData(AuthState(status: AuthStatus.unauthenticated));
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
