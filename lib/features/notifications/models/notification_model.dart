// ignore_for_file: public_member_api_docs, sort_constructors_first

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final bool seen;
  final DateTime createdAt;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.seen,
    required this.createdAt,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? seen,
    DateTime? updateAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      seen: seen ?? this.seen,
      createdAt: updateAt ?? createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': int.tryParse(id) ?? id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'seen': seen ? 1 : 0,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'].toString(),
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      seen: map['seen'] == 1,
    );
  }

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, description: $description, update_at: $createdAt, seen: $seen)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.seen == seen;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        seen.hashCode;
  }
}
