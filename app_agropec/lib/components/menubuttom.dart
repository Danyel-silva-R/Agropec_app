import 'package:app_agropec/theme/theme.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const MenuButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.but,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 35, color: AppColors.white),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
