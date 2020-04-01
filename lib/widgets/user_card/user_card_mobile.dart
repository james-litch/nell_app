part of user_card_widget;

class _UserCardMobile extends StatelessWidget {
  final User user;

  const _UserCardMobile({@required this.user});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
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
        ),
      ),
    );
  }
}
