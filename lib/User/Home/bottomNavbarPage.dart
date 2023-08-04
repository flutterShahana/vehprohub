import 'package:autoprohub/User/Home/homepage.dart';
import 'package:autoprohub/User/Home/userProfile.dart';

import 'package:flutter/material.dart';

import '../../Auth/logusrspin.dart';
import '../../SP/sp.dart';
import '../BOOKINGSTATUS/bookingsts.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int myIndex = 0;
  var lid;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print('0000000000--nav--000000>>>lid:${lid}<<<000000000000');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      Homepage(
        lid: lid,
      ),
      BookSts(),
      UserProfile(
        lid: lid,
      )
    ];
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),

      appBar: AppBar(
        title: const Text("AUTO PRO HUB"),
        backgroundColor: Colors.purple[300],
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
        backgroundColor: Colors.purple[50],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[100],
              ),
              child: Center(
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    height: 130,
                    width: 130,
                    child: Icon(
                      Icons.emoji_transportation,
                      size: 100.0,
                      color: Colors.purple,
                    ),
                    // decoration: const BoxDecoration(
                    //     image: DecorationImage(
                    //         fit: BoxFit.fill,
                    //         image: AssetImage('images/img1.png'))),
                  ),
                ),

                // child: const CircleAvatar(
                //   backgroundImage: AssetImage('images/img1.png'),
                //   radius: 50,
                // ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("My Profile"),
              onTap: () {
                print('----------my profile button pressed--------------');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfile(
                              lid: lid,
                            )));
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
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
            // ListTile(
            //   leading: Icon(Icons.history),
            //   title: Text("History"),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const BookSts()));
            //
            //     // Handle navigation to history page
            //   },
            // ),
            // const Divider(
            //   color: Colors.black,
            //   thickness: 1,
            //   indent: 16,
            //   endIndent: 16,
            // ),
            // ListTile(
            //   leading: Icon(Icons.payment_sharp),
            //   title: Text("Payment History"),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const Paymenthis()));
            //
            //     // Handle navigation to payment history page
            //   },
            // ),
            // const Divider(
            //   color: Colors.black,
            //   thickness: 1,
            //   indent: 16,
            //   endIndent: 16,
            // ),
            // ListTile(
            //   leading: const Icon(Icons.rate_review),
            //   title: Text("Review"),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => ReviewRatingFeedbackPage()));
            //
            //     // Handle navigation to review page
            //   },
            // ),
            // const Divider(
            //   color: Colors.black,
            //   thickness: 1,
            //   indent: 16,
            //   endIndent: 16,
            // ),
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

        backgroundColor: Colors.purpleAccent[100],
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
              backgroundColor: Colors.purpleAccent[100]),
          const BottomNavigationBarItem(
              icon: Icon(Icons.work_history_outlined), label: "My Bookings"),
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
