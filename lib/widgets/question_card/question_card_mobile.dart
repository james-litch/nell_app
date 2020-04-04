part of question_card_widget;

class _QuestionCardMobile extends StatelessWidget {
  final question;
  final onTap;
  final onMenuTap;
  final  menuItems;
  final bool hasMenu;

  const _QuestionCardMobile({
    @required this.question,
    this.onTap,
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

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  '${question.question}',
                  style: theme.textTheme.bodyText1.copyWith(fontSize: 25),
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
