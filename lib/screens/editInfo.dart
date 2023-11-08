
import 'package:employee_data/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/post_employee.dart';
import '../services/services.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key, required this.categories});

//final other params
  final Datum categories;

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  String? firstName;
  String? lastName;
  String? names;
  bool edit = false;

  void updateText(val) {
    setState(() {
      names = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    firstName = widget.categories.firstName;
    lastName = widget.categories.lastName;
    return Scaffold(
      body: Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () async {
                    bool response = await Services().updateData(
                        widget.categories.id,
                        widget.categories.firstName!,
                        widget.categories.lastName!);
                    if (response) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailedView(categories: widget.categories)));
                    }
                  },
                  child: const Text('Save',
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
            SizedBox(height: 20),
            Text(
              "Id: ${widget.categories.id}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'first Name',
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: Colors.lightGreen),
              initialValue: firstName ?? '',
              // enabled: edit,
              onChanged: (value) {
                updateText(value);
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'last Name',
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: Colors.lightGreen),
              initialValue: lastName ?? '',
              // enabled: edit,
              onChanged: (value) {
                updateText(value);
              },
            ),
            SizedBox(height: 20),
            Text(
              widget.categories.email! ?? '',
              style: TextStyle(fontSize: 15, color: Colors.lightGreen),
            )
          ],
        ),
      ),
    );
  }
}
