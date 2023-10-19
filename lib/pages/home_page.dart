import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animeController;

  @override
  void initState() {
    super.initState();

    _animeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _animeController!, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        elevation: 0,
        title: appBarTitle(),
      ),
      body: cat(),
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

  onTap() {
    if (_animeController!.status == AnimationStatus.completed) {
      _animeController!.reverse();
    } else if (_animeController!.status == AnimationStatus.dismissed) {
      _animeController!.forward();
    }
  }

  Widget cat() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          animationBuilder(),
          GestureDetector(
            onTap: onTap,
            child: catBody(),
          ),
        ],
      ),
    );
  }

  Widget catHead() {
    return Image.asset(
      'assets/images/cat3.png',
      fit: BoxFit.fill,
      width: 400,
      height: 300,
    );
  }

  Widget animationBuilder() {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return Positioned(
          // margin: EdgeInsets.only(top: _animation!.value),
          bottom: _animation!.value,
          right: 0,
          left: 0,
          child: child!,
        );
      },
      child: catHead(),
    );
  }

  Widget catBody() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.white,
    );
  }
}
