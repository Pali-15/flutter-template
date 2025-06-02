import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/common_widgets/buttons.dart';
import 'package:template/extensions/context_extension.dart';

class AppErrorWidget extends StatelessWidget {
  final void Function()? retry;
  const AppErrorWidget({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline_rounded),
        SizedBox(
          height: 30.h,
        ),
        Text(
          "Oops something went wrong, please try again!",
          style: context.textStyles.subtitle,
        ),
        SizedBox(
          height: 30.h,
        ),
        AppElevatedButton.primary(
          label: "Try again",
          onPressed: retry,
          context: context,
        ),
      ],
    );
  }
}
