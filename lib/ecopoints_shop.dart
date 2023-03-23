import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:starthack_delta_bellfood/home.dart';
import 'Utils/app_colors.dart';

class EcopointsShop extends StatelessWidget {
  const EcopointsShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Ecopoints Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ecopoints Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body:
      GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: AppColors.mainColor,
            child: const Text("holiday"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: AppColors.mainColor,
            child: const Text('money'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: AppColors.mainColor,
            child: const Text('donate'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: AppColors.mainColor, 
            child: const Text("lunch"),
          ),
        ],
      ),

      bottomNavigationBar: GNav(
        backgroundColor: AppColors.navigationBarBackgroundColor,
        color: AppColors.navigationBarIconColor,
        activeColor: AppColors.navigationBarIconColor,
        tabBackgroundColor: AppColors.navigationBarTabBackgroundColor,
        gap: 8, //Abstand zwischen den Symbolen und Zeichen
        onTabChange: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EcopointsShop()),
            );
          }
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.add_circle_outline,
            text: 'Add Activity',
          ),
          GButton(
            icon: Icons.add_shopping_cart,
            text: 'Ecocoin Shop',
          ),
        ],
      ),
    );
  }
}
