import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class WorkSite {
  int id;
  String name;
  String subName;
  String type;
  String staffName;
  late ImagePicker photo;
  String address;
  String status;
  late DateTime startAt;
  late DateTime endAt;
  late DateTime createdAt;
  late DateTime updatedAt;

  WorkSite({
    this.id = 0,
    this.name = "",
    this.subName = "",
    this.type = "",
    this.staffName = "",
    this.address = "",
    this.status = "",
  });

  factory WorkSite.fromJson(Map<String, dynamic> map) {
    return WorkSite(
        id: map["id"],
        name: map["name"],
        subName: map["sub_name"],
        type: map["type"],
        staffName: map["staff_name"],
        address: map["address"],
        status: map["status"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "sub_name": subName,
      "type": type,
      "staff_name": staffName,
      "address": address,
      "status": status
    };
  }

  @override
  String toString() {
    return 'WorkSite(id: $id, name: $name, sub_name: $subName, type: $type, staff_name: $staffName, address: $address, status: $status}';
  }
}

List<WorkSite> worksiteFromJsom(String jsonData) {
  final data = json.decode(jsonData);
  return List<WorkSite>.from(data.map((item) => WorkSite.fromJson(item)));
}

String worksiteToJson(WorkSite data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
