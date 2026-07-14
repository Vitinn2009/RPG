import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Mercado".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `market_service.dart` chamado a partir daqui),
/// nunca dentro de `market_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final marketPlaceholderProvider = Provider<String>((ref) {
  return "Mercado ainda não implementada";
});
