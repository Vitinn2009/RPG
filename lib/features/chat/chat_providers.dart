import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Chat".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `chat_service.dart` chamado a partir daqui),
/// nunca dentro de `chat_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final chatPlaceholderProvider = Provider<String>((ref) {
  return "Chat ainda não implementada";
});
