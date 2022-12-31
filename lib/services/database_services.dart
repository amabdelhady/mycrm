import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newnew/models/medical_rep_model.dart';

class DatabaseService{

  CollectionReference user = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(email, firstName, lastName,
      phoneNumber, gender) async{

    FirebaseAuth _auth = FirebaseAuth.instance;
    String uid = _auth.currentUser!.uid.toString();

    MedicalRepModel userAppInfo = MedicalRepModel(
      uid: uid,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      phoneNumber: phoneNumber
    );
    var data = userAppInfo.toJson();

    user.add(data).whenComplete(() => print("User data added"))
        .catchError((e) => print(e));

    return;
  }

}