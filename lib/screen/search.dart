import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gibibooks/screen/profile_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final search = TextEditingController();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SearchBox(),
                if (!show)
                StreamBuilder(
                  stream: _firebaseFirestore
                    .collection('users')
                    .where('username', isGreaterThanOrEqualTo: search.text)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final snap = snapshot.data!.docs[index];
                          return Column(
                            children: [
                              SizedBox(height: 10.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProfileScreen(Uid: snap.id),
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 23.0,
                                        backgroundImage: NetworkImage(
                                          snap['profile'],
                                        ),
                                      ),
                                      SizedBox(width: 15.0),
                                      Text(snap['username']),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        childCount: snapshot.data!.docs.length,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
  SliverToBoxAdapter SearchBox(){
    return SilverToBoxAdapter(
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
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 0) {
                          show = false;
                        } else {
                          show = true;
                        }
                      });
                    },
                    controller: search,
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
    );
  }
}

