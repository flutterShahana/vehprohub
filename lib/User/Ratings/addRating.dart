import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../CONNECTION/connect.dart';
import '../../SP/sp.dart';

class AddRatings extends StatefulWidget {
  AddRatings({
    super.key,
    required this.service,
  });
  var service;
  @override
  _AddRatingsState createState() => _AddRatingsState();
}

class _AddRatingsState extends State<AddRatings> {
  int _starCount = 0;
  String _description = '';
  bool _isButtonEnabled = false;

  void _onStarRatingChanged(int rating) {
    setState(() {
      _starCount = rating;
      _isButtonEnabled = _starCount > 0 && _description.isNotEmpty;
    });
  }

  void _onDescriptionChanged(String text) {
    setState(() {
      _description = text;
      _isButtonEnabled = _starCount > 0 && _description.isNotEmpty;
    });
  }

  void _submitRating() {
    // You can handle the submission of the rating and description here
    print("Star Rating: $_starCount");
    print("Description: $_description");
  }

  var flag = 0;
  var lid;

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print(lid);
      });
    });
    // setState(() {
    //   myLogin();
    // });
  }

  Future<dynamic> sentData() async {
    var data = {
      'user_id': lid.toString(),
      'star': _starCount.toString(),
      'feedback': _description,
      'date': DateTime.now().toString(),
      'service': widget.service
    };
    print(data);
    var response =
        await post(Uri.parse('${Con.url}USER/addRating.php'), body: data);
    print(response.body);
    print(response.statusCode);
    jsonDecode(response.body)['result'] == 'success' ? flag = 1 : flag = 0;
    if (flag == 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Rating added Successfully..')));
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ViewRatings()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to rate...')));
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ViewRatings()));
    }
    //return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Service Rating'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Rate our ${widget.service} Service',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      i <= _starCount ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    ),
                    onPressed: () => _onStarRatingChanged(i),
                  ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: _onDescriptionChanged,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isButtonEnabled ? sentData : null,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
