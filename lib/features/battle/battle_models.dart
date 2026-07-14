/// Inimigo simples de batalha. Modelo local à feature — não é
/// persistido no Hive, por isso não segue o padrão de `core/models`.
///
/// Classe escrita à mão (sem Freezed/build_runner) para o projeto
/// compilar e rodar sem etapa de geração de código.
class Enemy {
  final String name;
  final int maxHp;
  final int currentHp;
  final int attack;

  const Enemy({
    required this.name,
    required this.maxHp,
    required this.currentHp,
    required this.attack,
  });

  Enemy copyWith({
    String? name,
    int? maxHp,
    int? currentHp,
    int? attack,
  }) {
    return Enemy(
      name: name ?? this.name,
      maxHp: maxHp ?? this.maxHp,
      currentHp: currentHp ?? this.currentHp,
      attack: attack ?? this.attack,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Enemy &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          maxHp == other.maxHp &&
          currentHp == other.currentHp &&
          attack == other.attack;

  @override
  int get hashCode => Object.hash(name, maxHp, currentHp, attack);

  @override
  String toString() => 'Enemy(name: $name, currentHp: $currentHp/$maxHp)';
}

enum BattleStatus { idle, ongoing, victory, defeat }

/// Estado completo de uma batalha em andamento.
class BattleState {
  final BattleStatus status;
  final Enemy? enemy;
  final List<String> log;

  const BattleState({
    this.status = BattleStatus.idle,
    this.enemy,
    this.log = const <String>[],
  });

  BattleState copyWith({
    BattleStatus? status,
    Enemy? enemy,
    List<String>? log,
  }) {
    return BattleState(
      status: status ?? this.status,
      enemy: enemy ?? this.enemy,
      log: log ?? this.log,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BattleState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          enemy == other.enemy &&
          log == other.log;

  @override
  int get hashCode => Object.hash(status, enemy, log);

  @override
  String toString() => 'BattleState(status: $status, enemy: $enemy)';
}
