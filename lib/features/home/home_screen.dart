import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_text_styles.dart';
import '../auth/auth_providers.dart';

/// Tela Home — fundação mínima ("home vazia").
///
/// Sem menu e sem navegação para as demais features ainda: cada
/// sistema (battle, inventory, guild, etc.) será plugado aqui somente
/// quando especificado pelo Arquiteto em prompt futuro.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider).value;
    final username = auth?.user?.username;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text(
          username != null ? 'Bem-vindo, $username' : 'Home',
          style: AppTextStyles.heading2,
        ),
      ),
    );
  }
}
