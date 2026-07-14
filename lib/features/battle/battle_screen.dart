import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/app_primary_button.dart';
import '../../widgets/app_section_card.dart';
import '../../widgets/stat_bar.dart';
import '../player/player_providers.dart';
import 'battle_models.dart';
import 'battle_providers.dart';

class BattleScreen extends ConsumerWidget {
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final battle = ref.watch(battleProvider);
    final player = ref.watch(currentPlayerProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Batalha')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (player != null)
                AppSectionCard(
                  title: player.name,
                  child: StatBar(
                    percentage: player.hpPercentage,
                    color: AppColors.hpBar,
                    label: 'HP  ${player.currentHp}/${player.maxHp}',
                  ),
                ),
              const SizedBox(height: 16),
              if (battle.enemy != null)
                AppSectionCard(
                  title: battle.enemy!.name,
                  child: StatBar(
                    percentage: battle.enemy!.currentHp / battle.enemy!.maxHp,
                    color: AppColors.danger,
                    label: 'HP  ${battle.enemy!.currentHp}/${battle.enemy!.maxHp}',
                  ),
                ),
              const SizedBox(height: 16),
              Expanded(
                child: AppSectionCard(
                  title: 'Log',
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: battle.log.length,
                    itemBuilder: (context, index) => Text(battle.log[index]),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _BattleActions(status: battle.status),
            ],
          ),
        ),
      ),
    );
  }
}

class _BattleActions extends ConsumerWidget {
  final BattleStatus status;

  const _BattleActions({required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(battleProvider.notifier);

    switch (status) {
      case BattleStatus.idle:
        return AppPrimaryButton(label: 'Iniciar batalha', onPressed: notifier.startBattle);
      case BattleStatus.ongoing:
        return AppPrimaryButton(label: 'Atacar', onPressed: notifier.attack);
      case BattleStatus.victory:
      case BattleStatus.defeat:
        return AppPrimaryButton(
          label: status == BattleStatus.victory ? 'Vitória! Nova batalha' : 'Derrota. Tentar novamente',
          onPressed: notifier.resetBattle,
        );
    }
  }
}
