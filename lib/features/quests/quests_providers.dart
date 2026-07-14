import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Missões".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `quests_service.dart` chamado a partir daqui),
/// nunca dentro de `quests_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final questsPlaceholderProvider = Provider<String>((ref) {
  return "Missões ainda não implementada";
});
