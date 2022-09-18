// To parse this JSON data, do
//
//     final item = itemFromMap(jsonString);

import 'dart:convert';

class Item {
  Item({
    required this.link,
    required this.state,
    required this.stateDescription,
    required this.editable,
    required this.type,
    required this.name,
    required this.label,
    required this.category,
    required this.tags,
    required this.groupNames,
  });

  String link;
  String state;
  StateDescription stateDescription;
  bool editable;
  String type;
  String name;
  String label;
  String category;
  List<String> tags;
  List<dynamic> groupNames;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        link: json["link"],
        state: json["state"],
        stateDescription: StateDescription.fromMap(json["stateDescription"]),
        editable: json["editable"],
        type: json["type"],
        name: json["name"],
        label: json["label"],
        category: json["category"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        groupNames: List<dynamic>.from(json["groupNames"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "link": link,
        "state": state,
        "stateDescription": stateDescription.toMap(),
        "editable": editable,
        "type": type,
        "name": name,
        "label": label,
        "category": category,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "groupNames": List<dynamic>.from(groupNames.map((x) => x)),
      };
}

class StateDescription {
  StateDescription({
    required this.pattern,
    required this.readOnly,
    required this.options,
  });

  String pattern;
  bool readOnly;
  List<dynamic> options;

  factory StateDescription.fromJson(String str) =>
      StateDescription.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StateDescription.fromMap(Map<String, dynamic> json) =>
      StateDescription(
        pattern: json["pattern"],
        readOnly: json["readOnly"],
        options: List<dynamic>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "pattern": pattern,
        "readOnly": readOnly,
        "options": List<dynamic>.from(options.map((x) => x)),
      };
}
