/// Funções puras de formatação reutilizáveis em toda a UI.
class Formatters {
  Formatters._();

  /// Formata números grandes de forma compacta (ex.: 1200 -> "1.2K").
  static String compactNumber(num value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toStringAsFixed(0);
  }

  /// Formata uma [Duration] no formato mm:ss.
  static String duration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  /// Formata um percentual (0.0 - 1.0) como string "NN%".
  static String percentage(double value) {
    return '${(value * 100).clamp(0, 100).toStringAsFixed(0)}%';
  }
}
