import 'dart:convert';

import 'package:autoprohub/Style/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../Services/Accessory/accessoriesService.dart';

class WorkshopPay_Advance extends StatefulWidget {
  WorkshopPay_Advance({Key? key, required this.bookingID, required this.amt})
      : super(key: key);
  var bookingID;
  var amt;
  @override
  State<WorkshopPay_Advance> createState() => _WorkshopPay_AdvanceState();
}

class _WorkshopPay_AdvanceState extends State<WorkshopPay_Advance> {
  // List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  var flag = 0;
  var status;
  var booikingId;
  var amt = TextEditingController();
  var selected_payType;
  var selectedIndex = -1;
  var _selectedPay = 'Cash';
  var count, updated_qnty;

  List<String> pay = [
    'assets/images/Rectangle 83.png',
    'assets/images/Rectangle 82.png',
    'assets/images/Rectangle 81.png',
    'assets/images/other2.png',
  ];

  Future<dynamic> sentData() async {
    var data = {
      'pay_type': selected_payType,
      'pay_method': _selectedPay,
      'pay_status':
          selected_payType == 'Online' ? 'advance paid' : 'advance paid (Cash)',
      'booking_id': widget.bookingID,
      'amt': widget.amt
    };
    print(data);
    var response = await post(
        Uri.parse('${Con.url}USER/Payment/workshopPay.php'),
        body: data);
    print(response.body);
    print(response.statusCode);
    status = response.statusCode;
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment Status updated  Successfully..')));
      Navigator.pop(context);
      Navigator.pop(context);

      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => AccessoriesServices()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update payment status...')));
      Navigator.pop(context);
      Navigator.pop(context);

      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => AccessoriesServices()));
    }
    //return jsonDecode(response.body);
  }

  @override
  void initState() {
    amt.text = widget.amt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Amount',
              style: TextStyle(
                  //  backgroundColor: Colors.yellow,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: amt,
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Payment Type',
              style: TextStyle(
                  //  backgroundColor: Colors.yellow,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            SizedBox(
              height: 30,
            ),
            RadioListTile(
                title: Text('Online'),
                value: 'Online',
                groupValue: selected_payType,
                onChanged: (val) {
                  setState(() {
                    selected_payType = val;
                  });
                }),
            RadioListTile(
                title: Text('COD'),
                value: 'COD',
                groupValue: selected_payType,
                onChanged: (val) {
                  setState(() {
                    selected_payType = val;
                  });
                }),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: (selected_payType == 'Online') ? true : false,
              child: Container(
                height: 200,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(
                    //  top: 10.0,
                    // bottom: 10.0,
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: GridView.builder(
                    itemCount: pay.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 50,
                        crossAxisSpacing: 50),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: Image.asset(
                            pay[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      switch (selectedIndex) {
                        case 0:
                          _selectedPay = 'PhonePe';
                          break;
                        case 1:
                          _selectedPay = 'Google Pay';
                          break;
                        case 2:
                          _selectedPay = 'Paytm';
                          break;
                        case 3:
                          _selectedPay = 'Other';
                          break;
                      }
                      if (selected_payType == 'Online') {
                        if (selectedIndex == -1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Select Payment Method',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));
                        } else {
                          setState(() {
                            sentData();
                          });
                        }
                      } else if (selected_payType == 'COD') {
                        setState(() {
                          sentData();
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Select Payment Type',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          backgroundColor: Color(0xfa8f7805),
                        ));
                      }

                      //    sentData();
                    },
                    child: Text('Proceed')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
