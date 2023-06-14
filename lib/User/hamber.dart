
import 'package:autoprohub/User/editprofilepage.dart';
import 'package:autoprohub/User/homepage.dart';
import 'package:autoprohub/User/media.dart';
import 'package:autoprohub/User/notificationpage.dart';
import 'package:autoprohub/User/paymenthis.dart';
import 'package:autoprohub/User/rev_rat_feedbk_pg.dart';

import 'package:autoprohub/User/screen5profile.dart';
import 'package:autoprohub/User/servicefull.dart';
import 'package:flutter/material.dart';

import 'BOOKINGSTATUS/bookingsts.dart';

class Hamber extends StatefulWidget {
  const Hamber({Key? key}) : super(key: key);


  @override
  State<Hamber> createState() => _HamberState();
}

class _HamberState extends State<Hamber> {
  int myIndex=0;

  List<Widget>widgetList = const [
    Homepage(),
    BookSts(),
    ServiceFull(),
    Medias(),
    Screenprofile(),

    // Text("Home",style: TextStyle(fontSize: 30),),
    // Text("Map",style: TextStyle(fontSize: 40),),
    // Text("Services",style: TextStyle(fontSize: 50),),
    // Text("Media",style: TextStyle(fontSize: 60),),
    // Text("Pofile",style: TextStyle(fontSize: 20),),




  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),

      appBar: AppBar(
        title: const Text("AUTO PRO HUB"),
        backgroundColor: Colors.purple[300],
        actions: [
          IconButton(
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));

              },
              icon:const Icon(Icons.notification_important_sharp)
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[50],

        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[100],
              ),
              child: Wrap(
                children: [
                  Container(
                    height: 115,
                    width: 100,
                    // color: Colors.grey,

                    //width: 100,
                    child: const CircleAvatar(

                      backgroundImage: AssetImage('images/img1.png'),
                      radius: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    // color: Colors.red,
                    width: 120,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        const Text("Neeraj M ",style: TextStyle(fontSize: 20,

                        ),),
                        const SizedBox(
                          height: 5,
                        ),
                        const Wrap(

                          children: [
                            Icon(Icons.phone,size: 18,),
                            SizedBox(
                              width: 10,
                            ),
                            Text("7356029002"),
                          ],
                        ),


                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          child: Text("EditProfile"),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage()));

                        },

                        ),



                      ],
                    ),
                  ),
                ],
              ),

            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Homepage()));
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: const Icon(Icons.miscellaneous_services_outlined),
              title: const Text("Services"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServiceFull()));
                // Handle navigation to services page
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("History"),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookSts()));

                // Handle navigation to history page
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.payment_sharp),
              title: Text("Payment History"),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Paymenthis()));

                // Handle navigation to payment history page
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: Text("Review"),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewRatingFeedbackPage()));

                // Handle navigation to review page
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                // Handle logout functionality
              },
            ),
          ],
        ),
      ),


      bottomNavigationBar:BottomNavigationBar(

        // showSelectedLabels: false,
        showUnselectedLabels: false,

        backgroundColor: Colors.purpleAccent[100],
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {

            myIndex=index;

          });
        },
        currentIndex: myIndex,

        items: [

          BottomNavigationBarItem(icon:const Icon(Icons.home,),
          label: "Home",backgroundColor: Colors.purpleAccent[100]),

          const BottomNavigationBarItem(icon:Icon(Icons.work_history_outlined),
              label: "My Trip"),

          const BottomNavigationBarItem(icon:Icon(Icons.emoji_transportation),
              label: "Services"),

          const BottomNavigationBarItem(icon:Icon(Icons.perm_media_outlined),
              label: "Media"),


          const BottomNavigationBarItem(icon:Icon(Icons.person),
              label: "Profile"),

        ],

      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //
      //       // Add your content here
      //     ],
      //   ),
      // ),
    );
  }
}
