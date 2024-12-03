import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget  {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.local_cafe, size: 24), // Replace with your preferred icon
          SizedBox(width: 8), // Spacing between icon and text
          Text(
            'Dairy Software by Binary Solutions',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      backgroundColor: Colors.lightBlueAccent, // Customize background color
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
