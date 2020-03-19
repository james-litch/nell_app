part of bottom_sheet_widget;

class _BottomSheetMobile extends StatelessWidget {
  final Widget body;
  final Color primaryColor;
  final Color secondaryColor;
  final onClose;

  _BottomSheetMobile({
    @required this.body,
    this.primaryColor,
    this.secondaryColor,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    Widget closeButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          Icons.close,
          size: 30.0,
          color: secondaryColor,
        ),
        onPressed: () => onClose(),
      ),
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
                children: <Widget>[closeButton, body],
              ),
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
