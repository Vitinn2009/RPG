import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Ajustes".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `settings_service.dart` chamado a partir daqui),
/// nunca dentro de `settings_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final settingsPlaceholderProvider = Provider<String>((ref) {
  return "Ajustes ainda não implementada";
});
