import 'package:autoprohub/main.dart';
import 'package:flutter/material.dart';

void main()
{
  print("welcom to task2");
  runApp(myapp());

}
class task1 extends StatelessWidget {
  const task1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body:Container(
        width: double.infinity ,
        height: double.infinity ,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1619964478337-12e178409359?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJhbCUyMGJsdXJ8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
            ),
            fit: BoxFit.cover,
          )
        ) ,
        child: Center (
          child: Column(
            children: [

              const Padding(
                padding: EdgeInsets.only(top:30) ,
                child: Text('WELCOME TO NATURE',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,

                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:400) ,
                child: Text('13000+ plant trees',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,

                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:6) ,
                child: Text('Save Nature',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,

                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:6) ,
                child: Text('THIS JUNE 5 TH 2023',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,

                  ),
                ),
              ),
    Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: ElevatedButton(
    onPressed: () {
    // Add your button click logic here
    },
    child: const Text('Click Me For Better Future'),
        // ElevatedButton(
        //   onPressed: () {
        //     // Add your button click logic here
        //   },
        //   child: Text('Click To Donate'
        //   ),
        // ),
    ),
    ),
    ),

            ],




          ) ,
        ) ,
      ) ,


    );
  }
}

