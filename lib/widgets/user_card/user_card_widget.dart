library user_card_widget;

import 'package:nell/core/models/user_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'user_card_mobile.dart';

class UserCardWidget extends StatelessWidget {
  final User user;
  final onMenuTap;
  final menuItems;
  final bool hasMenu;

  const UserCardWidget({
    @required this.user,
    this.onMenuTap,
    this.menuItems,
    @required this.hasMenu,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _UserCardMobile(
        user: user,
        hasMenu: hasMenu,
        menuItems: menuItems,
        onMenuTap: onMenuTap,
      ),
    );
  }
}
