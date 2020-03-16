part of bottom_sheet_widget;

class _BottomSheetMobile extends StatelessWidget {
  final Widget body;

  _BottomSheetMobile({@required this.body});

  @override
  Widget build(BuildContext context) {
    Widget closeButton = Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          Icons.close,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

    return BottomSheet(
      builder: (BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: ClipRect(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? EdgeInsets.all(8.0)
                        : EdgeInsets.fromLTRB(20.0,8.0,8.0,20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[closeButton, Center(child: body)],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
