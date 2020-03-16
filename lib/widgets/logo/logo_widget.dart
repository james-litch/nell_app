library logo_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'logo_mobile.dart';
part 'logo_tablet.dart';
part 'logo_desktop.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _LogoMobile(),
        desktop: _LogoDesktop(),
        tablet: _LogoTablet(),
    );
  }
}