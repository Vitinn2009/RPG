import 'dart:math';
import '../../core/models/player_model.dart';
import 'battle_models.dart';

/// Regras puras de combate.
///
/// Nenhuma dependência de Flutter/Riverpod aqui de propósito — isso
/// torna o serviço fácil de testar isoladamente. O provider da feature
/// é quem orquestra o uso deste serviço e atualiza o estado da UI.
class BattleService {
  final Random _random;

  BattleService({Random? random}) : _random = random ?? Random();

  Enemy generateEnemy({required int playerLevel}) {
    final scaledHp = 30 + (playerLevel * 10);
    final scaledAttack = 4 + (playerLevel * 2);
    return Enemy(
      name: 'Monstro Selvagem',
      maxHp: scaledHp,
      currentHp: scaledHp,
      attack: scaledAttack,
    );
  }

  int calculatePlayerDamage(PlayerModel player) {
    final base = player.strength * 2;
    final variance = _random.nextInt(5);
    return base + variance;
  }

  int calculateEnemyDamage(Enemy enemy) {
    final variance = _random.nextInt(4);
    return enemy.attack + variance;
  }

  Enemy applyDamageToEnemy(Enemy enemy, int damage) {
    final newHp = max(0, enemy.currentHp - damage);
    return enemy.copyWith(currentHp: newHp);
  }

  PlayerModel applyDamageToPlayer(PlayerModel player, int damage) {
    final newHp = max(0, player.currentHp - damage);
    return player.copyWith(currentHp: newHp);
  }

  bool isEnemyDefeated(Enemy enemy) => enemy.currentHp <= 0;
  bool isPlayerDefeated(PlayerModel player) => player.currentHp <= 0;

  int calculateExpReward(Enemy enemy) => (enemy.maxHp * 1.5).round();
  int calculateGoldReward(Enemy enemy) => (enemy.maxHp * 0.8).round();
}
