import 'package:flutter/material.dart';

class WorkshopServices extends StatefulWidget {
  const WorkshopServices({Key? key}) : super(key: key);

  @override
  State<WorkshopServices> createState() => _WorkshopServicesState();
}

class _WorkshopServicesState extends State<WorkshopServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media"),
        backgroundColor: Colors.purple[200],
      ),

      body: Container(
          height: double.infinity ,
          width: MediaQuery.of(context).size.width,

          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 12),
                Padding(padding: const EdgeInsets.only(left: 10.0,top: 5.0,bottom: 5.0,right: 10.0),

                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          // width: 100,
                          decoration: const BoxDecoration(

                              image: DecorationImage(image:AssetImage("images/yoshi.png"),
                                fit: BoxFit.fill,

                              )
                          ),
                        ),
                        Container(
                          height:30,
                          width:310 ,
                          color: Colors.red.shade100,
                          child: const Text("Offer Close : 30/JUNE/2023",
                            textAlign: TextAlign.center,

                            style:TextStyle(
                              fontSize: 20,
                              color: Colors.white,

                            ),
                          ),

                        ),


                      ],
                    ),
                  ),

                ),
              ],
            ),
          )
      ),

    );
  }
}
