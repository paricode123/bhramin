import 'package:bhramin/screens/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf4dcb0),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome',
              style: GoogleFonts.dancingScript(
                fontSize: 27.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,color: Colors.grey,),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 24.r,
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(
                            color: Colors.black, // Set the border color here
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.0),
                          child: Text('What\'s on your mind?',
                            style: TextStyle(
                                color: Colors.grey.shade500
                            ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  IconButton(
                    icon: Icon(Icons.image,color: Colors.green,),
                    onPressed: () {
                      // Add your icon button logic here
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 10.0.h,
              color: Colors.black,
            ),
            SizedBox(height: 20.h,),
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/post.jpg'),
                        radius: 30.0.r,
                      ),
                      SizedBox(width: 16.0.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(fontSize: 23.sp),
                          ),
                          Text('Work in Private Company,',
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0.h),
                  Image.asset(
                    'assets/images/post.png',
                    width: screenWidth,
                  ),
                  SizedBox(height: 16.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconContainer(Icons.thumb_up_rounded),
                      SizedBox(width: 5.0.w),
                      _buildIconContainer(Icons.comment),
                      SizedBox(width: 5.0.w),
                      _buildIconContainer(Icons.share),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Divider(
              height: 10.0.h,
              color: Colors.black,
            ),
            SizedBox(height: 20.h,),
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/post.jpg'),
                        radius: 30.0.r,
                      ),
                      SizedBox(width: 16.0.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: TextStyle(fontSize: 23.sp),
                          ),
                          Text('Work in Private Company, age- 21',
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0.h),
                  Image.asset(
                    'assets/images/post2.png',
                    width: screenWidth,
                  ),
                  SizedBox(height: 16.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIconContainer(Icons.thumb_up_rounded),
                      SizedBox(width: 5.0.w),
                      _buildIconContainer(Icons.comment),
                      SizedBox(width: 5.0.w),
                      _buildIconContainer(Icons.share),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Divider(
              height: 10.0.h,
              color: Colors.black,
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(IconData iconData) {
    return Expanded(
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Icon(
          iconData,
          size: 23.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
