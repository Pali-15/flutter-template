import 'package:flutter/material.dart';
import 'package:template/common_widgets/base_screen.dart';
import 'package:template/design/spacing.dart';
import 'package:template/design/theme.dart';
import 'package:template/extensions/context_design_extension.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Page 2',
      children: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: ThemeSwitcher.lightThemeNotifier,
              builder: (context, value, child) => Switch(
                activeTrackColor: context.colors.switcherActive,
                value: value,
                onChanged: (_) => ThemeSwitcher.switchTheme(),
              ),
            ),
            SizedBox(height: AppSpacing.xs.vertical),
            Text(
              'Switch to ${Theme.of(context).brightness == Brightness.dark ? "Light" : "Dark"} Theme',
              style: context.textStyles.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
