// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);




EventModel eventModelFromJson(Map<String, dynamic> str) =>
    EventModel.fromJson(str);

// String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
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
        monday: List<String>.from(json["Monday"].map((x) => x)),
        tuesday: List<String>.from(json["Tuesday"].map((x) => x)),
        wednesday: List<String>.from(json["Wednesday"].map((x) => x)),
        thursday: List<String>.from(json["Thursday"].map((x) => x)),
        friday: List<String>.from(json["Friday"].map((x) => x)),
        saturday: List<String>.from(json["Saturday"].map((x) => x)),
        sunday: List<String>.from(json["Sunday"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Monday": List<dynamic>.from(monday.map((x) => x)),
        "Tuesday": List<dynamic>.from(tuesday.map((x) => x)),
        "Wednesday": List<dynamic>.from(wednesday.map((x) => x)),
        "Thursday": List<dynamic>.from(thursday.map((x) => x)),
        "Friday": List<dynamic>.from(friday.map((x) => x)),
        "Saturday": List<dynamic>.from(saturday.map((x) => x)),
        "Sunday": List<dynamic>.from(sunday.map((x) => x)),
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

}
