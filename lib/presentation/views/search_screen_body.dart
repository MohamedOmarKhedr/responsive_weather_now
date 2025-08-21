import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

import '../widgets/custom_text_field.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  late AppCubit appCubit;

  @override
  void didChangeDependencies() {
    appCubit = AppCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state is GetWeatherDataSuccessState) {
          appCubit.checkTranslator(context: context);
          Navigator.pop(context);
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          if (Navigator.canPop(context)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          }
        } else {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * .1),
              child: CustomTextField(
                appCubit: appCubit,
                onSubmitted: (value) {
                  appCubit.getWeatherData(location: appCubit.location);
                },
                iconOnPressed: () {
                  appCubit.getWeatherData(location: appCubit.location);
                },
                borderColor: appCubit.getThemeMode(
                    lightMode: Colors.blue, darkMode: Colors.white),
              ),
            ),
          );
        }
        return const Center();
      }),
    );
  }
}
