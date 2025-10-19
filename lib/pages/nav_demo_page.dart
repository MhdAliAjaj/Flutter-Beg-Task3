import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class NavDemoPage extends StatefulWidget {
  const NavDemoPage({super.key});

  @override
  State<NavDemoPage> createState() => _NavDemoPageState();
}

class _NavDemoPageState extends State<NavDemoPage> {
  int _index = 1; // start with Search active like the mock

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE6F2FF), Colors.white],
          ),
        ),
        child: Center(
          child: Text(
            'Tab #$_index',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          shape: const CircleBorder(side: BorderSide(color: Color(0x14000000))),
          elevation: 6,
          child: Icon(Icons.add, color: Colors.grey.shade600, size: 30),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _index,
        onItemSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}
