import 'package:flutter/material.dart';

import '../constants/constants.dart';
double _rating = 0.0;


Widget buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Rate Restraunt'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
const Text('Rating'),
        Slider(
          value: _rating,
          activeColor: ThemeOrangeAccent,
          inactiveColor: ThemeWhite,
          thumbColor: ThemeOrangeAccent,
          onChanged: (value) {
            // setState(() {
            //   _rating = value;
            // });
          },
          min: 0,
          max: 5,
          divisions: 10,
          label: _rating.toString(),
        ),      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {

          Navigator.of(context).pop();
        },
        // Color: Theme.of(context).primaryColor,
        child: const Text('Save'),
      ),
    ],
  );
}


BottomNavigationBar buildBottomNavBar(int indexSelected) {
  return BottomNavigationBar(
    // onTap: _onItemTapped,
    currentIndex: indexSelected,
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
