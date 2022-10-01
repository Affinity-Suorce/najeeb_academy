class Lecture {
    Lecture({
        this.globalData,
        this.video,
        this.pdf,
    });

    GlobalData? globalData;
    String? video;
    List<String>? pdf;

    factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        globalData: GlobalData.fromJson(json["global_data"]),
        video: json["video"],
        pdf: List<String>.from(json["pdf"].map((x) => x)),
    );

    // Map<String, dynamic> toJson() => {
    //     "global_data": globalData.toJson(),
    //     "video": video,
    //     "pdf": List<dynamic>.from(pdf.map((x) => x)),
    // };
}

class GlobalData {
    GlobalData({
        this.id,
        this.subjectId,
        this.name,
        this.description,
        this.monthNumber,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? subjectId;
    String? name;
    String? description;
    int? monthNumber;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory GlobalData.fromJson(Map<String, dynamic> json) => GlobalData(
        id: json["id"],
        subjectId: json["subject_id"],
        name: json["name"],
        description: json["description"],
        monthNumber: json["month_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "subject_id": subjectId,
    //     "name": name,
    //     "description": description,
    //     "month_number": monthNumber,
    //     "created_at": createdAt.toIso8601String(),
    //     "updated_at": updatedAt.toIso8601String(),
    // };
}
