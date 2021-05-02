import 'package:flutter/material.dart';
import 'package:flutter_midterm1/screens/add_new_clothes.dart';
import 'package:flutter_midterm1/screens/clothes_details.dart';
import 'package:flutter_midterm1/screens/edit_clothes.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        ClothesDetailsScreen.routeName: (ctx) => ClothesDetailsScreen(),
        AddNewClothes.routeName: (ctx) => AddNewClothes(),
        EditClothes.routeName: (ctx) => EditClothes(),
      },
    );
  }
}

