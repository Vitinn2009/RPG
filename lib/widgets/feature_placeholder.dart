import 'package:flutter/material.dart';
import '../core/theme/app_text_styles.dart';

/// Placeholder visual reutilizável para telas de features ainda em
/// construção. Substituir por conteúdo real conforme cada feature for
/// especificada pelo Arquiteto.
class FeaturePlaceholder extends StatelessWidget {
  final String featureName;
  final IconData icon;

  const FeaturePlaceholder({
    super.key,
    required this.featureName,
    this.icon = Icons.construction_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(featureName, style: AppTextStyles.heading3),
          const SizedBox(height: 8),
          const Text(
            'Feature em construção.',
            style: AppTextStyles.bodySecondary,
          ),
        ],
      ),
    );
  }
}
