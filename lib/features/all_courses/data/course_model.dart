// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    this.id,
    this.name,
    this.classTypeId,
    this.createdAt,
    this.updatedAt,
    this.classType,
    this.subjects,
  });

  int? id;
  String? name;
  int? classTypeId;
  dynamic createdAt;
  dynamic updatedAt;
  String? classType;
  List<Subject>? subjects;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        name: json["name"],
        classTypeId: json["class_type_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        classType: json["class_type"],
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "class_type_id": classTypeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "class_type": classType,
        "subjects": subjects == null
            ? []
            : List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}

class Subject {
  Subject({
    this.id,
    this.name,
    this.slug,
    this.cost,
    this.myClassId,
    this.teacherId,
    this.createdAt,
    this.updatedAt,
    this.teacher,
    this.lectures,
  });

  int? id;
  String? name;
  String? slug;
  String? cost;
  int? myClassId;
  int? teacherId;
  dynamic createdAt;
  dynamic updatedAt;
  String? teacher;
  dynamic lectures;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        cost: json["cost"],
        myClassId: json["my_class_id"],
        teacherId: json["teacher_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        teacher: json["teacher"],
        lectures: json["lectures"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "cost": cost,
        "my_class_id": myClassId,
        "teacher_id": teacherId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "teacher": teacher,
        "lectures": lectures,
      };
}
