import 'dart:io';
import 'package:bhramin/screens/profesionform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  File? _image;
  String firstName = '';
  String surname = '';
  String gotra = '';
  String gender = '';
  String fatherName = '';
  String email = '';
  String address = '';
  String doorNumber = '';
  String area = '';
  String city = '';
  String district = '';
  String state = '';
  String pinCode = '';
  String maritalStatus = '';

  // Dropdown options for 'gotra' and 'marital status'
  List<String> gotraOptions = ['Select Gotra', 'Gotra 2', 'Gotra 3'];
  List<String> maritalStatusOptions = ['Married', 'Unmarried', 'Bachelor', 'Divorced'];

  String selectedGotra = 'Select Gotra'; // Make sure this value matches one of the items in gotraOptions.
  String selectedMaritalStatus = 'Married'; // Make sure this value matches one of the items in maritalStatusOptions.

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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
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
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                        ),
                        onChanged: (value) => setState(() => firstName = value),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Surname',
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                        ),
                        onChanged: (value) => setState(() => surname = value),
                      ),
                      SizedBox(height: 16.h),
                      DropdownButtonFormField<String>(
                        value: selectedGotra,
                        onChanged: (newValue) {
                          setState(() {
                            selectedGotra = newValue!;
                          });
                        },
                        items: gotraOptions.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20.h),
                      Text('Gender'),
                      RadioListTile<String>(
                        title: Text('Male'),
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                      ),
                      RadioListTile<String>(
                        title: Text('Female'),
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                      ),
                      RadioListTile<String>(
                        title: Text('Others'),
                        value: 'Others',
                        groupValue: gender,
                        onChanged: (value) => setState(() => gender = value!),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Father Name',
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                        ),
                        onChanged: (value) => setState(() => fatherName = value),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                        ),
                        onChanged: (value) => setState(() => email = value),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                        ),
                        onChanged: (value) => setState(() => address = value),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Door Number',
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                              ),
                              onChanged: (value) => setState(() => doorNumber = value),
                            ),
                          ),
                          SizedBox(width: 30.w,),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Area',
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                              ),
                              onChanged: (value) => setState(() => area = value),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'City',
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                              ),
                              onChanged: (value) => setState(() => city = value),
                            ),
                          ),
                          SizedBox(width: 30.w,),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'District',
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                              ),
                              onChanged: (value) => setState(() => district = value),
                            ),

                          ),

                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'State',
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                              ),
                              onChanged: (value) => setState(() => state = value),
                            ),

                          ),
                          SizedBox(width: 30.w,),
                          Expanded(
                            child:TextFormField(
                              decoration: InputDecoration(labelText: 'Pin Code',
                                labelStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                              ),
                              onChanged: (value) => setState(() => pinCode = value),
                            ),

                          ),

                        ],
                      ),
                      SizedBox(height: 16.h),
                      DropdownButtonFormField<String>(
                        value: selectedMaritalStatus,
                        onChanged: (newValue) {
                          setState(() {
                            selectedMaritalStatus = newValue!;
                          });
                        },
                        items: maritalStatusOptions.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 50.h,),
                      GestureDetector(
                        onTap: ()  {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfesionPage()),
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
                      SizedBox(height: 50.h,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
