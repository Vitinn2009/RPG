import "package:flutter/material.dart";
import "../../widgets/feature_placeholder.dart";

/// Tela da feature "Mercado".
///
/// Scaffold inicial — aguardando especificação do Arquiteto para
/// implementação da UI e da lógica (em `market_providers.dart` /
/// `market_service.dart`).
class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mercado")),
      body: const SafeArea(
        child: FeaturePlaceholder(featureName: "Mercado"),
      ),
    );
  }
}
