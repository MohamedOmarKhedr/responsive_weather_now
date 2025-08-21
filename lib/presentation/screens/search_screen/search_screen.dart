import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

import '../../views/search_screen_body.dart';
import '../../widgets/custom_bottom_sheet_widget.dart';
import '../../widgets/custom_scroll_remaining_screen_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late AppCubit appCubit;

  @override
  void didChangeDependencies() {
    appCubit = AppCubit.get(context);
    appCubit.changeConnectivity();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appCubit.getThemeMode(
              lightMode: Colors.white, darkMode: Colors.black),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                )),
            backgroundColor: appCubit.getThemeMode(
                lightMode: Colors.blue, darkMode: Colors.black),
            title: Text(
              'weather_now'.tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: CustomScrollRemainingScreenWidget(context: context,child: const SearchScreenBody()),
          bottomSheet: CustomBottomSheetWidget(
            connectionStatus: appCubit.connectionStatus,
            appCubit: appCubit,
          ),
        );
      },
    );
  }
}
