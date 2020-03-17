part of rounded_button_widget;

class _RoundedButtonMobile extends StatelessWidget {
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final function;

  _RoundedButtonMobile({
    @required this.text,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    @required this.function,
  });
  @override
  Widget build(BuildContext context) {
    Color boarderColor = boarder ? secondaryColor : primaryColor;
    return RaisedButton(
      onPressed: () => function(),
      highlightElevation: 0.0,
      splashColor: secondaryColor,
      highlightColor: secondaryColor,
      elevation: 0.0,
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: boarderColor, width: 2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: secondaryColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
