import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:starthack_delta_bellfood/home.dart';
import 'AddActivity.dart';
import 'Ecopoints_Shop.dart';
import 'Utils/app_colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Search'),
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Search()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddAcitivity()),
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
