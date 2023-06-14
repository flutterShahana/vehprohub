import 'package:flutter/material.dart';

class ProviderMybooking extends StatefulWidget {
  const ProviderMybooking({Key? key}) : super(key: key);

  @override
  State<ProviderMybooking> createState() => _ProviderMybookingState();
}

class _ProviderMybookingState extends State<ProviderMybooking> {
  List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD & DELETE BOOKINGS'),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Image.asset(images[index]),
                  ),
                  const SizedBox(width: 16.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Name'),
                      Text('Contact number'),
                      Text('Date'),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {



                        },
                        child: const Text('ADD'),
                      ),
                      const SizedBox(height: 16.0),

                  ElevatedButton(
                    onPressed: () {



                    },
                    child: const Text('DELETE'),
                  ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB button logic here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
