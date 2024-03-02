import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/business_logic/app_cubit.dart';

class CustomTextField extends StatefulWidget {
  final AppCubit appCubit;
  final Function(String)? onSubmitted;
  final Color? borderColor;
  final void Function()? iconOnPressed;
  const CustomTextField(
      {super.key,
      required this.appCubit,
      this.onSubmitted,
      this.borderColor = Colors.blue,
      this.iconOnPressed});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController =
        TextEditingController(text: widget.appCubit.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onSubmitted: widget.onSubmitted,
      onChanged: (value) {
        widget.appCubit.location = value;
      },
      style: TextStyle(color: widget.appCubit.getThemeMode(lightMode: Colors.black, darkMode: Colors.white)),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 10, right: 10),
        suffixIcon: IconButton(
            onPressed: widget.iconOnPressed,
            icon: Icon(Icons.search,
                color: widget.appCubit.getThemeMode(
                    lightMode: Colors.black, darkMode: Colors.white))),
        hintText: 'enter_city_name'.tr(),
        hintStyle: TextStyle(
            color: widget.appCubit
                .getThemeMode(lightMode: Colors.grey, darkMode: Colors.white)),
        labelText: 'search'.tr(),
        labelStyle: TextStyle(color: widget.borderColor, fontSize: 20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.borderColor!, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.borderColor!, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.borderColor!, width: 2)),
      ),
    );
  }
}
