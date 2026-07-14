import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Habilidades".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `skills_providers.dart` /
/// `skills_service.dart`).
class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habilidades")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Habilidades"),
      ),
    );
  }
}
