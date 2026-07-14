import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Guilda".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `guild_service.dart` chamado a partir daqui),
/// nunca dentro de `guild_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final guildPlaceholderProvider = Provider<String>((ref) {
  return "Guilda ainda não implementada";
});
