class Governorate {
  final String id;
  // final String value;
  final String name;

  const Governorate({
    required this.id,
    // required this.value,
    required this.name,
  });
// chickpeas

// tenderness

  static const List<Governorate> all = [
    Governorate(
      id: '0',
      // value: 'damascus',
      name: 'دمشق',
    ),
    Governorate(
      id: '1',
      // value: 'rif-dimashq',
      name: 'ريف دمشق',
    ),
    Governorate(
      id: '2',
      // value: 'aleppo',
      name: 'حلب',
    ),
    Governorate(
      id: '3',
      // value: 'homs',
      name: 'حمص',
    ),
    Governorate(
      id: '4',
      // value: 'latakia',
      name: 'اللاذقية',
    ),
    Governorate(
      id: '5',
      // value: 'hama',
      name: 'حماة',
    ),
    Governorate(
      id: '6',
      // value: 'tartous',
      name: 'طرطوس',
    ),
    Governorate(
      id: '7',
      // value: 'raqqa',
      name: 'الرقة',
    ),
    Governorate(
      id: '8',
      // value: 'der-alzoor',
      name: 'دير الزور',
    ),
    Governorate(
      id: '9',
      // value: 'sweida',
      name: 'السويداء',
    ),
    Governorate(
      id: '10',
      // value: 'al-hasakah',
      name: 'الحسكة',
    ),
    Governorate(
      id: '11',
      // value: 'daraa',
      name: 'درعا',
    ),
    Governorate(
      id: '12',
      // value: 'idlib',
      name: 'إدلب',
    ),
    Governorate(
      id: '13',
      // value: 'quneitra',
      name: 'القنيطرة',
    ),
  ];
}
