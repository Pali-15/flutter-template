import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/common_widgets/base_screen.dart';
import 'package:template/common_widgets/buttons.dart';
import 'package:template/screens/page_1/bloc/bloc.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Page 1',
      children: BlocBuilder<Page1Bloc, Page1BlocState>(
        builder: (context, state) {
          if (state is Page1BlocStateLoaded) {
            return Column(
              children: [
                AppElevatedButton.primary(
                  context: context,
                  label: "Go to nested page",
                  onPressed: () {
                    context.pushNamed("page1nested");
                  },
                ),
                ...state.data.map(
                  (e) => Text(e),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
