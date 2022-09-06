class Lecture {
  final String id;
  final String name;
  final int classesCount;
  final String price;
  final String imagePath;

  const Lecture({
    required this.id,
    required this.name,
    required this.classesCount,
    required this.price,
    required this.imagePath,
  });

  static const all = [
    Lecture(
        id: '0',
        name: 'الفيزياء',
        classesCount: 10,
        price: '50,000 ل.س',
        imagePath: 'assets/images/physics.png'),
    Lecture(
        id: '1',
        name: 'الرياضيات',
        classesCount: 15,
        price: '65,000 ل.س',
        imagePath: 'assets/images/math.png'),
  ];
}
