import 'package:employee_data/screens/editInfo.dart';
import 'package:flutter/material.dart';

import '../models/post_employee.dart';

class DetailedView extends StatefulWidget {
  const DetailedView({super.key, required this.categories});

//final other params
  final Datum categories;

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  List<Datum> data = [];
  var isLoaded = false;

// final List<String> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: Colors.lightGreen)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) =>
                        EditInfo(categories: widget.categories),
                  ))
                      .then((value) {
                    setState(() {});
                  });
                },
                child: const Text('Edit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {},
                child: const Text('Delete',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 80),
              CircleAvatar(
                backgroundColor: Colors.lightGreen,
                radius: 25,
                backgroundImage: NetworkImage(widget.categories.avatar),
              )
            ],
          ),
          Text(widget.categories.firstName! ?? ''),
          Text(widget.categories.lastName! ?? ''),
          Text("${widget.categories.id}"),
          Text(widget.categories.email! ?? '')
        ],
      ),
    );
  }
}
