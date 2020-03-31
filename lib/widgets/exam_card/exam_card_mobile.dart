part of exam_card_widget;

class _ExamCardMobile extends StatelessWidget {
  final Exam exam;
  final onTap;

  const _ExamCardMobile({@required this.exam, this.onTap});
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
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '${exam.name}',
                style: theme.textTheme.bodyText1.copyWith(fontSize: 25),
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
        ),
      ),
    );
  }
}
