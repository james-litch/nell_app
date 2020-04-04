part of user_card_widget;

class _UserCardMobile extends StatelessWidget {
  final User user;
  final onMenuTap;
  final menuItems;
  final bool hasMenu;

  const _UserCardMobile({
    @required this.user,
    this.onMenuTap,
    this.menuItems,
    @required this.hasMenu,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget menu = hasMenu
        ? PopupMenuButton(
            onSelected: (value) => onMenuTap(value),
            icon: Icon(Icons.more_vert, color: Colors.blue),
            itemBuilder: (BuildContext context) => menuItems,
          )
        : Container();

    var cardBody = Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            '${user.name}',
            style: theme.textTheme.headline3,
            textAlign: TextAlign.left,
          ),
        ),
        Text(
          '${user.email}',
          style: theme.textTheme.bodyText2.copyWith(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    );

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[Expanded(child: cardBody), menu],
        ),
      ),
    );
  }
}
