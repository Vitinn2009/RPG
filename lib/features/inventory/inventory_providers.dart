import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Inventário".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `inventory_service.dart` chamado a partir daqui),
/// nunca dentro de `inventory_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final inventoryPlaceholderProvider = Provider<String>((ref) {
  return "Inventário ainda não implementada";
});
