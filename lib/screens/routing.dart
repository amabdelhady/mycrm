import 'package:flutter/material.dart';
import 'package:newnew/consts/icons.dart';
import 'package:newnew/consts/strings.dart';
import 'card_list.dart';

//The main page that route user to Tasks page or Doctors List page
class RoutingIconButtons extends StatelessWidget {
  const RoutingIconButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: routingIconButtonsBar,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorsCardList()
                          ));
                    },
                    icon: tasksIcon),
                const SizedBox(
                  height: 60.0,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorsCardList()
                          ));
                    },
                    icon: data),
              ]
          ),
        ),
      ),
    );
  }
}
