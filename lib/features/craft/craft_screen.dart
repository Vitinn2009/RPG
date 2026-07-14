import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Crafting".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `craft_providers.dart` /
/// `craft_service.dart`).
class CraftScreen extends StatelessWidget {
  const CraftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crafting")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Crafting"),
      ),
    );
  }
}
