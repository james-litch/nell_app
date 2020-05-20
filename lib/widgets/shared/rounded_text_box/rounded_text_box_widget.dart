library rounded_text_box_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'rounded_text_box_mobile.dart';
part 'rounded_text_box_tablet.dart';
part 'rounded_text_box_desktop.dart';

class RoundedTextBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final IconData icon;
  final onChanged;

  RoundedTextBoxWidget({
    @required this.controller,
    @required this.isPassword,
    @required this.label,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    this.icon, this.onChanged,
  }) : assert(controller != null);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _RoundedTextBoxMobile(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        boarder: boarder,
        controller: controller,
        isPassword: isPassword,
        label: label,
        icon: icon,
        onChnaged: onChanged,
      ),
    
    );
  }
}
