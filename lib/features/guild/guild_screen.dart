import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Guilda".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `guild_providers.dart` /
/// `guild_service.dart`).
class GuildScreen extends StatelessWidget {
  const GuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guilda")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Guilda"),
      ),
    );
  }
}
