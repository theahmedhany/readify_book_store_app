import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 6,
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff9CA986)),
      ),
    );
  }
}
