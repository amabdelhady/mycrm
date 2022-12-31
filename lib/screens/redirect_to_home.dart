import 'package:flutter/material.dart';
import 'package:newnew/screens/card_list.dart';

class RedirectToHome extends StatefulWidget {
  const RedirectToHome({super.key});

  @override
  RedirectToHomeState createState() => RedirectToHomeState();
}

class RedirectToHomeState extends State<RedirectToHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: redirectToHomeScreen(),
    );
  }
  redirectToHomeScreen(){
    Future.delayed(const Duration(seconds: 2)).then((_){
      Navigator.of(context).pop(
          MaterialPageRoute(
              builder: (context) => const DoctorsCardList())
      );
    });
  }
}