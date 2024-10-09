import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countprovider = Provider.of<CountProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 1), (timer) {
      countprovider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countprovider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Tutorials"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Consumer<CountProvider>(builder: (context, value, child) {
            print("Only this widget build");
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprovider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
