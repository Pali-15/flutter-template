import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/common_widgets/base_screen.dart';
import 'package:template/theme.dart';

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
                value: value,
                onChanged: (_) => ThemeSwitcher.switchTheme(),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Switch to ${Theme.of(context).brightness == Brightness.dark ? "Light" : "Dark"} Theme',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
