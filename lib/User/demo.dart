import 'package:flutter/material.dart';

class demo extends StatelessWidget {
  const demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity ,
          width: MediaQuery.of(context).size.width,

        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Padding(padding: EdgeInsets.only(top:5.0),
                child: Container(

                  height:35,
                  width: MediaQuery.of(context).size.width,


                  color: Colors.red,
                  child: Text("MARIO",
                    style:TextStyle(
                      fontSize: 30,
                      color: Colors.white,

                    ),
                  ),

                ),
              ),

              Padding(padding: EdgeInsets.only(top: 0.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color:Colors.white,

                  child: Row(
                    children: [

                      Padding(padding: EdgeInsets.only(left: 5.0),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/img1.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.red.shade50,
                                child: Text("count 0",
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

                      Padding(padding: EdgeInsets.only(left: 12.5),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/img1.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.red.shade50,
                                child: Text("count 1",
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

                      Padding(padding: EdgeInsets.only(left: 5.0),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/img1.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.red.shade50,
                                child: Text("count 2",
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

                      )



                    ],


                  ),
                ),

              ),

              Padding(padding: EdgeInsets.only(top:5.0),
                child: Container(

                  height:35,
                  width: MediaQuery.of(context).size.width,


                  color: Colors.green,
                  child: Text("MICKEY MOUSE",
                    style:TextStyle(
                      fontSize: 30,
                      color: Colors.white,

                    ),
                  ),

                ),
              ),

              Padding(padding: EdgeInsets.only(),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color:Colors.white,

                  child: Row(
                    children: [

                      Padding(padding: EdgeInsets.only(left: 5.0),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/img2.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.green.shade50,
                                child: Text("count 0",
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

                      Padding(padding: EdgeInsets.only(left: 12.5),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/img2.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.green.shade50,
                                child: Text("count 1",
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

                      Padding(padding: EdgeInsets.only(left: 5.0),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/img2.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.green.shade50,
                                child: Text("count 2",
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

                      )



                    ],


                  ),
                ),

              ),

              Padding(padding: EdgeInsets.only(top:5.0),
                child: Container(

                  height:35,
                  width: MediaQuery.of(context).size.width,


                  color: Colors.blue,
                  child: Text("YOSHI",
                    style:TextStyle(
                      fontSize: 30,
                      color: Colors.white,

                    ),
                  ),

                ),
              ),

              Padding(padding: EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color:Colors.white,

                  child: Row(
                    children: [

                      Padding(padding: EdgeInsets.only(left: 5.0),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/yoshi.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.blue.shade50,
                                child: Text("count 0",
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

                      Padding(padding: EdgeInsets.only(left: 12.5),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/yoshi.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.blue.shade50,
                                child: Text("count 1",
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

                      Padding(padding: EdgeInsets.only(left: 5.0),

                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 100,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image:AssetImage("images/yoshi.png"),
                                      fit: BoxFit.fill,

                                    )
                                ),

                              ),
                              Container(

                                height:30,
                                width:100 ,


                                color: Colors.blue.shade50,
                                child: Text("count 2",
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

                      )



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
