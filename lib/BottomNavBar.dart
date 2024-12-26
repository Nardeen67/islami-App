import 'package:flutter/material.dart';
import '../sebha.dart';
import '../radio.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xFFE2BE7F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('assets/image/Vector.png', 0, context),
          _buildNavItem('assets/image/book-album-svgrepo-com 1.png', 1, context),
          _buildNavItem('assets/image/necklace-islam-svgrepo-com 1.png', 2, context),
          _buildNavItem('assets/image/Vector (1).png', 3, context),
          _buildNavItem('assets/image/barchart.png', 4, context),
        ],
      ),
    );
  }

  Widget _buildNavItem(String imagePath, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemTapped(index);


        if (index == 2) {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TasbihScreen()),
          );
        } else if (index == 3) {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RadioScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(6),
        width: 70,
        decoration: BoxDecoration(
          color: selectedIndex == index ? Color(0xFF20202099) : Colors.transparent,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Image.asset(
          imagePath,
          width: 22,
          height: 28,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
