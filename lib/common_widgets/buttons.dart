import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/extensions/context_extension.dart';

class AppTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color color;

  const AppTextButton._({
    required this.label,
    this.onPressed,
    required this.color,
  });

  factory AppTextButton.transparent({
    Key? key,
    required String label,
    void Function()? onPressed,
  }) {
    return AppTextButton._(
      label: label,
      onPressed: onPressed,
      color: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color,
        side: BorderSide(
          color: color,
          width: 1.w,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color backgroundColor;

  const AppElevatedButton._({
    required this.label,
    this.onPressed,
    required this.backgroundColor,
  });

  factory AppElevatedButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    required BuildContext context,
  }) {
    return AppElevatedButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: context.colorScheme.inversePrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textTheme.bodyMedium!
            .copyWith(color: context.colorScheme.primary),
      ),
    );
  }
}
