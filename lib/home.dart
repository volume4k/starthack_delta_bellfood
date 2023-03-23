import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:starthack_delta_bellfood/Utils/styles.dart';
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
      body: Center(
        child: Column(
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Ecocoin Shop',
          ),
        ],
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.unselectedColor
      ),
    );
  }
}
