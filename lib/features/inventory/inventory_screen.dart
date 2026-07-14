import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Inventário".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `inventory_providers.dart` /
/// `inventory_service.dart`).
class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventário")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Inventário"),
      ),
    );
  }
}
