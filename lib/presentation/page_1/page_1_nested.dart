import 'package:flutter/material.dart';
import 'package:template/common_widgets/base_screen.dart';

class Page1Nested extends StatelessWidget {
  const Page1Nested({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      enableBackButton: true,
      children: Center(
        child: Text(
          "Page 1 Nested",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
