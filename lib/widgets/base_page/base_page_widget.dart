library base_page_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'base_page_mobile.dart';

class BasePageWidget extends StatelessWidget {
  final String pageName;
  final Widget content;

  BasePageWidget({this.pageName, @required this.content});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _BasePageMobile(pageName: pageName, content: content,),
    );
  }
}
