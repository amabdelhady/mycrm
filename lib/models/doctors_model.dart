import 'dart:convert';

class DoctorsDataList{
  final List<DoctorsData>? doctorsDataList;

  DoctorsDataList({
    this.doctorsDataList,
  });

  factory DoctorsDataList.fromJson(List<dynamic> parsedJson) {
    List<DoctorsData> doctorsList = <DoctorsData>[];
    doctorsList = parsedJson.map((i)=>DoctorsData.fromJson(i)).toList();
    return DoctorsDataList(
        doctorsDataList: doctorsList
    );
  }
}

class DoctorsData {
  String? code;
  String? name;
  String? doctorClass;
  String? speciality;
  String? area;
  String? region;

  DoctorsData(
      {this.code,
      this.name,
      this.doctorClass,
      this.speciality,
      this.area,
      this.region});

  factory DoctorsData.fromJson(Map<dynamic, String> json) {
    return DoctorsData(
      code: json['code'],
      name: json['name'],
      doctorClass: json['doctorClass'],
      speciality: json['speciality'],
      area: json['area'],
      region: json['region'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['speciality'] = speciality;
    data['doctorClass'] = doctorClass;
    data['area'] = area;
    data['region'] = region;
    return data;
  }

}
