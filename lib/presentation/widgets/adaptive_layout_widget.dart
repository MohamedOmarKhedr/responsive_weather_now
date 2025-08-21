import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../styles/size_config.dart';

class AdaptiveLayoutWidget extends StatelessWidget {
  final WidgetBuilder mobileLayout,tabletLayout,desktopLayout;
  const AdaptiveLayoutWidget({super.key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (kDebugMode) {
        print(constrains.maxWidth);
      }
      if (constrains.maxWidth < SizeConfig.tablet) {
        return mobileLayout(context);
      } else if (constrains.maxWidth < SizeConfig.desktop){
        return tabletLayout(context);
      }
      else{
        return desktopLayout(context);
      }
    });
  }
}
