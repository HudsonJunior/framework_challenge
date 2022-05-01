import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.onChangeIndex,
    required this.currentIndex,
  }) : super(key: key);

  final ValueSetter<int> onChangeIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onChangeIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 5,
      backgroundColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.purple,
      ),
      items: const [
        BottomNavigationBarItem(
          label: 'Frutas',
          icon: Icon(
            Icons.shop,
            color: Colors.purple,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Conta',
          icon: Icon(
            Icons.person,
            color: Colors.purple,
          ),
        )
      ],
    );
  }
}
