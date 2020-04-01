library dictionary_page_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'dictionary_page_mobile.dart';
part 'dictionary_page_tablet.dart';
part 'dictionary_page_desktop.dart';

class DictionaryPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _DictionaryPageMobile(),
        desktop: _DictionaryPageDesktop(),
        tablet: _DictionaryPageTablet(),
    );
  }
}