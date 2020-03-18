part of home_view;

class _HomeMobile extends StatefulWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  __HomeMobileState createState() => __HomeMobileState();
}

class __HomeMobileState extends State<_HomeMobile> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController menuController;
  @override
  Widget build(BuildContext context) {
    void showMenu() {
      widget.viewModel.title = 'menu';
      menuController = _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          primaryColor: Colors.blue,
          secondaryColor: Colors.white,
          body: Center(
            child: Text(
              'Menu',
            ),
          ),
        ),
      );
    }

    void closeMenu() {
      if (menuController != null) {
        menuController.close();
        menuController = null;
      }
    }

    void menuTap() {
      menuController == null ? showMenu() : closeMenu();
    }

    Widget menuButton = IconButton(
      icon: Icon(Icons.menu, size: 30),
      onPressed: () => menuTap(),
    );

    Widget accountButton = IconButton(
      icon: Icon(Icons.settings),
      onPressed: () => widget.viewModel.onAccount(),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.viewModel.title),
        leading: menuButton,
        actions: <Widget>[accountButton],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
