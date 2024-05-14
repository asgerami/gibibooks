import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Container(
                width: double.infinity,
                height: 36.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search User',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ])));
  }
}
