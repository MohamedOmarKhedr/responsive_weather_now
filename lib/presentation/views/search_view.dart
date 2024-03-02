import 'package:flutter/material.dart';

import '../../business_logic/app_cubit.dart';
import 'search_view_body.dart';

class SearchView extends StatelessWidget {
  final AppCubit appCubit;
  const SearchView({super.key, required this.appCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: appCubit.isDarkMode?const LinearGradient(colors: [Colors.black,Colors.black]):LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: appCubit.getBackgroundColor(appCubit.weatherResponse.current?.condition?.text??''),
        )
      ),
      child: SearchViewBody(appCubit: appCubit,),
    );
  }
}