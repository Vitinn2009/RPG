import 'package:hive/hive.dart';
import '../models/user_account_model.dart';
import '../services/storage_service.dart';
import '../utils/app_logger.dart';
import '../utils/result.dart';

/// Repository do sistema de autenticação local.
///
/// Única camada que acessa as boxes `accounts` e `session` do Hive.
/// `features/auth` orquestra este repository através de
/// `AuthNotifier` — nunca acessa o Hive diretamente.
class AuthRepository {
  static const String _sessionKey = 'current_user_id';

  final StorageService<UserAccountModel> _accounts;
  final Box _sessionBox;

  AuthRepository({required Box<UserAccountModel> accountsBox, required Box sessionBox})
      : _accounts = StorageService<UserAccountModel>(accountsBox),
        _sessionBox = sessionBox;

  /// Busca uma conta pelo username (case-insensitive).
  Result<UserAccountModel?> findByUsername(String username) {
    try {
      final normalized = username.trim().toLowerCase();
      for (final account in _accounts.getAll()) {
        if (account.username.toLowerCase() == normalized) {
          return Result.success(account);
        }
      }
      return const Result.success(null);
    } catch (e, st) {
      AppLogger.error('Erro ao buscar conta por username', error: e, stackTrace: st, tag: 'AUTH');
      return Result.failure('Falha ao buscar usuário', e);
    }
  }

  Result<UserAccountModel?> getAccountById(String id) => _accounts.get(id);

  Future<Result<void>> saveAccount(UserAccountModel account) => _accounts.put(account.id, account);

  /// Id da conta atualmente logada, ou `null` se não houver sessão.
  Result<String?> getSessionUserId() {
    try {
      return Result.success(_sessionBox.get(_sessionKey) as String?);
    } catch (e, st) {
      AppLogger.error('Erro ao ler sessão', error: e, stackTrace: st, tag: 'AUTH');
      return Result.failure('Falha ao ler sessão local', e);
    }
  }

  /// Define (ou limpa, se `userId` for `null`) a sessão local ativa.
  Future<Result<void>> setSessionUserId(String? userId) async {
    try {
      if (userId == null) {
        await _sessionBox.delete(_sessionKey);
      } else {
        await _sessionBox.put(_sessionKey, userId);
      }
      return const Result.success(null);
    } catch (e, st) {
      AppLogger.error('Erro ao salvar sessão', error: e, stackTrace: st, tag: 'AUTH');
      return Result.failure('Falha ao salvar sessão local', e);
    }
  }
}
