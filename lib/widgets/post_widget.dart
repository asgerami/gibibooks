import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gibibooks/util/image_cached.dart';

class PostWidget extends StatefulWidget {
  final snapshot;
  PostWidget(this.snapshot, {super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375.w,
          height: 54.h,
          color: Colors.white,
          child: Center(
            child: ListTile(
              leading: ClipOval(
                child: SizedBox(
                  width: 35.w,
                  height: 35.h,
                  child: CachedImage(widget.snapshot['profileImage']),
                ),
              ),
              title: Text(
                widget.snapshot['username'],
                style: TextStyle(fontSize: 13.sp),
              ),
              subtitle: Text(
                widget.snapshot['location'],
                style: TextStyle(fontSize: 11.sp),
              ),
            ),
          ),
        ),
        Container(
          width: 375.w,
          height: 375.h,
          child: CachedImage(
            widget.snapshot['postImage'],
          ),
        ),
        Container(
          width: 375.w,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              Row(children: [
                SizedBox(width: 14.w),
                Icon(
                  Icons.thumb_up_outlined,
                  size: 24.w,
                ),
                SizedBox(width: 17.w),
                Image.asset(
                  'images/comment.png',
                  height: 28.h,
                ),
              ]),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Image.asset(
                  'images/share.png',
                  height: 28.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
