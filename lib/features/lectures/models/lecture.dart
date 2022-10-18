import 'dart:convert';

// List<Lecture> lectureFromJson(String str) => List<Lecture>.from(json.decode(str).map((x) => Lecture.fromJson(x)));
Lecture lectureFromJson(String str) =>
    Lecture.fromJson(json.decode(str)['data']);

class Lecture {
  Lecture({
    this.id,
    this.subjectId,
    this.eventSubjectId,
    this.statusVideo,
    this.name,
    this.description,
    this.monthNumber,
    this.createdAt,
    this.updatedAt,
    this.videoUrl,
    this.filesPdf,
  });

  int? id;
  int? subjectId;
  bool? statusVideo;
  int? eventSubjectId;
  String? name;
  String? description;
  int? monthNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? videoUrl;
  List<String>? filesPdf;

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        id: json["id"],
        subjectId: json["subject_id"],
        eventSubjectId: json["event_subject_id"],
        statusVideo: json["status_video"],
        name: json["name"],
        description: json["description"],
        monthNumber: json["month_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        videoUrl: json["video_url"] ?? "",
        filesPdf: json["files_pdf"] != null
            ? List<String>.from(json["files_pdf"].map((x) => x))
            : [],
      );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "subject_id": subjectId,
  //     "name": name,
  //     "description": description,
  //     "month_number": monthNumber,
  //     "created_at": createdAt.toIso8601String(),
  //     "updated_at": updatedAt.toIso8601String(),
  //     "video_url": videoUrl,
  //     "files_pdf": List<dynamic>.from(filesPdf.map((x) => x)),
  // };
}
