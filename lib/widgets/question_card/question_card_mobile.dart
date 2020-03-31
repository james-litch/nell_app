part of question_card_widget;

class _QuestionCardMobile extends StatelessWidget {
  final question;
  final onTap;

  const _QuestionCardMobile({@required this.question, this.onTap});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: ListTile(
          title: Text(
            '${question.question}',
            style: theme.textTheme.bodyText1.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
