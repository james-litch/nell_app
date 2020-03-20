part of bottom_sheet_widget;

class _BottomSheetMobile extends StatelessWidget {
  final Widget body;
  final Color primaryColor;
  final Color secondaryColor;
  final onClose;
  final String title;

  _BottomSheetMobile({
    @required this.body,
    this.primaryColor,
    this.secondaryColor,
    this.onClose,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    Widget closeButton = IconButton(
      icon: Icon(
        Icons.close,
        size: 30.0,
        color: secondaryColor,
      ),
      onPressed: () => onClose(),
    );

    Widget sheetTitle = Expanded(
       
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: secondaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget sheetTop = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        closeButton,
        sheetTitle,
      ],
    );

    return BottomSheet(
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[sheetTop, body],
              ),
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
