import 'package:flutter/material.dart';

import '../consts/colours.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

Container HEIGHT_CONTAINER = Container(height: 16.0,);

BoxDecoration BOX_DECORATION = BoxDecoration(
  color: WHITE,
  border: Border.all(
      width: 1.0,
      color:DARK_GREY),
  borderRadius: const BorderRadius.all(Radius.circular(5)),
);