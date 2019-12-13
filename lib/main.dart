import 'package:cursos/first_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow[700],
        fontFamily: 'Montserrat'
      ),
      debugShowCheckedModeBanner: false,
      title: 'Cursos',
      home: HomePage() 
    );
  }
}