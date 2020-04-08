part of question_card_widget;

class _QuestionCardMobile extends StatefulWidget {
  final question;
  final onTap;
  final onMenuTap;
  final menuItems;
  final bool hasMenu;
  final Color onTapColor;

  const _QuestionCardMobile({
    @required this.question,
    this.onTap,
    this.onMenuTap,
    this.menuItems,
    @required this.hasMenu,
    @required this.onTapColor,
  });

  @override
  __QuestionCardMobileState createState() => __QuestionCardMobileState();
}

class __QuestionCardMobileState extends State<_QuestionCardMobile> {
  bool isPressed;
  @override
  void initState() {
    super.initState();
    this.setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget menu = widget.hasMenu
        ? PopupMenuButton(
            onSelected: (value) => widget.onMenuTap(value),
            icon: Icon(Icons.more_vert, color: Colors.blue),
            itemBuilder: (BuildContext context) => widget.menuItems,
          )
        : Container();

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: isPressed ? widget.onTapColor : Colors.blue, width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          widget.onTap();
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  '${widget.question.question}',
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
