import 'package:flutter/material.dart';

/// Paleta de cores centralizada do app.
///
/// Toda cor usada na UI deve vir daqui — nunca hardcode um `Color(0x...)`
/// diretamente dentro de uma tela ou widget.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryDark = Color(0xFF5B21B6);
  static const Color secondary = Color(0xFFF59E0B);

  static const Color background = Color(0xFF0F0F14);
  static const Color surface = Color(0xFF1A1A22);
  static const Color surfaceVariant = Color(0xFF26262F);

  static const Color textPrimary = Color(0xFFF5F5F7);
  static const Color textSecondary = Color(0xFFA1A1AA);

  static const Color success = Color(0xFF22C55E);
  static const Color danger = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Cores temáticas de RPG.
  static const Color hpBar = Color(0xFFDC2626);
  static const Color mpBar = Color(0xFF2563EB);
  static const Color expBar = Color(0xFF16A34A);
  static const Color rarityCommon = Color(0xFF9CA3AF);
  static const Color rarityUncommon = Color(0xFF22C55E);
  static const Color rarityRare = Color(0xFF3B82F6);
  static const Color rarityEpic = Color(0xFFA855F7);
  static const Color rarityLegendary = Color(0xFFF59E0B);
}
