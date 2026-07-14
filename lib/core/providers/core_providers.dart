import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../constants/hive_constants.dart';
import '../models/player_model.dart';
import '../models/user_account_model.dart';
import '../repositories/auth_repository.dart';
import '../repositories/player_repository.dart';

/// Providers globais de infraestrutura.
///
/// Regra: apenas dependências compartilhadas entre múltiplas features
/// (boxes do Hive, repositories, clients de rede futuros) ficam aqui.
/// Providers específicos de uma feature (ex.: estado da tela de battle)
/// devem viver dentro da própria pasta da feature.

/// Box do jogador. Assume que `HiveInitializer.init()` já foi chamado
/// em `main.dart` antes da árvore de widgets subir.
final playerBoxProvider = Provider<Box<PlayerModel>>((ref) {
  return Hive.box<PlayerModel>(HiveBoxes.player);
});

final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  final box = ref.watch(playerBoxProvider);
  return PlayerRepository(box);
});

/// Box de contas do login local.
final accountsBoxProvider = Provider<Box<UserAccountModel>>((ref) {
  return Hive.box<UserAccountModel>(HiveBoxes.accounts);
});

/// Box de sessão (guarda apenas o id da conta logada).
final sessionBoxProvider = Provider<Box>((ref) {
  return Hive.box(HiveBoxes.session);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    accountsBox: ref.watch(accountsBoxProvider),
    sessionBox: ref.watch(sessionBoxProvider),
  );
});
