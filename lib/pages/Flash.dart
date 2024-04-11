import 'package:flutter/material.dart';
import 'package:foodmonkey_project/helper/TrianglePainter.dart';
import 'package:foodmonkey_project/utils/Api.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class Flash extends StatefulWidget {
  const Flash({super.key});

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  void appVersionCheck() async {
    bool passedApiChecked = await Api.getApiVerstion();
    bool passedTagChecked = await Api.getAllTags();
    bool passedCatChecked = await Api.getAllCats();
    print(passedCatChecked);
    print(passedTagChecked);
    print('Can go');
    print(passedApiChecked);
    if(passedApiChecked && passedTagChecked && passedCatChecked) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('Go to Playstore');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appVersionCheck();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(size),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 130, left: 30),
            child: Text(
              "Food Monkey",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Constants.normal),
            ),
          ),
          Center(
              child: Image.asset(
            'assets/images/fm.png',
            scale: 1.5,
          )),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Constants.accent,
                  valueColor: AlwaysStoppedAnimation(Constants.normal),
                ),
                SizedBox(height: 130)
              ],
            ),
          )
        ],
      ),
    );
  }
}
