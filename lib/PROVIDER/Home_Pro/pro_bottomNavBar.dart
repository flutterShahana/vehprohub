import 'package:autoprohub/PROVIDER/Bookings/pro_bookingStatus.dart';
import 'package:autoprohub/PROVIDER/Home_Pro/viewOffer.dart';
import 'package:autoprohub/User/editprofilepage.dart';
import 'package:autoprohub/User/Home/homepage.dart';
import 'package:autoprohub/User/media.dart';
import 'package:autoprohub/User/notificationpage.dart';
import 'package:autoprohub/User/paymenthis.dart';
import 'package:autoprohub/User/rev_rat_feedbk_pg.dart';

import 'package:autoprohub/User/screen5profile.dart';
import 'package:autoprohub/User/servicefull.dart';
import 'package:flutter/material.dart';

import '../../Auth/logusrspin.dart';
import '../../SP/sp.dart';
import '../../User/BOOKINGSTATUS/bookingsts.dart';
import '../../User/Home/userProfile.dart';
import 'myLocation.dart';
import 'provider_home.dart';

class ProviderBottomNavBarPage extends StatefulWidget {
  const ProviderBottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<ProviderBottomNavBarPage> createState() =>
      _ProviderBottomNavBarPageState();
}

class _ProviderBottomNavBarPageState extends State<ProviderBottomNavBarPage> {
  int myIndex = 0;
  var lid;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print('0000000--Pro-nav--000000000>>>lid:${lid}<<<000000000000');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      const HomeProvider(),
      const ProviderBookSts(),
      // ServiceFull(),
      // Medias(),
      ViewOffer(
        lid: lid,
      ),
      UserProfile(
        lid: lid,
      ),

      // Text("Home",style: TextStyle(fontSize: 30),),
      // Text("Map",style: TextStyle(fontSize: 40),),
      // Text("Services",style: TextStyle(fontSize: 50),),
      // Text("Media",style: TextStyle(fontSize: 60),),
      // Text("Pofile",style: TextStyle(fontSize: 20),),
    ];
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),

      appBar: AppBar(
        title: const Text("AUTO PRO HUB"),
        //backgroundColor: Colors.purple[300],
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Do you want to LogOut ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                SharedPreferencesHelper.clearData();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserServiceProvider()));
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No')),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      drawer: Drawer(
        //    backgroundColor: Colors.purple[50],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                //  color: Colors.purple[100],
                color: Colors.black,
              ),
              child: Center(
                child: ClipOval(
                  child: Container(
                    height: 130,
                    width: 130,
                    color: Colors.white,
                    child: Icon(
                      Icons.emoji_transportation,
                      size: 100.0,
                      color: Colors.purple,
                      // color: Colors.black,
                    ),
                    //width: 100,
                    // child: const CircleAvatar(
                    //   backgroundImage: AssetImage('images/img1.png'),
                    //   radius: 30,
                    // ),
                  ),
                ),
              ),
            ),
            // ListTile(
            //   leading: const Icon(Icons.miscellaneous_services_outlined),
            //   title: const Text("Services"),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const ServiceFull()));
            //     // Handle navigation to services page
            //   },
            // ),
            // const Divider(
            //   color: Colors.black,
            //   thickness: 1,
            //   indent: 16,
            //   endIndent: 16,
            // ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("My Profile"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfile(lid: lid)));

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
              title: Text("My Location"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyLocation(
                              lid: lid,
                            )));

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
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                // Handle logout functionality
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.black,
        // backgroundColor: Colors.purpleAccent[100],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,

        items: [
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: "Home",
              // backgroundColor: Colors.purpleAccent[100]),
              backgroundColor: Colors.black),
          const BottomNavigationBarItem(
              icon: Icon(Icons.work_history_outlined), label: "Bookings"),
          // const BottomNavigationBarItem(
          //     icon: Icon(Icons.emoji_transportation), label: "Services"),
          // const BottomNavigationBarItem(
          //     icon: Icon(Icons.perm_media_outlined), label: "Media"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined), label: "Offers"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
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
