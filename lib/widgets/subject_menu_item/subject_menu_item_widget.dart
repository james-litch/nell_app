library subject_menu_item_widget;

import 'package:nell/core/models/subject_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'subject_menu_item_mobile.dart';

class SubjectMenuItemWidget extends StatelessWidget {
  final Subject subject;
  final onTap;

  const SubjectMenuItemWidget({@required this.subject, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _SubjectMenuItemMobile(
        subject: subject,
        onTap: onTap,
      ),
    );
  }
}
