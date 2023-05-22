import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/constants/restraunt_model.dart';
import 'package:foodie/pages/filters_page.dart';
import 'package:foodie/pages/profile.dart';
import '../core/api_client.dart';
import '../widget/grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Restaurant>> restaurants;
  List<String> titleText = ["Foodie", "Search", "Profile"];
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    restaurants = fetchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      _buildHomePage(context),
      const Filters(),
      const ProfilePage()
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            titleText[selectedIndex],
            style: TextStyle(
              color: ThemeWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        bottomNavigationBar: buildBottomNavBar(),
        body: widgetOptions.elementAt(selectedIndex));
  }

  Column _buildHomePage(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Expanded(child: buildGridView(restaurants, context)),
      ],
    );
  }

  BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
