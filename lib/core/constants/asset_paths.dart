/// Caminhos de assets centralizados.
///
/// Ao adicionar um novo asset, registre-o também em `pubspec.yaml`.
class AssetPaths {
  AssetPaths._();

  static const String _images = 'assets/images';
  static const String _icons = 'assets/icons';

  static const String logo = '$_images/logo.png';
  static const String placeholderAvatar = '$_images/placeholder_avatar.png';
  static const String placeholderItem = '$_icons/placeholder_item.png';
}
