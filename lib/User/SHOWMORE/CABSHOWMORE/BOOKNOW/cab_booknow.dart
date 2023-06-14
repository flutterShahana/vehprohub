import 'package:flutter/material.dart';

import 'LISTBOOKNOW/cab_list_now.dart';

class CabBooknow extends StatefulWidget {
  const CabBooknow({Key? key}) : super(key: key);

  @override
  State<CabBooknow> createState() => _CabBooknowState();
}

class _CabBooknowState extends State<CabBooknow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CAR BOOKING"),
      ),
      body: Card(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.type_specimen_outlined),
                ),
              ),
            ),
            const SizedBox(height: 18.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'From',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
            ),

            const SizedBox(height: 18.0),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'To',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
            ),

            const SizedBox(height: 18.0),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Pickup Time',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
            ),

            const SizedBox(height: 18.0),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CabListNow())),
                  child: const Text(
                    'SEARCH',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
