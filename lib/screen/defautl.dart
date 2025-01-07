import 'package:flutter/material.dart';

class Defautl extends StatefulWidget {
  const Defautl({super.key});

  @override
  State<Defautl> createState() => _DefautlState();
}

class _DefautlState extends State<Defautl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Default"),
      ),
      body: const Center(
        child: Text("Default"),
      ),
    );
  }
}