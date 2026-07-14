import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Masmorra".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `dungeon_service.dart` chamado a partir daqui),
/// nunca dentro de `dungeon_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final dungeonPlaceholderProvider = Provider<String>((ref) {
  return "Masmorra ainda não implementada";
});
