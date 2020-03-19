library bottom_sheet_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'bottom_sheet_mobile.dart';
part 'bottom_sheet_tablet.dart';
part 'bottom_sheet_desktop.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget body;
  final Color primaryColor;
  final Color secondaryColor;
  final  onClose;

  BottomSheetWidget({
    @required this.body,
    this.primaryColor = Colors.white,
    this.secondaryColor = Colors.blue,
    @required this.onClose,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _BottomSheetMobile(
        body: body,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        onClose: onClose,
      ),
    );
  }
}
