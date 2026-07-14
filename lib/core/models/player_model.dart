import 'package:hive/hive.dart';
import '../constants/app_constants.dart';
import '../constants/hive_constants.dart';

/// Modelo de dados do jogador.
///
/// Este é o modelo de referência do projeto: todo novo model que
/// precise ser persistido no Hive E serializado em JSON (ex.: para uma
/// futura API) deve seguir exatamente este padrão:
///   1. Classe imutável (todos os campos `final`), com `copyWith` manual.
///   2. Adapter do Hive escrito à mão (`TypeAdapter<T>`) logo abaixo da
///      classe, com um `typeId` único (ver [HiveTypeIds]).
///   3. `toJson`/`fromJson` manuais para uma futura serialização de API.
///
/// Observação: este projeto não usa `build_runner`/Freezed/JsonSerializable
/// de propósito — assim o app compila e roda sem nenhuma etapa de geração
/// de código.
class PlayerModel {
  final String id;
  final String name;
  final int level;
  final int currentHp;
  final int maxHp;
  final int currentMp;
  final int maxMp;
  final int experience;
  final int gold;
  final int strength;
  final int agility;
  final int intelligence;
  final int vitality;

  const PlayerModel({
    required this.id,
    required this.name,
    this.level = AppConstants.playerBaseLevel,
    this.currentHp = AppConstants.playerBaseHp,
    this.maxHp = AppConstants.playerBaseHp,
    this.currentMp = AppConstants.playerBaseMp,
    this.maxMp = AppConstants.playerBaseMp,
    this.experience = 0,
    this.gold = 0,
    this.strength = 1,
    this.agility = 1,
    this.intelligence = 1,
    this.vitality = 1,
  });

  /// Cria um jogador novo com valores-base.
  factory PlayerModel.initial({required String id, required String name}) {
    return PlayerModel(id: id, name: name);
  }

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      level: json['level'] as int? ?? AppConstants.playerBaseLevel,
      currentHp: json['currentHp'] as int? ?? AppConstants.playerBaseHp,
      maxHp: json['maxHp'] as int? ?? AppConstants.playerBaseHp,
      currentMp: json['currentMp'] as int? ?? AppConstants.playerBaseMp,
      maxMp: json['maxMp'] as int? ?? AppConstants.playerBaseMp,
      experience: json['experience'] as int? ?? 0,
      gold: json['gold'] as int? ?? 0,
      strength: json['strength'] as int? ?? 1,
      agility: json['agility'] as int? ?? 1,
      intelligence: json['intelligence'] as int? ?? 1,
      vitality: json['vitality'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'currentHp': currentHp,
      'maxHp': maxHp,
      'currentMp': currentMp,
      'maxMp': maxMp,
      'experience': experience,
      'gold': gold,
      'strength': strength,
      'agility': agility,
      'intelligence': intelligence,
      'vitality': vitality,
    };
  }

  PlayerModel copyWith({
    String? id,
    String? name,
    int? level,
    int? currentHp,
    int? maxHp,
    int? currentMp,
    int? maxMp,
    int? experience,
    int? gold,
    int? strength,
    int? agility,
    int? intelligence,
    int? vitality,
  }) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
      currentHp: currentHp ?? this.currentHp,
      maxHp: maxHp ?? this.maxHp,
      currentMp: currentMp ?? this.currentMp,
      maxMp: maxMp ?? this.maxMp,
      experience: experience ?? this.experience,
      gold: gold ?? this.gold,
      strength: strength ?? this.strength,
      agility: agility ?? this.agility,
      intelligence: intelligence ?? this.intelligence,
      vitality: vitality ?? this.vitality,
    );
  }

  double get hpPercentage => maxHp == 0 ? 0 : currentHp / maxHp;
  double get mpPercentage => maxMp == 0 ? 0 : currentMp / maxMp;
  bool get isAlive => currentHp > 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          level == other.level &&
          currentHp == other.currentHp &&
          maxHp == other.maxHp &&
          currentMp == other.currentMp &&
          maxMp == other.maxMp &&
          experience == other.experience &&
          gold == other.gold &&
          strength == other.strength &&
          agility == other.agility &&
          intelligence == other.intelligence &&
          vitality == other.vitality;

  @override
  int get hashCode => Object.hash(id, name, level, currentHp, maxHp, currentMp,
      maxMp, experience, gold, strength, agility, intelligence, vitality);

  @override
  String toString() => 'PlayerModel(id: $id, name: $name, level: $level)';
}

/// Adapter do Hive para [PlayerModel], escrito manualmente (sem
/// `hive_generator`). O `typeId` deve permanecer igual a
/// [HiveTypeIds.player] e a ordem dos campos gravados/lidos nunca deve
/// ser alterada — apenas adicionada ao final — para não corromper dados
/// já persistidos.
class PlayerModelAdapter extends TypeAdapter<PlayerModel> {
  @override
  final int typeId = HiveTypeIds.player;

  @override
  PlayerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerModel(
      id: fields[0] as String,
      name: fields[1] as String,
      level: fields[2] as int,
      currentHp: fields[3] as int,
      maxHp: fields[4] as int,
      currentMp: fields[5] as int,
      maxMp: fields[6] as int,
      experience: fields[7] as int,
      gold: fields[8] as int,
      strength: fields[9] as int,
      agility: fields[10] as int,
      intelligence: fields[11] as int,
      vitality: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.level)
      ..writeByte(3)
      ..write(obj.currentHp)
      ..writeByte(4)
      ..write(obj.maxHp)
      ..writeByte(5)
      ..write(obj.currentMp)
      ..writeByte(6)
      ..write(obj.maxMp)
      ..writeByte(7)
      ..write(obj.experience)
      ..writeByte(8)
      ..write(obj.gold)
      ..writeByte(9)
      ..write(obj.strength)
      ..writeByte(10)
      ..write(obj.agility)
      ..writeByte(11)
      ..write(obj.intelligence)
      ..writeByte(12)
      ..write(obj.vitality);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
