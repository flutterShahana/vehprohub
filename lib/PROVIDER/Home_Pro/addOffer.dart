import 'dart:io';

import 'package:autoprohub/PROVIDER/Home_Pro/viewOffer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class AddOffer extends StatefulWidget {
  AddOffer({super.key});

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
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
  }

  File? _image;
  final picker = ImagePicker();

  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? _startDate ?? DateTime.now()
          : _endDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null &&
        (isStartDate ? picked != _startDate : picked != _endDate)) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          start.text = formattedDate;
        } else {
          _endDate = picked;
          end.text = formattedDate;
        }
      });
    }
  }

  var category;
  String? selectedSize;

  Future choiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future sendData(File imageFile) async {
    print(start.text);
    print(end.text);

    var uri = Uri.parse("${Con.url}/addOffer.php");

    var request = http.MultipartRequest("POST", uri);
    request.fields['start'] = start.text;
    request.fields['end'] = end.text;
    request.fields['pro_id'] = lid.toString();

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Offer added Successfully ...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ViewOffer(lid: lid),
      //     ),
      //     (route) => false);

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Failed to add offer details...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      Navigator.pop(context);
      print("upload failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Add offer Details '),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  //width: MediaQuery.of(context).size.width,
                  width: 250,
                  height: 250,
                  //     child: _image == null ? Text('No image selected') : Image.file(_image!),
                  child: _image == null
                      ? Stack(clipBehavior: Clip.hardEdge, children: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                // upload(_image!);
                              },
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  //color: Colors.red,
                                  height: 200,
                                  width: 250,
                                  child: const Center(
                                      child:
                                          Text('-- Click to select image --')),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 80,
                              top: 185,
                              child: ClipOval(
                                  child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.blueGrey[100],
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.photo_camera_back_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    choiceImage();
                                  },
                                ),
                              )))
                        ])
                      : Image.file(
                          _image!,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: start,
                readOnly: true,
                onTap: () => _selectDate(context, true),
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: end,
                readOnly: true,
                onTap: () => _selectDate(context, false),
                decoration: InputDecoration(
                  labelText: 'End Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  width: 120,
                  height: 40,
                  child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: color,
                          ),
                      onPressed: () {
                        if (_image != null &&
                            start.text.isNotEmpty &&
                            end.text.isNotEmpty) {
                          sendData(_image!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Check All fields entered properly')));
                        }
                      },
                      child: const Center(
                          child: Text(
                        'Add',
                      ))),
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              // ElevatedButton(child: Text('Upload Image'),
              //   onPressed: (){
              //     upload(_image!);
              //   },),
            ],
          ),
        ),
      ),
    );
  }
}
