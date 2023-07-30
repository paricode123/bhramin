import 'dart:convert';
import 'package:bhramin/screens/forgotpassword.dart';
import 'package:bhramin/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;

import 'formpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String str_openssl_enc(String str, String iv) {
    final key = encrypt.Key.fromUtf8("#\$&*%&@#\$%\$#%P#%@X#8\$%&*"); // Update the key here
    final ivKey = encrypt.IV.fromUtf8(iv);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(str, iv: ivKey);

    return encrypted.base64;
  }

  void _loginUser() async {
    final String apiUrl = "https://barishloan.in/Bramhin/API/login.php";

    // Get user-entered data from controllers
    String email = _emailController.text;
    String password = _passwordController.text;

    // Create the request body
    Map<String, String> requestBody = {
      "email": email,
      "mobile": password,
    };

    try {
      var response = await http.post(Uri.parse(apiUrl), body: requestBody);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey("status") && responseData["status"] == "success") {
          print("Login successful: ${response.body}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Successful"),
              duration: Duration(seconds: 2),
            ),
          );

          // Navigate to the FormPage upon successful login
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage()), // Replace FormPage with the actual class name of your FormPage widget
          );

        } else {
          // Login failed
          String errorMessage = responseData["message"];
          print("Login failed: $errorMessage");

          // Show a snackbar with the error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        // Login failed with a non-200 status code
        print("Login failed with status code ${response.statusCode}");

        // Show a snackbar with a generic error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Failed. Please try again later."),
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
          color: Color(0xFFf4dcb0),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.h,),
            Image.asset('assets/images/logo.png',height: 130.h,),
            SizedBox(height: 70.h,),
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
                      children: <Widget>[
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                                );
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(color: Colors.black, fontSize: 13.sp,fontWeight: FontWeight.bold),
                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterPage()),
                                );
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(color: Colors.black, fontSize: 13.sp,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 80.h,),

                        GestureDetector(
                          onTap: _loginUser, // Call the _loginUser function when the button is tapped
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
                                "Login",
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



