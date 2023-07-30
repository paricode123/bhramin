import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _handleTextChanged(int index, String value) {
    if (value.isNotEmpty && index < _controllers.length - 1) {
      FocusScope.of(context).nextFocus();
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
                                    SizedBox(height: 50.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        4,
                                            (index) => Container(
                                          width: 45.0.w,
                                          height: 50.0.h,
                                          margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1.w),
                                            borderRadius: BorderRadius.circular(8.0.r),
                                          ),
                                          child: TextField(
                                            controller: _controllers[index],
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            maxLength: 1,
                                            onChanged: (value) => _handleTextChanged(index, value),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: '',
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

                          SizedBox(height: 90.h,),

                          GestureDetector(
                            onTap: ()  {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => InformationPage()),
                              // );
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
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
