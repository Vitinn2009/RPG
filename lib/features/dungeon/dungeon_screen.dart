import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Masmorra".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `dungeon_providers.dart` /
/// `dungeon_service.dart`).
class DungeonScreen extends StatelessWidget {
  const DungeonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Masmorra")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Masmorra"),
      ),
    );
  }
}
