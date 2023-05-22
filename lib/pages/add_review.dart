// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:foodie/constants/restraunt_model.dart';
import 'package:foodie/core/api_client.dart';

import '../constants/constants.dart';

class AddReviewPage extends StatefulWidget {
  final Restaurant restaurant;

  const AddReviewPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  double _rating = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeOrangeAccent,
        title: const Text(
          'Add Review',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField(
              //   controller: _titleController,
              //   decoration: const InputDecoration(
              //     labelText: 'Title',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter a title';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _descriptionController,
              //   decoration: const InputDecoration(
              //     labelText: 'Description',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter a description';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 16),
              const Text('Rating'),
              Slider(
                value: _rating,
                activeColor: ThemeOrangeAccent,
                inactiveColor: ThemeWhite,
                thumbColor: ThemeOrangeAccent,
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
                min: 0,
                max: 5,
                divisions: 10,
                label: _rating.toString(),
              ),
              const SizedBox(height: 16),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addReview(context, _rating, widget.restaurant.id);
                        setState(() {
                          // _isLoading = true;
                        });
                        // TODO: Implement save functionality
                        // Future.delayed(Duration(seconds: 1)).then((_) {
                        // setState(() {
                        //   _isLoading = false;
                        // });
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Review Added')),
                        // );
                        // });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
