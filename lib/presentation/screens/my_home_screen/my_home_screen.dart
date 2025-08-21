import 'package:flutter/material.dart';

import '../../layouts/desktop_layout.dart';
import '../../layouts/mobile_layout.dart';
import '../../layouts/tablet_layout.dart';
import '../../widgets/adaptive_layout_widget.dart';

class MyHomeScreen extends StatelessWidget {

  const MyHomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayoutWidget(
        mobileLayout: (context) => MobileLayout(appContext: context),
        tabletLayout: (context) => TabletLayout(appContext: context),
        desktopLayout: (context) => DesktopLayout(appContext : context));
  }
}