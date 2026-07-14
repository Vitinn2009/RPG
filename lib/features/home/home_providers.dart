import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers da feature "home".
///
/// Fundação mínima: a home ainda não tem menu/navegação para as
/// demais features (ver `home_screen.dart`). O menu completo e seus
/// providers serão implementados quando o Arquiteto especificar essa
/// etapa.
final homePlaceholderProvider = Provider<String>((ref) {
  return 'Home ainda não implementada';
});
