part of rounded_button_widget;

class _RoundedButtonMobile extends StatefulWidget {
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final function;
  final bool busy;

  _RoundedButtonMobile({
    @required this.text,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    @required this.function,
    this.busy = false,
  });

  @override
  __RoundedButtonMobileState createState() => __RoundedButtonMobileState();
}

class __RoundedButtonMobileState extends State<_RoundedButtonMobile> {
  @override
  Widget build(BuildContext context) {
    Color boarderColor = widget.boarder ? widget.secondaryColor : widget.primaryColor;
    return RaisedButton(
      onPressed: () => widget.function(),
      highlightElevation: 0.0,
      splashColor: widget.secondaryColor,
      highlightColor: widget.secondaryColor,
      elevation: 0.0,
      color: widget.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: boarderColor, width: 2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: !widget.busy? 
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.secondaryColor,
            fontSize: 20,
          ),
        ):
        CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(widget.secondaryColor),
            )
      ),
    );
  }
}
