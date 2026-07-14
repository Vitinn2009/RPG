import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Equipamento".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `equipment_service.dart` chamado a partir daqui),
/// nunca dentro de `equipment_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final equipmentPlaceholderProvider = Provider<String>((ref) {
  return "Equipamento ainda não implementada";
});
