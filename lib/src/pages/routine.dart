import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'datee.dart';

class Routine extends StatelessWidget {
  const Routine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formattedDate = DateFormat('d MMM').format(now);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 63, 62, 132),
          title: Text("รูทีน"),
          actions: buildAppBarActions(formattedDate),
        ),
      ),
    );
  }
}
