import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Barra de progresso reutilizável para HP, MP, EXP, etc.
///
/// Widget puramente visual — não contém nenhuma regra de negócio.
/// Quem calcula o percentual é sempre a camada de Provider/Service.
class StatBar extends StatelessWidget {
  final double percentage;
  final Color color;
  final String? label;
  final double height;

  const StatBar({
    super.key,
    required this.percentage,
    required this.color,
    this.label,
    this.height = 14,
  });

  @override
  Widget build(BuildContext context) {
    final clamped = percentage.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: AppTextStyles.caption),
          const SizedBox(height: 4),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: clamped,
            minHeight: height,
            backgroundColor: AppColors.surfaceVariant,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
