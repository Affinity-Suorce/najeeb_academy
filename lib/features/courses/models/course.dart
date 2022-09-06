class Course {
  final String id;
  final String title;
  final String price;
  final int lecturesCount;
  final String imagePath;

  const Course({
    required this.id,
    required this.title,
    required this.price,
    required this.lecturesCount,
    required this.imagePath,
  });

  static const all = [
    Course(
      id: '0',
      title: 'بكالوريا',
      price: '500,000 ل.س',
      lecturesCount: 10,
      imagePath: 'assets/images/logo.png',
    ),
    Course(
      id: '1',
      title: 'تاسع',
      price: '250,000 ل.س',
      lecturesCount: 6,
      imagePath: 'assets/images/logo.png',
    ),
    Course(
      id: '2',
      title: 'TOEFL',
      price: '250,000 ل.س',
      lecturesCount: 5,
      imagePath: 'assets/images/logo.png',
    ),
  ];
}
