import 'package:flutter/material.dart';

import 'about_app.dart';

class NavBar extends StatelessWidget {
   NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(

        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Mahmoud Elsaeed"),
            accountEmail: Text("mahmoud@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff35B700),
               ),
          ),

          const Material(
            type: MaterialType.transparency,
            child: ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text("Profile"),
hoverColor: Colors.cyan,
              focusColor: Colors.cyan,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text("Messages"),

          ),

          const ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),

          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),

          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),

          ),
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutApp()));
            },
            child: const Material(
              type: MaterialType.transparency,
              child: ListTile(
                leading: Icon(Icons.info_outlined),
                title: Text("About Us"),
                hoverColor: Colors.cyan,
                focusColor: Colors.cyan,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sign Out"),

          ),

        ],
      ),
    );
  }
}
