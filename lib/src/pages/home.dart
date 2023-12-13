import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'datee.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formattedDate = DateFormat('d MMM').format(now);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1B1A43),
          title: Text("หน้าหลัก"),
          actions: buildAppBarActions(formattedDate),
        ),
      ),
    );
  }
}
