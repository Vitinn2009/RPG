import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Missões".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `quests_providers.dart` /
/// `quests_service.dart`).
class QuestsScreen extends StatelessWidget {
  const QuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Missões")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Missões"),
      ),
    );
  }
}
