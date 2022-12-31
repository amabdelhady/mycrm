import 'package:flutter/material.dart';
import 'package:newnew/consts/icons.dart';

import '../models/visiting_model.dart';

class VisitingList extends StatefulWidget {

  final List<VisitingData> visiting;
  const VisitingList({Key? key, required this.visiting}) : super(key: key);

  @override
  State<VisitingList> createState() => _VisitingListState(this.visiting);
}

class _VisitingListState extends State<VisitingList> {
  _VisitingListState(this.visiting);
  List<VisitingData> visiting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: visiting.length,
          itemBuilder: (context, index) {
            var item = visiting[index];
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: doctorIcon,
                  title: Text(item.id.toString()),
                  trailing: GestureDetector(
                      child: REMOVE_ICON,
                      onTap: () {
                        setState(() => visiting.remove(item));
                      }),
                ),
              ),
            );
          }),
    );
  }
}
