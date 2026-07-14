/// Funções puras de validação reutilizáveis em formulários.
class Validators {
  Validators._();

  static String? required(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName é obrigatório';
    }
    return null;
  }

  static String? minLength(String? value, int min, {String fieldName = 'Campo'}) {
    if (value == null || value.length < min) {
      return '$fieldName deve ter ao menos $min caracteres';
    }
    return null;
  }

  static String? maxLength(String? value, int max, {String fieldName = 'Campo'}) {
    if (value != null && value.length > max) {
      return '$fieldName deve ter no máximo $max caracteres';
    }
    return null;
  }
}
