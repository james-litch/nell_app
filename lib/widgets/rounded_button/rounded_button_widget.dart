library rounded_button_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'rounded_button_mobile.dart';
part 'rounded_button_tablet.dart';
part 'rounded_button_desktop.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final function;

  RoundedButtonWidget({
    @required this.text,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    @required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _RoundedButtonMobile(
        text: text,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        boarder: boarder,
        function: function,
      ),
    );
  }
}
