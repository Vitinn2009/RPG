/// Constantes globais do aplicativo.
///
/// Mantenha aqui apenas valores fixos e reutilizados em múltiplas
/// features. Constantes específicas de uma feature devem viver dentro
/// da própria pasta da feature.
class AppConstants {
  AppConstants._();

  static const String appName = 'Flutter RPG';
  static const String appVersion = '0.1.0';

  // Regras de negócio globais (valores-base, sem lógica).
  static const int playerBaseHp = 100;
  static const int playerBaseMp = 50;
  static const int playerBaseLevel = 1;
  static const int maxInventorySlots = 40;
  static const int maxEquipmentSlots = 8;

  // Timeouts / durações padrão.
  static const Duration defaultAnimationDuration = Duration(milliseconds: 250);
  static const Duration battleTurnDuration = Duration(seconds: 2);
}
