// ignore_for_file: non_constant_identifier_names

import 'package:foodie/constants/restraunt_model.dart';
import 'package:foodie/pages/add_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ProductDescriptionPage extends StatelessWidget {
  final Restaurant data;

  const ProductDescriptionPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,  MaterialPageRoute(
              builder: (context) => AddReviewPage(restaurant: data,)),
         );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) => buildPopupDialog(context),
                // );
              },
              child: const Text(
                "Add Review",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ))
        ],
        title: Text(
          data.name,
          style: TextStyle(
            color: ThemeWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ThemeOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: restraunt_details(),
            ),
          ],
        ),
      ),
    );
  }

  Column restraunt_details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          data.cuisines[0],
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          data.dishLiked,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Price:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              '$rupeeSymbol ${data.cost}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Online Order:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Icon(
              data.onlineOrder ? Icons.check : Icons.close,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Restaurant Type:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text(
              data.restType,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Book Table:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Icon(
              data.bookTable ? Icons.check : Icons.close,
            ),
            // Text(
            //   '${data.bookTable ? Icons.check : Icons.close}',
            //   style: const TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 18.0,
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Address:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Text(
                data.address,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => launchUrl(
                      Uri.parse(data.url),
                    ),
                style: ElevatedButtonStyle,
                child: const Text('Order Online')),
            ElevatedButton(
                onPressed: () async {
                  Uri phoneno = Uri.parse(data.phone.toString());
                  if (await launchUrl(phoneno)) {
                  } else {
                  }
                },
                style: ElevatedButtonStyle,
                child: const Text("Call Restaurant Now")),
          ],
        ),
        const SizedBox(
          height: 36,
        ),
        // const Text("Reviews :",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
        // const SizedBox(height: 12,),
        // ListView.builder(itemCount: data.reviews.length,
        //   shrinkWrap: true,

        // prototypeItem: Card(
        //   elevation: 5 ,
        //   child: ListTile(
        //     title: Text(data.reviews.first),
        //   ),
        // ),
        // itemBuilder: (context, index) {
        //   return Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 8.0),
        //     child: Card(
        //       elevation: 5,
        //       child: ListTile(
        //         title: Text(data.reviews[index],style: const TextStyle(fontSize: 14),),
        //       ),
        //     ),
        //   );
        // },
        // )
      ],
    );
  }
}
