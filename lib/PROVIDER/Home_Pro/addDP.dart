import 'dart:io';

import 'package:autoprohub/PROVIDER/Home_Pro/viewOffer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class AddDP extends StatefulWidget {
  AddDP({super.key});

  @override
  State<AddDP> createState() => _AddDPState();
}

class _AddDPState extends State<AddDP> {
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

  Future choiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future sendData(File imageFile) async {
    var uri = Uri.parse("${Con.url}/user/addDP.php");

    var request = http.MultipartRequest("POST", uri);
    request.fields['user_id'] = lid.toString();

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Profile pic updated successfully ...',
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
          'Failed to update...',
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
    double topH = _image == null ? 100 : 50;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Update Profile Picture '),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: EdgeInsets.only(top: topH, left: 20, right: 20),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                    //width: MediaQuery.of(context).size.width,
                    width: 350,
                    height: _image == null ? 350 : 450,
                    //     child: _image == null ? Text('No image selected') : Image.file(_image!),
                    child: Column(
                        // clipBehavior: Clip.hardEdge,
                        children: [
                          Center(
                            child: _image == null
                                ? Card(
                                    elevation: 5,
                                    child: Container(
                                      //color: Colors.red,
                                      height: 250,
                                      width: 250,
                                      child: const Center(
                                          child: Text(
                                              '-- Click to select image --')),
                                    ),
                                  )
                                : Card(
                                    elevation: 5,
                                    child: Container(
                                      //color: Colors.red,
                                      height: 350,
                                      width: 350,
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                    //
                                    ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipOval(
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
                          ))
                        ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: color,
                          ),
                      onPressed: () {
                        sendData(_image!);
                      },
                      child: const Center(
                          child: Text(
                        'Update Profile Picture',
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
