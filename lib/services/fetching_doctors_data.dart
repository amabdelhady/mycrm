import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:newnew/models/doctors_model.dart';
import 'package:newnew/screens/doctor_id.dart';
import '../consts/icons.dart';
import '../consts/strings.dart';

/**
DoctorsData doctorsData = DoctorsData();

fetchingData() {
  Future<String> fetchDoctors() async {
    DatabaseReference ref =
    FirebaseDatabase.instance.ref('doctors/${doctorsData.code}');
    DataSnapshot snapshot = await ref.get();
    var doctorsMap = Map<String, dynamic>.from(snapshot.value as Map);
    var title = doctorsMap["code"];
    return title;
  }
}

//New addCarsToList
Future<void> addCarsToList(LastDocumentTracker tracker,
    {FilterBy filter}) async {
  //Tracker as required and filter as optional
  bool hasFilter = filter != null;
  var lastSnap = tracker.getLastSnap(filtered: hasFilter);
  bool isFirst = lastSnap != null;
  var dcs;

  try {
    if (hasFilter) {
      dcs = isFirst ? await carsCollection.orderBy('dueDate').limit(5)
          .where('readyToRepair', isEqualTo: false).get()
          : await carsCollection.orderBy('dueDate').startAfterDocument(lastSnap)
          .limit(5).where('readyToRepair', isEqualTo: false).get();

      DatabaseReference ref =
      FirebaseDatabase.instance.ref('doctors/${doctorsData.code}/$filter');
      DataSnapshot snapshot = await ref.get();
      var doctorsMap = Map<String, dynamic>.from(snapshot.value as Map);
    } else {
      fetchingData();
  }

  for (var doc in dcs.docs) {
  Cars carValue = singleCar(doc); // Make it get a single document, what's the point on passing both a list and an index ?
  if (_cars.every((item) => item.carId != carValue.carId)) { //questionable
  _cars.add(carValue);
  notifyListeners();
  }
  }

  lastDocTracker.changeLastDocument(dcs.docs.last, filtered: hasFilter);
  } catch (e) {
  print(e);
  }
}

**/