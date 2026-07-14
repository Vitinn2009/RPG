import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Perfil".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `profile_service.dart` chamado a partir daqui),
/// nunca dentro de `profile_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final profilePlaceholderProvider = Provider<String>((ref) {
  return "Perfil ainda não implementada";
});
