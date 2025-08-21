import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/app_cubit.dart';
import 'non_search_view.dart';
import 'search_view.dart';

class WeatherScreenBody extends StatelessWidget {
  final AppCubit appCubit;
  const WeatherScreenBody({super.key, required this.appCubit});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Visibility(
          visible: appCubit.isSearch,
          replacement: NonSearchView(appCubit: appCubit),
          child: SearchView(appCubit: appCubit),
        );
      },
    );
  }
}