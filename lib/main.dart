import 'package:flutter/material.dart';
import 'package:newnew/consts/colours.dart';
import 'package:newnew/screens/card_list.dart';
import 'package:newnew/screens/signing_in/register.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colourGreen,
      ),
      home: const DoctorsCardList(),
    );
  }
}

