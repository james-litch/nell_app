part of bottom_sheet_widget;

class _BottomSheetMobile extends StatelessWidget {
  final Widget body;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget sheetTop;

  _BottomSheetMobile({
    @required this.body,
    this.primaryColor,
    this.secondaryColor,
    this.sheetTop,
  });

  @override
  Widget build(BuildContext context) {
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
