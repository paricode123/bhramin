import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> _items = [
    {'icon': Icons.person_add_rounded, 'text': 'Edit Account Details'},
    {'icon': Icons.password, 'text': 'Change Password'},
    {'icon': Icons.share, 'text': 'Share App'},
    {'icon': Icons.terminal_sharp, 'text': 'Terms & Conditions'},
    {'icon': Icons.note_add, 'text': 'Privacy Policy'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf4dcb0),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: GoogleFonts.dancingScript(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            CircleAvatar(
              radius: 50.h,
              backgroundImage: AssetImage('assets/images/dp.jpg'),
            ),
            SizedBox(height: 20.h),
            Text(
              'User',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50.h),
            ..._items.map((item) => Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (item['text'] == 'Edit Account Details') {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ProfileUpdate()),
                          // );
                        } else if (item['text'] == 'Change Password') {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ChangePassword()),
                          // );
                        } else if (item['text'] == 'Share App') {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SharePage()),
                          // );
                        } else if (item['text'] == 'Terms & Conditions') {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => TermCondition()),
                          // );
                        } else if (item['text'] == 'Privacy Policy') {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                          // );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 13.0.h),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                item['icon'],
                                color: Colors.grey.shade900,
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                item['text'],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade800,
                    ),
                  ]),
            )),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );  }
}