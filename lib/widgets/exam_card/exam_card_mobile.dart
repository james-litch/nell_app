part of exam_card_widget;

class _ExamCardMobile extends StatelessWidget {
  final Exam exam;
  final onTap;
  final onMenuTap;
  final menuItems;
  final bool hasMenu;

  const _ExamCardMobile({
    @required this.exam,
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

    Widget cardBody = Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            '${exam.name}',
            style: theme.textTheme.headline3,
            textAlign: TextAlign.left,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${exam.description}',
            style: theme.textTheme.bodyText1.copyWith(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 15.0),
          child: Row(
            children: <Widget>[Expanded(child: cardBody), menu],
          ),
        ),
      ),
    );
  }
}
