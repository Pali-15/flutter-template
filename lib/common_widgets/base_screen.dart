import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/extensions/context_extension.dart';

class BasePage extends StatelessWidget {
  final Widget children;
  final String? title;
  final bool enableBackButton;
  final EdgeInsets? padding;
  const BasePage({
    super.key,
    required this.children,
    this.title,
    this.enableBackButton = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: (!enableBackButton && title == null)
          ? null
          : AppBar(
              title: title == null
                  ? null
                  : Text(
                      title!,
                      style: context.textStyles.headline,
                    ),
              leading: enableBackButton
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: Icon(Icons.arrow_back),
                    )
                  : null,
            ),
      body: SafeArea(
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: children,
        ),
      ),
    );
  }
}
