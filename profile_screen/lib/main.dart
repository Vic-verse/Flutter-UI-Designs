import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'purchase_history.dart';
import 'wish_list.dart';
import 'settings.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/wish_list': (context) => WishList(),
        '/purchase_history': (context) => PurchaseHistory(),
        '/settings': (context) => Settings(),
      },
      title: 'Profile Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.black,
        accentColor: Colors.blue[400],
      ),
      home: ProfilePage(),
    );
  }
}
