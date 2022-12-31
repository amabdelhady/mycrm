class VisitingData {
  int? id;
  String? medicineName;
  String? samples;
  String? visitingDate;
  String? visitingTime;
  String? visitingDateTime;
  String? notes;

  VisitingData(
      {this.id,
        this.medicineName,
        this.samples,
        this.visitingDate,
        this.visitingTime,
        this.visitingDateTime,
        this.notes});

  factory VisitingData.fromJson(Map<String, dynamic> json) {
    return VisitingData(
      id: json['id'],
      medicineName: json['medicineName'],
      samples: json['samples'],
      visitingDate: json['visitingDate'],
      visitingTime: json['visitingTime'],
      visitingDateTime: json['visitingDateTime'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medicineName'] = medicineName;
    data['samples'] = samples;
    data['visitingDate'] = visitingDate;
    data['visitingTime'] = visitingTime;
    data['visitingDateTime'] = visitingDateTime;
    data['notes'] = notes;
    return data;
  }
}