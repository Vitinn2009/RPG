import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../player/player_providers.dart';
import 'battle_models.dart';
import 'battle_service.dart';

final battleServiceProvider = Provider<BattleService>((ref) => BattleService());

/// Controla o fluxo de uma batalha (iniciar, atacar, finalizar).
///
/// Toda a regra de negócio de combate é delegada ao [BattleService];
/// este notifier só orquestra chamadas e persiste o resultado do
/// jogador via [currentPlayerProvider] — a `battle_screen.dart` apenas
/// observa `state` e chama os métodos públicos.
class BattleNotifier extends StateNotifier<BattleState> {
  final BattleService _service;
  final Ref _ref;

  BattleNotifier(this._service, this._ref) : super(const BattleState());

  void startBattle() {
    final player = _ref.read(currentPlayerProvider).value;
    if (player == null) return;

    final enemy = _service.generateEnemy(playerLevel: player.level);
    state = BattleState(
      status: BattleStatus.ongoing,
      enemy: enemy,
      log: ['Um ${enemy.name} selvagem apareceu!'],
    );
  }

  Future<void> attack() async {
    final enemy = state.enemy;
    final player = _ref.read(currentPlayerProvider).value;
    if (enemy == null || player == null || state.status != BattleStatus.ongoing) return;

    final playerDamage = _service.calculatePlayerDamage(player);
    var updatedEnemy = _service.applyDamageToEnemy(enemy, playerDamage);
    final log = [...state.log, '${player.name} causou $playerDamage de dano.'];

    if (_service.isEnemyDefeated(updatedEnemy)) {
      final exp = _service.calculateExpReward(enemy);
      final gold = _service.calculateGoldReward(enemy);
      final updatedPlayer = player.copyWith(
        experience: player.experience + exp,
        gold: player.gold + gold,
      );
      await _ref.read(currentPlayerProvider.notifier).updatePlayer(updatedPlayer);

      state = state.copyWith(
        status: BattleStatus.victory,
        enemy: updatedEnemy,
        log: [...log, 'Inimigo derrotado! +$exp EXP, +$gold ouro.'],
      );
      return;
    }

    final enemyDamage = _service.calculateEnemyDamage(updatedEnemy);
    final updatedPlayer = _service.applyDamageToPlayer(player, enemyDamage);
    await _ref.read(currentPlayerProvider.notifier).updatePlayer(updatedPlayer);

    log.add('${enemy.name} revidou com $enemyDamage de dano.');

    if (_service.isPlayerDefeated(updatedPlayer)) {
      state = state.copyWith(status: BattleStatus.defeat, enemy: updatedEnemy, log: log);
      return;
    }

    state = state.copyWith(enemy: updatedEnemy, log: log);
  }

  void resetBattle() => state = const BattleState();
}

final battleProvider = StateNotifierProvider<BattleNotifier, BattleState>((ref) {
  final service = ref.watch(battleServiceProvider);
  return BattleNotifier(service, ref);
});
