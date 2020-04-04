library definition_card_widget;

import 'package:nell/core/models/definition_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'definition_card_mobile.dart';

class DefinitionCardWidget extends StatelessWidget {
  final Definition definition;
  final onMenuTap;
  final menuItems;
  final bool hasMenu;
  const DefinitionCardWidget({
    @required this.definition,
    this.onMenuTap,
    this.menuItems,
    @required this.hasMenu,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _DefinitionCardMobile(
        definition: definition,
        onMenuTap: onMenuTap,
        menuItems: menuItems,
        hasMenu: hasMenu,
      ),
    );
  }
}
