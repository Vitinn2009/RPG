/// Nomes de boxes e typeIds do Hive centralizados.
///
/// Nunca reutilize um typeId para dois modelos diferentes — isso corrompe
/// dados já persistidos. Sempre adicione novos ids ao final da lista.
class HiveBoxes {
  HiveBoxes._();

  static const String player = 'player_box';
  static const String inventory = 'inventory_box';
  static const String equipment = 'equipment_box';
  static const String skills = 'skills_box';
  static const String quests = 'quests_box';
  static const String guild = 'guild_box';
  static const String market = 'market_box';
  static const String craft = 'craft_box';
  static const String settings = 'settings_box';

  /// Contas de usuário do login local.
  static const String accounts = 'accounts_box';

  /// Box simples (chave única) que guarda o id da conta logada.
  static const String session = 'session_box';
}

/// typeIds reservados para os adapters gerados pelo Hive.
class HiveTypeIds {
  HiveTypeIds._();

  static const int player = 0;
  static const int item = 1;
  static const int equipment = 2;
  static const int skill = 3;
  static const int quest = 4;
  static const int guild = 5;
  static const int marketListing = 6;
  static const int craftRecipe = 7;
  static const int appSettings = 8;
  static const int userAccount = 9;
}
