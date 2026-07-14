import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Crafting".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `craft_service.dart` chamado a partir daqui),
/// nunca dentro de `craft_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final craftPlaceholderProvider = Provider<String>((ref) {
  return "Crafting ainda não implementada";
});
