import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());

  String? dropdownValue;

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _registerUser() async {
    final String apiUrl = "https://barishloan.in/Bramhin/API/register.php";

    // Get user-entered data from controllers
    String email = _emailController.text;
    String mobile = _passwordController.text;
    String age = dropdownValue ?? "";

    // Create the request body
    Map<String, String> requestBody = {
      "email": email,
      "mobile": mobile,
      "age": age,
    };

    try {
      // Make the POST request to the API
      var response = await http.post(Uri.parse(apiUrl), body: requestBody);

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse the response data as a Map
        Map<String, dynamic> responseData = json.decode(response.body);

        // Check if the response contains a key "status" with a value of "success"
        if (responseData.containsKey("status") && responseData["status"] == "success") {
          // Successful registration
          // You can process the response here if needed
          print("Registration successful: ${response.body}");

          // Show a snackbar with a success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Registration Successful"),
              duration: Duration(seconds: 2),
            ),
          );

          // You can navigate to another screen or perform any other action here
        } else {
          // Registration failed
          print("Registration failed: ${response.body}");

          // Show a snackbar with an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Registration Failed. Please try again later."),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        // Registration failed
        print("Registration failed: ${response.body}");

        // Show a snackbar with an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration Failed. Please try again later."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Error occurred while making the request
      print("Error: $e");

      // Show a snackbar with an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFf4dcb0)
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.h,),
            Image.asset('assets/images/logo.png',height: 130.h,),
            SizedBox(height: 50.h,),

            //the white section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65.r),
                      topRight: Radius.circular(65.r),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(30.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Material(
                          elevation: 2,
                          child: Container(
                            padding: EdgeInsets.all(10.w),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 30.h),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: "Enter your email",
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                                    ),
                                  ),
                                  SizedBox(height: 30.h,),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Enter your password",
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                                    ),
                                  ),
                                  SizedBox(height: 30.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Select Your Age - ',
                                        style: TextStyle(fontSize: 16.sp,fontWeight:  FontWeight.w500),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: DropdownButton<String>(
                                          value: dropdownValue,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue = newValue!;
                                            });
                                          },
                                          items: ['18', '19','20','21','22','23','24','25','+25',].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h,),
                                  Text(
                                    "(NOTE - Minimum age is 18 years to get register)",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 90.h,),

                        GestureDetector(
                          onTap: _registerUser, // Call the _registerUser function when the button is tapped
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
                                "Create Account",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


