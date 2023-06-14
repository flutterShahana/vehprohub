import 'package:flutter/material.dart';

import 'CABSHOWMORE/BOOKNOW/rent_booknow.dart';

class Rentalshowmore extends StatefulWidget {
  const Rentalshowmore({Key? key}) : super(key: key);

  @override
  State<Rentalshowmore> createState() => _RentalshowmoreState();
}

class _RentalshowmoreState extends State<Rentalshowmore> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
    title: const Text(
    "Rentalservices",
    ),
    ),
    body: Container(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    children: [
    GridView.count(
    shrinkWrap: true,
    crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 4 : 2,
    childAspectRatio: 2 / 3, // Adjust this ratio as needed
    children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 10,
    child: Column(
    children: [

    const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("CAR"
    ,style: TextStyle(
    backgroundColor: Colors.yellow,
    fontSize: 20,
    fontWeight:FontWeight.w500,
    ),),
    ],
    ),
    SizedBox(
    height: 120,
    width: double.infinity,
    child: Image.asset(
    "images/img2.png",
    fit: BoxFit.fill,
    ),
    ),
    ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RentBookNow()));
    },
    child: const Text('Click to book'),
    ),
    ],
    ),
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 10,
    child: Column(
    children: [
    const Text("BIKE",style: TextStyle(
    backgroundColor: Colors.yellow,

    fontSize: 20,
    fontWeight:FontWeight.w500,
    ),),
    Container(

    height: 120,
    width: double.infinity,
    child: Image.asset(
    "images/img2.png",
    fit: BoxFit.fill,
    ),
    ),
    ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RentBookNow()));
    },
    child: const Text('Click to book'),
    ),
    ],
    ),
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 10,
    child: Column(
    children: [
    const Text("Luxury Bike",style: TextStyle(
    backgroundColor: Colors.yellow,

    fontSize: 20,
    fontWeight:FontWeight.w500,
    ),),
    Container(
    height: 120,
    width: double.infinity,
    child: Image.asset(
    "images/img2.png",
    fit: BoxFit.fill,
    ),
    ),
    ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RentBookNow()));
    },
    child: const Text('Click to book'),
    ),
    ],
    ),
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 10,
    child: Column(
    children: [
    const Text("Luxury Car ",style: TextStyle(
    backgroundColor: Colors.yellow,

    fontSize: 20,
    fontWeight:FontWeight.w500,
    ),),
    Container(
    height: 120,
    width: double.infinity,
    child: Image.asset(
    "images/img2.png",
    fit: BoxFit.fill,
    ),
    ),
    ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RentBookNow()));
    },
    child: const Text('Click to book'),
    ),
    ],
    ),
    ),
    ),

    ],
    ),
    ],
    ),
    ),
    );

  }
}
