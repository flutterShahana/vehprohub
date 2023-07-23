import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class AddAccessoriesDetails extends StatefulWidget {
  AddAccessoriesDetails({super.key, required this.type});
  var type;
  @override
  State<AddAccessoriesDetails> createState() => _AddAccessoriesDetailsState();
}

class _AddAccessoriesDetailsState extends State<AddAccessoriesDetails> {
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

  TextEditingController name = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController quantity = TextEditingController();

  Future choiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future sendData(File imageFile) async {
    print(name.text);
    print(description.text);
    print(rate.text);
    print(brand.text);
    print(quantity.text);
    print(imageFile.path);

    var uri = Uri.parse("${Con.url}/addAccessories.php");

    var request = http.MultipartRequest("POST", uri);
    request.fields['description'] = description.text;
    request.fields['name'] = name.text;
    request.fields['brand'] = brand.text;
    request.fields['rate'] = rate.text.toString();
    request.fields['quantity'] = quantity.text.toString();
    request.fields['type'] = widget.type;
    request.fields['pro_id'] = lid.toString();

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Details added Successfully ...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Failed to add details...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      Navigator.pop(context);
      print("uploaded faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Rent Details '),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  //     child: _image == null ? Text('No image selected') : Image.file(_image!),
                  child: _image == null
                      ? Stack(children: [
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
                      : Image.file(_image!),
                ),
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text('Name of Car'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: brand,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text('Brand'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: rate,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text(
                    'Rate (in Rupees)',
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
                // maxLines: 5,
                maxLength: 300,
                maxLines: 3,
                decoration: const InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text('Description'),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: quantity,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text(
                    'Quantity',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                        sendData(_image!);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Item added Successfully ...',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          backgroundColor: Color(0xfa8f7805),
                        ));
                        Navigator.pop(context);
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
