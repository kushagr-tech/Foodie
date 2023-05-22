
import 'package:flutter/material.dart';
import 'package:foodie/core/api_client.dart';
import 'package:foodie/widget/grid_item.dart';

import '../constants/restraunt_model.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
    late Future<List<Restaurant>> restaurant ;

    TextEditingController searchController = TextEditingController();

    @override
  void initState() {
    super.initState();
    restaurant = searchRestaurant("Veg");

    // Start listening to changes.
    searchController.addListener(search);
  }
    void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    searchController.dispose();
    super.dispose();
  }


      search(){
        print(searchController.text);
        setState(() {
        restaurant = searchRestaurant(searchController.text);
        });
      }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 16,
      ),
      // buildSearchBar(),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for restaurants or cuisine',
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      // SizedBox(
      //   height: 50,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       buildFilterButton("Veg"),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       buildFilterButton("Non-Veg"),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       buildFilterButton("Delivery"),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       buildFilterButton("Dine Out"),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       buildFilterButton("Night Life"),
      //       const SizedBox(
      //         width: 20,
      //       ),
      //     ],
      //   ),
      // ),
      SizedBox(
        height: 12,
      ),
      Expanded(child: buildGridView(restaurant, context)),
    ]);
  }
}
