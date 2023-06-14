import 'package:flutter/material.dart';

class CabListNow extends StatefulWidget {
  const CabListNow({Key? key}) : super(key: key);

  @override
  State<CabListNow> createState() => _CabListNowState();
}

class _CabListNowState extends State<CabListNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book now"),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/img1.png",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                 SizedBox(width: 8),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Swift Desire",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Description of cab"),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("* Hatchback"),
                        SizedBox(width: 8),
                        Text("* AC"),
                        SizedBox(width: 8),
                        Text("* 4 Seats"),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ));
                      },
                      child: const Text(' book now'),
                    ),                  ],

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
