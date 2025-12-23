import 'package:flutter/material.dart';

void main(){
 runApp(const Adai());
}

class Adai extends StatelessWidget {
  const Adai({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}