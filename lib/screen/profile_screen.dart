import 'package:flutter/material.dart';
import 'package:gibibooks/data/firebase_service/firestor.dart';
import 'package:gibibooks/data/model/usermodel.dart';
import 'package:gibibooks/util/image_cached.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  String Uid;
  ProfileScreen({super.key, required this.Uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FutureBuilder(
                  future: Firebase_Firestor().getUser(UID: widget.Uid),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Head(snapshot.data!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widget Head(Usermodel user) in ProfileScreen class
  Widget Head(Usermodel user) {
    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center align items
            children: [
              // Profile picture as a square
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20.h), // Adjust vertical padding as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 80.h,
                      child: CachedImage(user.profile),
                    ),
                    SizedBox(
                        width: 10
                            .w), // Adjust spacing between profile picture and username
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.username,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          user.Bio,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Post, followers, and following count centered
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center align row items
                children: [
                  Column(
                    children: [
                      Text(
                        'Moments',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 80.w), // Adjust spacing between counts as needed
                  Column(
                    children: [
                      Text(
                        user.followers.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 60.w), // Adjust spacing between counts as needed
                  Column(
                    children: [
                      Text(
                        user.following.length.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        'Buddies',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]));
  }
}
