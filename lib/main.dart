import 'package:flutter/material.dart';
import 'grading.dart';
//ignore_for_file: prefer_const_constructors
//ignore_for_file:prefer_const_literals_to_create_immutables
//ignore_for_file:prefer_final_fields
//ignore_for_file:must_be_immutable
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'grading Simulator',
      debugShowCheckedModeBanner: false,
      home: grading(),

    );
  }
}