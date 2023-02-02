import 'dart:ffi';

class Stage {
  const Stage(
      {required this.title,
      required this.institution,
      required this.date,
      this.place,
      this.description});

  final String title;
  final String institution;
  final String date;
  final String? place;
  final List<String>? description;
}
