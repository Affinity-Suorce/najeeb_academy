import 'dart:convert';

// List<Lecture> lectureFromJson(String str) => List<Lecture>.from(json.decode(str).map((x) => Lecture.fromJson(x)));
Lecture lectureFromJson(String str) {
  return Lecture.fromJson(json.decode(str));
}

class Lecture {
  Lecture({
    this.id,
    this.subjectId,
    this.eventSubjectId,
    this.statusVideo,
    this.name,
    this.description,
    this.monthNumber,
    this.timePush,
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
  DateTime? timePush;
  DateTime? updatedAt;
  String? videoUrl;
  List<String>? filesPdf;

  factory Lecture.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    return Lecture(
        id: json["id"],
        subjectId: json["subject_id"]??1 ,
        eventSubjectId: json["event_subject_id"]??1,
        statusVideo: json["status_video"]??true,
        name: json["name"],
        description: json["description"]??"",
        monthNumber: json["month_number"],
        timePush: DateTime.parse(
              json['time_publish']),
        updatedAt: json["updated_at"]!=null ? DateTime.parse(json["updated_at"]) : null,
        videoUrl: json["video_link"] ?? json["video_url"] ?? "",
        filesPdf: json["files_pdf"] != null
            ? List<String>.from(json["files_pdf"].map((x) => x["pdf_link"]))
            : [],
      );
  }

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
