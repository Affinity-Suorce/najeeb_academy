abstract class Assets {
  static const _path = 'assets';
  static const images = _Images(_path);
}

class _Images {
  static const _path = 'images';
  final String _parent;

  const _Images(this._parent);

  String boarding(int index) => '$_parent/$_path/boarding_$index.png';
}
