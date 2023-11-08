import 'package:employee_data/services/services.dart';
import 'package:flutter/material.dart';

import '../models/post_employee.dart';
import 'detail_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<Datum> data=[];
  List<Datum>? employeeData;
  var isLoaded = false;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    data = await Services().getPost();
    _tabController = TabController(length: data!.length, vsync: this);
    if (data != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Home Page',
                  style: TextStyle(color: Colors.white)),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Refresh',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
              bottom: TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: data!
                    .map((e) => Text(
                          e.firstName!,
                          style: TextStyle(color: Colors.white),
                        ))
                    .toList(),
                onTap: (value) {
                  setState(() {});
                },
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: data!
                  .map((e) => DetailedView(categories: e))
                  .toList(),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          );
  }
}
