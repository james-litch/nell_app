part of subject_menu_item_widget;

class _SubjectMenuItemMobile extends StatelessWidget {
  final Subject subject;
  final onTap;
  final onMenuTap;
  final menuItems;

  const _SubjectMenuItemMobile({
    @required this.subject,
    @required this.onTap,
    @required this.onMenuTap,
    @required this.menuItems,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget menu = PopupMenuButton(
      onSelected: (value) => onMenuTap(value),
      icon: Icon(Icons.more_vert, color: Colors.white),
      itemBuilder: (BuildContext context) => menuItems,
    );

    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(50.0, 5.0, 5.0, 5.0),
                title: Text(
                  '${subject.name}',
                  style: theme.textTheme.headline2.copyWith(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            menu,
          ],
        ),
      ),
    );
  }
}
