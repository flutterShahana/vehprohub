import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../CONNECTION/connect.dart';
import '../../../SP/sp.dart';

class AddCabDetails extends StatefulWidget {
  AddCabDetails({super.key, required this.type});
  var type;
  @override
  State<AddCabDetails> createState() => _AddCabDetailsState();
}

class _AddCabDetailsState extends State<AddCabDetails> {
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

    var ppl = 0;
    person.text = ppl.toString();
    selectedSize = 'NA';
  }

  File? _image;
  final picker = ImagePicker();

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController person = TextEditingController();

  var category;
  String? selectedSize;

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

    var uri = Uri.parse("${Con.url}/addCabs.php");

    var request = http.MultipartRequest("POST", uri);
    request.fields['description'] = description.text;
    request.fields['name'] = name.text;
    request.fields['rate'] = rate.text.toString();
    request.fields['person'] = person.text.toString();
    request.fields['size'] = selectedSize!;
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

  List veh_size = ['S', 'M', 'L'];
  var selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Cab Details '),
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
                      : Image.file(_image!),
                ),
              ),

              TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  // enabledBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text('Vehicle Name'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Visibility(
                visible: widget.type == 'Goods' ? false : true,
                child: TextFormField(
                  controller: person,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    // enabledBorder: OutlineInputBorder(),
                    // focusedBorder: OutlineInputBorder(),
                    label: Text('No. of person'),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Wrap(
              //   children: [
              //     Container(width: 130,
              //       height: 130,
              //
              //       color: selectedSize == 'small' ? Colors.blue : Colors.grey,
              //       child: RadioListTile(
              //         title: Text('S'),
              //         value: 'small',
              //         groupValue: selectedSize,
              //         onChanged: (value) {
              //           setState(() {
              //             selectedSize = value;
              //           });
              //         },
              //       ),
              //     ),
              //     Container(
              //       color: selectedSize == 'medium' ? Colors.blue : Colors.grey,
              //       child: RadioListTile(
              //         title: Text('Medium'),
              //         value: 'medium',
              //         groupValue: selectedSize,
              //         onChanged: (value) {
              //           setState(() {
              //             selectedSize = value;
              //           });
              //         },
              //       ),
              //     ),
              //     Container(
              //       color: selectedSize == 'large' ? Colors.blue : Colors.grey,
              //       child: RadioListTile(
              //         title: Text('Large'),
              //         value: 'large',
              //         groupValue: selectedSize,
              //         onChanged: (value) {
              //           setState(() {
              //             selectedSize = value;
              //           });
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: widget.type == 'Goods' ? true : false,
                  child: Text('Select Vehicle Type')),
              Visibility(
                visible: widget.type == 'Goods' ? true : false,
                child: Container(
                  height: 50,
                  width: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: veh_size.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            selectedSize = veh_size[selectedIndex];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 90,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == index
                                      ? Colors.transparent
                                      : Colors.blue,
                                  width: 2.0,
                                ),
                                color: selectedIndex == index
                                    ? Color(0xff58bbf3)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                  child: Text(
                                '${veh_size[index]}',
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ))),
                        ),
                      );
                    },
                  ),
                ),
              ),

              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
                // maxLines: 5,
                maxLength: 300,
                maxLines: 3,
                decoration: const InputDecoration(
                  // enable
                  // dBorder: OutlineInputBorder(),
                  // focusedBorder: OutlineInputBorder(),
                  label: Text('Description'),
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
                    'Rate/km (in Rupees)',
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
