import 'package:hive_flutter/hive_flutter.dart';
import '../constants/hive_constants.dart';
import '../models/player_model.dart';
import '../models/user_account_model.dart';
import '../utils/app_logger.dart';

/// Responsável por inicializar o Hive e registrar todos os adapters
/// e boxes usados pelo app.
///
/// Chamado uma única vez em `main.dart`, antes de `runApp`.
/// Ao criar um novo model persistido, registre o adapter e abra a box
/// aqui — nunca chame `Hive.openBox` diretamente dentro de uma feature.
class HiveInitializer {
  HiveInitializer._();

  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;

    await Hive.initFlutter();

    _registerAdapters();
    await _openBoxes();

    _initialized = true;
    AppLogger.info('Hive inicializado com sucesso', tag: 'HIVE');
  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveTypeIds.player)) {
      Hive.registerAdapter(PlayerModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveTypeIds.userAccount)) {
      Hive.registerAdapter(UserAccountModelAdapter());
    }
    // Novos adapters (item, equipment, skill, quest, guild, market,
    // craftRecipe, appSettings) devem ser registrados aqui conforme
    // cada feature for implementada.
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<PlayerModel>(HiveBoxes.player);
    await Hive.openBox<UserAccountModel>(HiveBoxes.accounts);
    await Hive.openBox(HiveBoxes.session);
    // Demais boxes (inventory, equipment, skills, quests, guild,
    // market, craft, settings) devem ser abertas aqui quando os
    // respectivos models existirem.
  }
}
