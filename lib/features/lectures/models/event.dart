import 'dart:convert';

List<EventModel> eventModelFromJson(List json) => List<EventModel>.from(json.map((x) => EventModel.fromJson(x)));

// String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
    EventModel({
        this.subjectName,
        this.myClassName,
        this.lectureName,
        this.startTime,
        this.endTime,
        this.date,
    });

    String? subjectName;
    String? myClassName;
    String? lectureName;
    String? startTime;
    String? endTime;
    DateTime? date;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        subjectName: json["subject_name"],
        myClassName: json["my_class_name"],
        lectureName: json["lecture_name"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        date: DateTime.parse(json["date"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "subject_name": subjectName,
    //     "my_class_name": myClassName,
    //     "lecture_name": lectureName,
    //     "start_time": startTime,
    //     "end_time": endTime,
    //     "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    // };
}
