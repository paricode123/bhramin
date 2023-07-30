import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'bottom.dart';

class ProfesionPage extends StatefulWidget {
  const ProfesionPage({Key? key}) : super(key: key);

  @override
  State<ProfesionPage> createState() => _ProfesionPageState();
}

class _ProfesionPageState extends State<ProfesionPage> {
  File? _image;
  String? selectedProfession;
  TextEditingController textFieldController = TextEditingController();

  Future _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  color: Color(0xFFf4dcb0),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(85.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 37.h,),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18.w),
                          child: Column(
                            children: [
                              Text(
                                'Your ID: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                'DL 999999',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Take a Photo'),
                                          onTap: () {
                                            _pickImage(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text('Choose from Gallery'),
                                          onTap: () {
                                            _pickImage(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40.r,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 30.sp,
                                    color: Colors.grey,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                if (_image != null)
                                  CircleAvatar(
                                    radius: 40.r,
                                    backgroundImage: FileImage(_image!),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w)
                      ],
                    ),
                    //Row()
                  ],
                ),
              ),

              SizedBox(height: 100.h,),
              Padding(
                padding: EdgeInsets.all(18.w),
                child: Center(
                  child: DropdownButton<String>(
                    value: selectedProfession,
                    hint: Text('Select a profession'),
                    onChanged: (value) {
                      setState(() {
                        selectedProfession = value;
                        textFieldController.clear();
                      });
                    },
                    items: [
                      'Student',
                      'Private Job',
                      'Government Job',
                      'Shop',
                      'Business',
                      'Freelancer',
                      'Doctor',
                      'Engineer',
                      'Lawyer',
                      'Retired',
                      'Teacher',
                      'Housewife',
                      'Others',
                    ].map((String profession) {
                      return DropdownMenuItem<String>(
                        value: profession,
                        child: Text(profession),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Conditionally display the relevant text field based on the selected profession
              if (selectedProfession == 'Student')
                buildTextField('Course')
              else if (selectedProfession == 'Private Job' || selectedProfession == 'Government Job')
                buildTextField('Organization')
              else if (selectedProfession == 'Shop' || selectedProfession == 'Business')
                  buildTextField('Name')
                else if (selectedProfession == 'Freelancer')
                    buildTextField('Profession')
                  else if (selectedProfession == 'Doctor' || selectedProfession == 'Engineer' || selectedProfession == 'Lawyer')
                      buildTextField('Specialization')
                    else if (selectedProfession == 'Others')
                        buildTextField('Enter profession'),
              SizedBox(height: 100.h,),
              GestureDetector(
                onTap: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomPage()),
                  );
                },
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 50.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFf4c97f), Color(0xFFf7f1e6)],
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return Padding(
      padding: EdgeInsets.all(18.w),
      child: TextField(
        controller: textFieldController,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
      ),
    );
  }
}

