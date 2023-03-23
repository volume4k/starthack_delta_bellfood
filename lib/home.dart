import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:starthack_delta_bellfood/Utils/styles.dart';
import 'package:starthack_delta_bellfood/ecopoints_shop.dart';
import 'package:starthack_delta_bellfood/search.dart';
import 'AddActivity.dart';
import 'Utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';


class Home extends StatelessWidget {
  const Home({super.key});



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BellFood Sustainability'),
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

  int? _score;
  double _progress = 0;

  double _calcProgress() {
    return _score! % 10 / 10;
  }

  void _initializeScore() {
    _score =
        0; /*Placeholder use the useres current score as initilization
    Get the score from the database for the user account
    */
  }

  void changeScore(int delta) {
    _score = delta + _score!;
    //Write Score back to user account
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  iconSize: 40,
                  onPressed: () {},
                ),
                const Spacer(
                  flex: 2,
                ),
                Flexible(
                  flex: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      backgroundColor: AppColors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.accent),
                      value: _progress,
                      minHeight: 20,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                RichText(
                  text: TextSpan(
                      text: _score.toString(), style: AppTextStyles.scoreStyle),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
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

  void _onItemTapped(int index, int _selectedIndex) {
        setState(() {
          _selectedIndex = index;
        });
      }
}
