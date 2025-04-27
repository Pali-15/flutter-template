import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/common_widgets/base_screen.dart';
import 'package:template/common_widgets/buttons.dart';
import 'package:template/extensions/context_extension.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        children: Column(
      children: [
        Text(
          "Page 1",
          style: context.textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        AppElevatedButton.primary(
          context: context,
          label: "Go to nested page",
          onPressed: () {
            context.pushNamed("page1nested");
          },
        ),
      ],
    ));
  }
}
