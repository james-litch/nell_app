part of definition_card_widget;

class _DefinitionCardMobile extends StatelessWidget {
  final Definition definition;
  final onTap;

  const _DefinitionCardMobile(
      {@required this.definition, @required this.onTap});
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
                '${definition.phrase}',
                style: theme.textTheme.headline3,
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              '${definition.definition}',
              style: theme.textTheme.bodyText2.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
