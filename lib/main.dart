import 'package:autoprohub/Auth/loginpage.dart';
import 'package:autoprohub/FIRSTLOG/mapmapmapmap.dart';
import 'package:autoprohub/FIRSTLOG/otp_page.dart';
import 'package:autoprohub/User/Home/bottomNavbarPage.dart';
import 'package:flutter/material.dart';

import 'Auth/logusrspin.dart';
import 'FIRSTLOG/resetpasswordpg.dart';
import 'PROVIDER/Bookings/pro_bookingStatus.dart';
import 'PROVIDER/Services/Cab/cabs.dart';
import 'PROVIDER/Services/Workshop/addCarServices.dart';
import 'User/BOOKINGSTATUS/bookingsts.dart';
import 'User/Ratings/addRating.dart';
import 'User/Ratings/viewRating.dart';
import 'User/Services/Accessory/accBooking.dart';
import 'User/Services/Accessory/accessoriesService.dart';
import 'User/Services/Cab/cabBooking.dart';
import 'User/Services/Cab/cabDetailPage.dart';
import 'User/Services/Cab/cabServices.dart';
import 'User/Services/Cab/showAllCabs.dart';
import 'User/Services/Rent/rentalService.dart';
import 'User/Services/Workshop/workshopService.dart';
import 'User/Home/homepage.dart';

void main() {
  print("hello..nj");
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: UserServiceProvider()

        // home: ReviewRatingFeedbackPage(),
        );
  }
}
