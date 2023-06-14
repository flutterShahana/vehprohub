import 'package:flutter/material.dart';

class ProviderAdofferView extends StatefulWidget {
  const ProviderAdofferView({Key? key}) : super(key: key);

  @override
  State<ProviderAdofferView> createState() => _ProviderAdofferViewState();
}

class _ProviderAdofferViewState extends State<ProviderAdofferView> {
  List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD & VIEW OFFERS'),
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
                      Text('Provider Name'),
                      Text('Contact number'),
                      Text('Date'),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add your edit button logic here
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {


        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
