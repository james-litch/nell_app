library home_page_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'home_page_mobile.dart';
part 'home_page_tablet.dart';
part 'home_page_desktop.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _HomePageMobile(),
        desktop: _HomePageDesktop(),
        tablet: _HomePageTablet(),
    );
  }
}