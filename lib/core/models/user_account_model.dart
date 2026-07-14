import 'package:hive/hive.dart';
import '../constants/hive_constants.dart';

/// Conta de usuário do sistema de login local.
///
/// A senha nunca é armazenada em texto puro: apenas [passwordHash]
/// (hash de `salt + senha`) e [salt] são persistidos. Ver
/// `features/auth/auth_service.dart` para a lógica de hashing.
///
/// Assim como [PlayerModel], esta classe é escrita à mão (sem Freezed/
/// build_runner) para que o projeto compile sem etapa de geração de
/// código.
class UserAccountModel {
  final String id;
  final String username;
  final String passwordHash;
  final String salt;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  const UserAccountModel({
    required this.id,
    required this.username,
    required this.passwordHash,
    required this.salt,
    required this.createdAt,
    this.lastLoginAt,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'] as String,
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      salt: json['salt'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'passwordHash': passwordHash,
      'salt': salt,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt?.toIso8601String(),
    };
  }

  UserAccountModel copyWith({
    String? id,
    String? username,
    String? passwordHash,
    String? salt,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return UserAccountModel(
      id: id ?? this.id,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      salt: salt ?? this.salt,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          passwordHash == other.passwordHash &&
          salt == other.salt &&
          createdAt == other.createdAt &&
          lastLoginAt == other.lastLoginAt;

  @override
  int get hashCode =>
      Object.hash(id, username, passwordHash, salt, createdAt, lastLoginAt);

  @override
  String toString() => 'UserAccountModel(id: $id, username: $username)';
}

/// Adapter do Hive para [UserAccountModel], escrito manualmente. Ver
/// nota em `PlayerModelAdapter` sobre `typeId` e ordem dos campos.
class UserAccountModelAdapter extends TypeAdapter<UserAccountModel> {
  @override
  final int typeId = HiveTypeIds.userAccount;

  @override
  UserAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccountModel(
      id: fields[0] as String,
      username: fields[1] as String,
      passwordHash: fields[2] as String,
      salt: fields[3] as String,
      createdAt: fields[4] as DateTime,
      lastLoginAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAccountModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.passwordHash)
      ..writeByte(3)
      ..write(obj.salt)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.lastLoginAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
