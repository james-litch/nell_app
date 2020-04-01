library rounded_button_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'rounded_button_mobile.dart';
part 'rounded_button_tablet.dart';
part 'rounded_button_desktop.dart';

class RoundedButtonWidget extends StatefulWidget {
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final function;
  final bool busy;

  RoundedButtonWidget({
    @required this.text,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    @required this.function,
    this.busy = false,
  });

  @override
  _RoundedButtonWidgetState createState() => _RoundedButtonWidgetState();
}

class _RoundedButtonWidgetState extends State<RoundedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _RoundedButtonMobile(
        text: widget.text,
        primaryColor: widget.primaryColor,
        secondaryColor: widget.secondaryColor,
        boarder: widget.boarder,
        function: widget.function,
        busy: widget.busy,
      ),
    );
  }
}
