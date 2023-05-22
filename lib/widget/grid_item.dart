import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/restraunt_model.dart';
import '../pages/productpages.dart';

Widget buildGridItem(Restaurant? recieveddata, BuildContext context) {
  Restaurant data;
  if (recieveddata != null) {
    data = recieveddata;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDescriptionPage(data: data)),
        ),
        splashColor: ThemeOrangeAccent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
                height: 110,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[700],
                  size: 16,
                ),
                Text(
                  data.rate.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${data.votes} ratings)',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$rupeeSymbol ${data.cost}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  } else {
    return Container();
  }
}

Widget buildFilterButton(String title) {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButtonStyle,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ));
}

FutureBuilder buildGridView(
    Future<List<Restaurant>> restaurants, BuildContext context) {
  return FutureBuilder<List<Restaurant>>(
    future: restaurants,
    builder: (context, snapshot) {
      if (snapshot.hasData)
       {
        if(snapshot.data?.length == 0){
          return Container(
            child: Text("No Restaurant Found",style: TextStyle(fontSize: 20,color: ThemeOrangeAccent),),
          );
        }
        else
        {
        return GridView.builder(
    itemCount: snapshot.data?.length,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return buildGridItem(snapshot.data?[index], context);
    },
  );}
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}

Widget buildSearchBar() {
  TextEditingController searchController = TextEditingController();
  return Container(
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
  );
}
