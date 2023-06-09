import 'package:flutter/material.dart';

class WorkshopUpcomingsts extends StatefulWidget {
  const WorkshopUpcomingsts({Key? key}) : super(key: key);

  @override
  State<WorkshopUpcomingsts> createState() => _WorkshopUpcomingstsState();
}

class _WorkshopUpcomingstsState extends State<WorkshopUpcomingsts> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Handle the first item separately
            return Card(
              elevation: 10,
              child: ListTile(
                title: Text(
                  items.first,
                ),
              ),
            );
          } else {
            return Card(
              elevation: 10,
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          }
        },
      ),
    );
  }
}