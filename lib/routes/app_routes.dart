/// Nomes e paths de rotas centralizados.
///
/// Nunca use strings soltas em `context.go(...)` — sempre referencie
/// esta classe. Ao adicionar uma feature nova, registre a rota aqui
/// e em `app_router.dart`.
class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String home = '/';

  /// Reservada para a tela de login (a ser implementada em prompt
  /// futuro). Ainda não registrada em `app_router.dart`.
  static const String login = '/login';
  static const String battle = '/battle';
  static const String dungeon = '/dungeon';
  static const String inventory = '/inventory';
  static const String equipment = '/equipment';
  static const String skills = '/skills';
  static const String quests = '/quests';
  static const String guild = '/guild';
  static const String market = '/market';
  static const String craft = '/craft';
  static const String chat = '/chat';
  static const String player = '/player';
  static const String profile = '/profile';
  static const String settings = '/settings';
}
