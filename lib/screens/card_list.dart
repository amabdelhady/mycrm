import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:newnew/models/doctors_model.dart';
import 'package:newnew/screens/doctor_id.dart';
import '../consts/icons.dart';
import '../consts/strings.dart';

class DoctorsCardList extends StatefulWidget {
  const DoctorsCardList({Key? key}) : super(key: key);

  @override
  State<DoctorsCardList> createState() => _DoctorsCardListState();
}

class _DoctorsCardListState extends State<DoctorsCardList> {

  DoctorsData doctorsData = DoctorsData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: dataTextBarTitle,
        actions: const <Widget>[
          IconButton(
              onPressed: null,
              icon: Icon(Icons.filter_alt_outlined),
          )
        ],
      ),
      body: _firebaseItemBuilder(),
    );
  }
/**
  Future<Map<String, dynamic> > fetchDoctors() async{
    DatabaseReference ref =
    FirebaseDatabase.instance.ref('doctors/${doctorsData.code}');
    DataSnapshot snapshot = await ref.get();
    var doctorsMap = Map<String, dynamic>.from(snapshot.value as Map);
    //var title = doctorsMap["code"];
    return doctorsMap;
  }

  Future loadDoctorsList() async {
    DatabaseReference ref =
    FirebaseDatabase.instance.ref('doctors/${doctorsData.code}');
    DataSnapshot snapshot = await ref.get();
    final jsonResponse = json.decode(ref);
    DoctorsDataList doctorsDataList = DoctorsDataList.fromJson(jsonResponse);
    print("doctor ${doctorsDataList.doctorsDataList?[0].name}");
  }
**/
  Widget _firebaseItemBuilder(){
    return Center(
      child: FirebaseAnimatedList(
        query: FirebaseDatabase.instance
        .ref().child('doctors')
        .orderByChild('doctorClass'),
        itemBuilder: (_,DataSnapshot snapshot, Animation<double> animation, index){
          var doctorsMap = Map<String, dynamic>.from(snapshot.value as Map);
          if (snapshot.value==null) {
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.value!=null){
            return Padding(
                padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Card(
                    margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: Row(
                      children: <Widget>[
                        doctorIcon,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Text(doctorsMap['name']),
                            Text("الكود: ${doctorsMap['code']}"),
                            Text("الدرجة: ${doctorsMap['doctorClass']}"),
                            Text("التخصص: ${doctorsMap['speciality']}"),
                            Text("المنطقة: ${doctorsMap['area']}"),
                            Text("القرية: ${doctorsMap['region']}"),
                          ],
                        ),
                      ],
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorID(
                              code: doctorsMap['code'],
                              name: doctorsMap['name'],
                              doctorClass:doctorsMap['doctorClass'],
                              speciality: doctorsMap['speciality'],
                              area: doctorsMap['area'],
                              region: doctorsMap['region'])));
                },
              ),
            );
          }
          return errorText;
        },
      ),
    );
  }


}
