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
    void closeMenu() {
      widget.viewModel.menuOpen = false;
      Navigator.of(context).pop();
    }

    void showMenu() {
      widget.viewModel.title = 'menu';
      widget.viewModel.menuOpen = true;
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          onClose: () => closeMenu(),
          primaryColor: Colors.blue,
          secondaryColor: Colors.white,
          body: Column(
            children: <Widget>[
              Center(child: Text('Menu')),
              SizedBox(height: 100)
            ],
          ),
        ),
      );
    }

    void menuTap() {
      widget.viewModel.menuOpen ? closeMenu() : showMenu();
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
      backgroundColor: Colors.white,
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
