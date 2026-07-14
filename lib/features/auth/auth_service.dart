import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

/// Regras puras do sistema de autenticação local.
///
/// Sem dependência de Flutter/Hive/Riverpod — fácil de testar
/// isoladamente. `features/auth/auth_providers.dart` orquestra o uso
/// deste serviço junto ao `AuthRepository`.
class AuthService {
  final Random _random;

  AuthService({Random? random}) : _random = random ?? Random.secure();

  /// Gera um salt aleatório para uma nova conta.
  String generateSalt([int length = 16]) {
    final values = List<int>.generate(length, (_) => _random.nextInt(256));
    return base64UrlEncode(values);
  }

  /// Hash de `salt + senha` usando SHA-256.
  ///
  /// A senha em texto puro nunca é persistida — apenas este hash.
  String hashPassword(String password, String salt) {
    final bytes = utf8.encode('$salt:$password');
    return sha256.convert(bytes).toString();
  }

  bool verifyPassword({
    required String password,
    required String salt,
    required String expectedHash,
  }) {
    return hashPassword(password, salt) == expectedHash;
  }

  String generateAccountId() => DateTime.now().microsecondsSinceEpoch.toString();

  String? validateUsername(String username) {
    final trimmed = username.trim();
    if (trimmed.length < 3) return 'Usuário deve ter ao menos 3 caracteres';
    if (trimmed.length > 20) return 'Usuário deve ter no máximo 20 caracteres';
    final validPattern = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!validPattern.hasMatch(trimmed)) {
      return 'Usuário deve conter apenas letras, números e "_"';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 6) return 'Senha deve ter ao menos 6 caracteres';
    return null;
  }
}
