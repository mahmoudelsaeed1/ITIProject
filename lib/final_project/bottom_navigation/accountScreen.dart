import 'package:flutter/material.dart';

class accountScreen extends StatelessWidget {
  const accountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.transparent,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                color: const Color(0xff35B700).withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.red,
                onPressed: () async {},
                child: const Text('Change Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      //fontFamily: lang.font
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.transparent,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                color: const Color(0xff35B700).withOpacity(0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                splashColor: Colors.red,
                onPressed: () async {},
                child: const Text('Update Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      //fontFamily: lang.font
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
