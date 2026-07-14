import "package:flutter_riverpod/flutter_riverpod.dart";

/// Providers da feature "Habilidades".
///
/// Regra do projeto: toda regra de negócio desta feature deve viver
/// aqui (ou em um `skills_service.dart` chamado a partir daqui),
/// nunca dentro de `skills_screen.dart`.
///
/// Aguardando especificação do Arquiteto para implementação completa.
final skillsPlaceholderProvider = Provider<String>((ref) {
  return "Habilidades ainda não implementada";
});
