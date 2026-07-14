import 'package:hive/hive.dart';
import '../constants/hive_constants.dart';
import '../models/player_model.dart';
import '../services/storage_service.dart';
import '../utils/result.dart';

/// Repository do jogador.
///
/// Camada única responsável por ler/escrever [PlayerModel] no Hive.
/// Providers e Services de features (ex.: battle, quests) nunca devem
/// acessar o Hive diretamente — sempre passam por este repository.
class PlayerRepository {
  static const String _playerKey = 'current_player';

  final StorageService<PlayerModel> _storage;

  PlayerRepository(Box<PlayerModel> box) : _storage = StorageService<PlayerModel>(box);

  Result<PlayerModel?> getPlayer() => _storage.get(_playerKey);

  Future<Result<void>> savePlayer(PlayerModel player) => _storage.put(_playerKey, player);

  Future<Result<void>> deletePlayer() => _storage.delete(_playerKey);
}
