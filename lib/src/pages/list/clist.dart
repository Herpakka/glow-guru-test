import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../datee.dart';

enum CFilter { walking, running, cycling, hiking }

extension CFilterExtension on CFilter {
  String get name {
    switch (this) {
      case CFilter.walking:
        return '1111';
      case CFilter.running:
        return '2222';
      case CFilter.cycling:
        return '333333';
      case CFilter.hiking:
        return '4444444444';
    }
  }
}

class RDivider extends StatelessWidget {
  const RDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      height: 20,
      thickness: 1,
      indent: 20,
      endIndent: 0,
    );
  }
}

class CList extends StatefulWidget {
  const CList({Key? key});

  @override
  State<CList> createState() => _CListState();
}

class _CListState extends State<CList> {
  Set<CFilter> filters = <CFilter>{};

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formattedDate = DateFormat('d MMM').format(now);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 22, 220),
          title: Text("สกินแคร์"),
          actions: buildAppBarActions(formattedDate),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Wrap(
                spacing: 5.0,
                children: CFilter.values.map((CFilter cType) {
                  return FilterChip(
                    label: Text(cType.name),
                    selected: filters.contains(cType),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          filters.add(cType);
                        } else {
                          filters.remove(cType);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const RDivider(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            const RDivider(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            const RDivider(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
