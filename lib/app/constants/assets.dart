abstract class Assets {
  static const _path = 'assets';
  static const images = _Images(_path);
  static const fonts = _Fonts();
}

class _Images {
  static const _path = 'images';
  final String _parent;

  const _Images(this._parent);

  String boarding(int index) => '$_parent/$_path/boarding_$index.png';
  String get logo => '$_parent/$_path/logo.png';
}

class _Fonts {
  const _Fonts();

  String get janna => 'Janna';
}
