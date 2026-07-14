import 'package:flutter/material.dart';
import '../core/theme/app_text_styles.dart';

/// Card de seção reutilizável — usado para agrupar conteúdo dentro das
/// telas de todas as features (inventory, skills, quests, etc.).
class AppSectionCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppSectionCard({
    super.key,
    this.title,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Text(title!, style: AppTextStyles.heading3),
              const SizedBox(height: 12),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
