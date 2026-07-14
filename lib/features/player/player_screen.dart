import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/app_primary_button.dart';
import '../../widgets/app_section_card.dart';
import '../../widgets/stat_bar.dart';
import 'player_providers.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(currentPlayerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Jogador')),
      body: SafeArea(
        child: playerAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Erro: $err')),
          data: (player) {
            if (player == null) {
              return Center(
                child: AppPrimaryButton(
                  label: 'Criar personagem',
                  onPressed: () => ref.read(currentPlayerProvider.notifier).createPlayer(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: 'Herói',
                      ),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                AppSectionCard(
                  title: player.name,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nível ${player.level} · ${player.gold} ouro'),
                      const SizedBox(height: 16),
                      StatBar(
                        percentage: player.hpPercentage,
                        color: AppColors.hpBar,
                        label: 'HP  ${player.currentHp}/${player.maxHp}',
                      ),
                      const SizedBox(height: 12),
                      StatBar(
                        percentage: player.mpPercentage,
                        color: AppColors.mpBar,
                        label: 'MP  ${player.currentMp}/${player.maxMp}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AppSectionCard(
                  title: 'Atributos',
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      Text('Força: ${player.strength}'),
                      Text('Agilidade: ${player.agility}'),
                      Text('Inteligência: ${player.intelligence}'),
                      Text('Vitalidade: ${player.vitality}'),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
