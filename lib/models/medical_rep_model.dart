class MedicalRepModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phoneNumber;

  MedicalRepModel(
      {this.uid,
        this.firstName,
        this.lastName,
        this.gender,
        this.email,
        this.phoneNumber});

  factory MedicalRepModel.fromJson(Map<String, dynamic> json) {
    return MedicalRepModel(
      uid: json['uid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}