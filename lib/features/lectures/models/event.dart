// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);




import 'package:equatable/equatable.dart';

EventModel eventModelFromJson(Map<String, dynamic> str) =>
    EventModel.fromJson(str);

// String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel extends Equatable {
  EventModel({
    this.monday = const [],
    this.tuesday = const [],
    this.wednesday = const [],
    this.thursday = const [],
    this.friday = const [],
    this.saturday = const [],
    this.sunday = const [],
  });

  List<String> monday;
  List<String> tuesday;
  List<String> wednesday;
  List<String> thursday;
  List<String> friday;
  List<String> saturday;
  List<String> sunday;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        monday: List<String>.from(json["monday"].map((x) => x)),
        tuesday: List<String>.from(json["tuesday"].map((x) => x)),
        wednesday: List<String>.from(json["wednesday"].map((x) => x)),
        thursday: List<String>.from(json["thursday"].map((x) => x)),
        friday: List<String>.from(json["friday"].map((x) => x)),
        saturday: List<String>.from(json["saturday"].map((x) => x)),
        sunday: List<String>.from(json["sunday"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "monday": List<dynamic>.from(monday.map((x) => x)),
        "tuesday": List<dynamic>.from(tuesday.map((x) => x)),
        "wednesday": List<dynamic>.from(wednesday.map((x) => x)),
        "thursday": List<dynamic>.from(thursday.map((x) => x)),
        "friday": List<dynamic>.from(friday.map((x) => x)),
        "saturday": List<dynamic>.from(saturday.map((x) => x)),
        "sunday": List<dynamic>.from(sunday.map((x) => x)),
      };

  List<String> getAllInfo() {
    List<String> tempList = [];
    tempList.addAll(monday);
    tempList.addAll(tuesday);
    tempList.addAll(wednesday);
    tempList.addAll(thursday);
    tempList.addAll(friday);
    tempList.addAll(saturday);
    tempList.addAll(sunday);
    return tempList;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [monday,tuesday,wednesday,thursday,friday,saturday,sunday];

}
