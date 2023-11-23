import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imgPath;
  final Function()? onTap;
  const SquareTile({super.key, required this.imgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16)),
        child: Image.asset(
          imgPath,
          height: 40,
        ),
      ),
    );
  }
}
