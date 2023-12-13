import 'package:flutter/material.dart';

List<Widget> buildAppBarActions(String formattedDate) {
  return [
    IconButton(
      icon: Icon(Icons.calendar_month_rounded),
      onPressed: () {
        // Handle calendar icon press
      },
      splashColor: Colors.transparent,
    ),
    GestureDetector(
      onTap: () {
        // Handle date text press
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 16.0),
        child: Text(
          formattedDate,
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
  ];
}
