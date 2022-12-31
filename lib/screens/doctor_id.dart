import 'package:flutter/material.dart';
import 'package:newnew/consts/icons.dart';
import 'package:newnew/consts/strings.dart';
import 'package:intl/intl.dart';

class DoctorID extends StatefulWidget {
  final dynamic code;
  final dynamic name;
  final dynamic doctorClass;
  final dynamic speciality;
  final dynamic area;
  final dynamic region;

  const DoctorID({
    super.key,
    required this.code,
    required this.name,
    required this.doctorClass,
    required this.speciality,
    required this.area,
    required this.region,
  });

  @override
  State<DoctorID> createState() => _DoctorIDState();
}

class _DoctorIDState extends State<DoctorID> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDateTime = DateTime.now();
  bool showDateTime = false;

  //Select Date
  Future<DateTime> _selectedDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    // if there is a selected value and this value isn't equal to the selected
    //date value, so it means the user has selected a value
    // and the selected value will be the new value of selectedDate
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  //Select Time
  Future<TimeOfDay> _selectedTime(BuildContext context) async {
    final selected =
    await showTimePicker(context: context, initialTime: selectedTime);

    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  //Select Date and time
  Future _selectedDateTime(BuildContext context) async {
    final date = await _selectedDate(context);
    if (date == null) return selectedDate;

    final time = await _selectedTime(context);
    if (time == null) return selectedTime;

    setState(() {
      selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDateTime() {
    if (selectedDateTime == null) {
      return "select Date and Time";
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(selectedDateTime);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: doctorIDTextBarTitle,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _selectedDateTime(context);
              showDateTime = true;
            },
            icon: scheduleIcon,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              doctorLargeIcon,
              showDateTime ? Text("موعد الزيارة: ${getDateTime()}")
                  : const Text(" "),
              Text("الاسم: ${widget.name}"),
              Text("الكود: ${widget.code}"),
              Text("التخصص: ${widget.speciality}"),
              Text("المنطقة: ${widget.region}"),
              Text("القرية: ${widget.area}"),
            ],
          ),
        ),
      ),
    );
  }
}
