import 'package:flutter/material.dart';
import 'package:template/common_widgets/base_screen.dart';
import 'package:template/extensions/context_extension.dart';

class Page1Nested extends StatelessWidget {
  const Page1Nested({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      enableBackButton: true,
      children: Center(
        child: Text(
          "Page 1 Nested",
          style: context.textStyles.body,
        ),
      ),
    );
  }
}
