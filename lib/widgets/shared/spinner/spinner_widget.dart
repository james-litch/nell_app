library spinner_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'spinner_mobile.dart';

class SpinnerWidget extends StatelessWidget {
  final Color color;

  const SpinnerWidget({this.color});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _SpinnerMobile(color: color),
    );
  }
}
