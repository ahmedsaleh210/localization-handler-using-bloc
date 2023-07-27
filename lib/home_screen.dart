import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization_example/core/extensions.dart';

import 'cubit/app_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LanguageCubit>(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(
          context.appLocale.homeTitle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.appLocale.homeContent,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                cubit.changeLanguage();
              },
              child: Text(
                context.appLocale.button,
              )),
          const SizedBox(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
