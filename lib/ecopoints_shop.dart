import 'package:flutter/material.dart';
import 'Utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
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
      body: GridView.count(
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
        unselectedItemColor: AppColors.unselectedColor,
      ),
    );
  }
}
