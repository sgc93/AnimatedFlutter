import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        elevation: 0,
        title: appBarTitle(),
      ),
      body: animationContainer(),
    );
  }

  Widget appBarTitle() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.pets_sharp),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Cute Cat | Animation'),
          ),
        ],
      ),
    );
  }

  animationContainer() {
    return Image.asset('assets/images/cat1.jpg');
  }
}
