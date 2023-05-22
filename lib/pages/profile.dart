import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // appBar: AppBar(
        //   title: Text('Profile'),
        //   centerTitle: true,
        //   backgroundColor: ThemeOrange,
        // ),
        // bottomNavigationBar: buildBottomNavBar(),
        // body:
        SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/burger.jpg'),
          ),
          const SizedBox(height: 20),
          Text(
            appUser?.userDetails.username ?? "",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
           Text(
            appUser?.userDetails.email ?? "",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
           Text(
            appUser?.userDetails.phoneNo.toString() ?? "",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),
          (appUser?.token == null || appUser?.token =="")?
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Login'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'Login');
            },
          )
          : _buildEditTile(context),
          
        ],
      ),
    );
    // );
  }

  Column _buildEditTile(BuildContext context) {
    return Column(
      children: [
        ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pushNamed(context, 'EditProfile');
              },
            ),
        const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              appUser?.token = "";
              Navigator.pushReplacementNamed(context, 'Login');
            },
          ),
      ],
    );
  }
}
