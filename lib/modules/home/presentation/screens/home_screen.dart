import 'package:flutter/material.dart';
import 'package:framework_test/modules/home/presentation/screens/account_screen.dart';
import 'package:framework_test/modules/home/presentation/screens/fruit_list_screen.dart';
import 'package:framework_test/modules/home/presentation/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void changeIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          FruiListScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onChangeIndex: changeIndex,
        currentIndex: currentIndex,
      ),
    );
  }
}
