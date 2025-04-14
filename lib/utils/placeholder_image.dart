import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final String category;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? iconColor;

  const PlaceholderImage({
    super.key,
    required this.category,
    this.height = 200,
    this.width = double.infinity,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color bgColor;
    Color iconClr;

    switch (category.toLowerCase()) {
      case 'nutrisi':
        icon = Icons.restaurant;
        bgColor = Colors.orange[100]!;
        iconClr = Colors.orange;
        break;
      case 'olahraga':
        icon = Icons.fitness_center;
        bgColor = Colors.blue[100]!;
        iconClr = Colors.blue;
        break;
      case 'kesehatan':
        icon = Icons.medical_services;
        bgColor = Colors.green[100]!;
        iconClr = Colors.green;
        break;
      case 'mental':
        icon = Icons.psychology;
        bgColor = Colors.purple[100]!;
        iconClr = Colors.purple;
        break;
      case 'pregnancy':
        icon = Icons.pregnant_woman;
        bgColor = Colors.pink[100]!;
        iconClr = Colors.pink;
        break;
      default:
        icon = Icons.image;
        bgColor = Colors.grey[300]!;
        iconClr = Colors.grey;
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: height * 0.3,
              color: iconColor ?? iconClr,
            ),
            const SizedBox(height: 8),
            Text(
              category,
              style: TextStyle(
                color: iconColor ?? iconClr,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 