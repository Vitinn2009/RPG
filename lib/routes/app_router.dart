import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/battle/battle_screen.dart';
import '../features/chat/chat_screen.dart';
import '../features/craft/craft_screen.dart';
import '../features/dungeon/dungeon_screen.dart';
import '../features/equipment/equipment_screen.dart';
import '../features/guild/guild_screen.dart';
import '../features/home/home_screen.dart';
import '../features/inventory/inventory_screen.dart';
import '../features/market/market_screen.dart';
import '../features/player/player_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/quests/quests_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/skills/skills_screen.dart';
import '../features/splash/splash_screen.dart';
import 'app_routes.dart';

/// Provider do [GoRouter] do app.
///
/// Mantido como Provider (não StateProvider) pois a configuração de
/// rotas é estática; navegação dinâmica é feita via `context.go/push`.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.battle,
        name: 'battle',
        builder: (context, state) => const BattleScreen(),
      ),
      GoRoute(
        path: AppRoutes.dungeon,
        name: 'dungeon',
        builder: (context, state) => const DungeonScreen(),
      ),
      GoRoute(
        path: AppRoutes.inventory,
        name: 'inventory',
        builder: (context, state) => const InventoryScreen(),
      ),
      GoRoute(
        path: AppRoutes.equipment,
        name: 'equipment',
        builder: (context, state) => const EquipmentScreen(),
      ),
      GoRoute(
        path: AppRoutes.skills,
        name: 'skills',
        builder: (context, state) => const SkillsScreen(),
      ),
      GoRoute(
        path: AppRoutes.quests,
        name: 'quests',
        builder: (context, state) => const QuestsScreen(),
      ),
      GoRoute(
        path: AppRoutes.guild,
        name: 'guild',
        builder: (context, state) => const GuildScreen(),
      ),
      GoRoute(
        path: AppRoutes.market,
        name: 'market',
        builder: (context, state) => const MarketScreen(),
      ),
      GoRoute(
        path: AppRoutes.craft,
        name: 'craft',
        builder: (context, state) => const CraftScreen(),
      ),
      GoRoute(
        path: AppRoutes.chat,
        name: 'chat',
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: AppRoutes.player,
        name: 'player',
        builder: (context, state) => const PlayerScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
});
