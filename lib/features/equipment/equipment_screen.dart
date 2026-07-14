import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Equipamento".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `equipment_providers.dart` /
/// `equipment_service.dart`).
class EquipmentScreen extends StatelessWidget {
  const EquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Equipamento")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Equipamento"),
      ),
    );
  }
}
