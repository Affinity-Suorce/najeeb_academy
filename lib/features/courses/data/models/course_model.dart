// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';

List<CourseModel> courseModelFromJson(String str) {
  debugPrint(json.decode(str).toString());
  List<CourseModel> list = List<CourseModel>.from(json
      .decode(str)["data"]["my_classes"]
      .map((x) => CourseModel.fromJson(x)));
  for (CourseModel course in list) {
    course.subjects = List<Subject>.from(course.subjects!
        .where((subject) => (subject.forMe == null || subject.forMe == true)));
  }
  return list;
}

// String courseModelToJson(List<CourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
  CourseModel({
    this.id,
    this.name,
    this.classTypeId,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.classType,
    this.subjects,
  });

  dynamic id;
  String? name;
  int? classTypeId;
  DateTime? startDate;
  DateTime? endDate;
  dynamic createdAt;
  dynamic updatedAt;
  String? classType;
  List<Subject>? subjects;

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        id: json["id"],
        name: json["name"],
        classTypeId: json["class_type_id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        classType: json["class_type"],
        // subscribed: json["subscribed"]==0?false:true,
        subjects: List<Subject>.from(json["subjects"].map((x) =>
                // if (x["for_me"] == null || x["for_me"] == true) {
                // return
                Subject.fromJson(x)
            // }
            )),
      );
  }

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "class_type_id": classTypeId,
  //     "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
  //     "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
  //     "created_at": createdAt,
  //     "updated_at": updatedAt,
  //     "class_type": classType,
  //     "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
  // };
}

class Subject {
  Subject({
    this.id,
    this.name,
    this.slug,
    this.forMe,
    this.cost,
    this.package_id,
    this.teacherId,
    this.createdAt,
    this.updatedAt,
    this.teacher,
    this.lectures,
    this.subscribed,
  });

  dynamic id;
  bool? forMe;
  String? name;
  String? slug;
  String? cost;
  dynamic package_id;
  dynamic teacherId;
  dynamic createdAt;
  dynamic updatedAt;
  Teacher? teacher;
  List<Lecture>? lectures;
  bool? subscribed;

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
        id: json["id"],
        name: json["name"] ?? '',
        slug: json["slug"] ?? '',
        cost: json["cost"].toString() ?? '0',
        package_id: json["package_id"],
        teacherId: json["teacher_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        teacher: teacherValues.map![json["teacher"]],
        forMe: json["for_me"],
        subscribed: json["subscribed"],
        lectures: json["lectures"] != null
            ? List<Lecture>.from(
                json["lectures"].map((x) => Lecture.fromJson(x)))
            : [],
      );
  }

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": nameValues.reverse[name],
  //       "slug": slugValues.reverse[slug],
  //       "cost": cost,
  //       "my_class_id": myClassId,
  //       "teacher_id": teacherId,
  //       "created_at": createdAt,
  //       "updated_at": updatedAt,
  //       "teacher": teacherValues.reverse[teacher],
  //       "lectures": lectures,
  //     };
}

// ignore: constant_identifier_names
enum Teacher { TEACHER_CHIKE }

final teacherValues = EnumValues({"Teacher Chike": Teacher.TEACHER_CHIKE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
