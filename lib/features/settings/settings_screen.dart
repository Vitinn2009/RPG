import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Ajustes".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `settings_providers.dart` /
/// `settings_service.dart`).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajustes")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Ajustes"),
      ),
    );
  }
}
