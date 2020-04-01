part of feedback_card_widget;

class _FeedbackCardMobile extends StatelessWidget {
  final String message;

  const _FeedbackCardMobile({@required this.message});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          '$message',
          style: theme.textTheme.bodyText1.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
