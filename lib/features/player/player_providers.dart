import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/player_model.dart';
import '../../core/providers/core_providers.dart';

/// Estado assíncrono do jogador atual.
///
/// Toda regra de leitura/persistência do jogador fica aqui — a tela
/// (`player_screen.dart`) apenas observa este provider.
class CurrentPlayerNotifier extends AsyncNotifier<PlayerModel?> {
  @override
  Future<PlayerModel?> build() async {
    final repository = ref.watch(playerRepositoryProvider);
    final result = repository.getPlayer();
    return result.when(
      success: (data) => data,
      failure: (message, cause) => throw Exception(message),
    );
  }

  /// Cria um personagem novo caso ainda não exista.
  Future<void> createPlayer({required String id, required String name}) async {
    final repository = ref.read(playerRepositoryProvider);
    final newPlayer = PlayerModel.initial(id: id, name: name);

    state = const AsyncLoading();
    final result = await repository.savePlayer(newPlayer);
    result.when(
      success: (_) => state = AsyncData(newPlayer),
      failure: (message, cause) => state = AsyncError(message, StackTrace.current),
    );
  }

  /// Atualiza e persiste o jogador (usado por outras features, ex.:
  /// battle, quests, market, ao alterar HP, gold, exp, etc.).
  Future<void> updatePlayer(PlayerModel updated) async {
    final repository = ref.read(playerRepositoryProvider);
    final result = await repository.savePlayer(updated);
    result.when(
      success: (_) => state = AsyncData(updated),
      failure: (message, cause) => state = AsyncError(message, StackTrace.current),
    );
  }
}

final currentPlayerProvider = AsyncNotifierProvider<CurrentPlayerNotifier, PlayerModel?>(
  CurrentPlayerNotifier.new,
);
