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
      widget.viewModel.showTabs = true;
      Navigator.of(context).pop();
    }

    void showMenu() {
            widget.viewModel.menuOpen = true;
      widget.viewModel.showTabs = false;
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          onClose: () => closeMenu(),
          primaryColor: Colors.blue,
          secondaryColor: Colors.white,
          title: 'Choose a subject',
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

    Widget bottomTabs = TabBar(
        onTap: (index) {
          widget.viewModel.currentTab = index;
        },
        labelColor: Colors.blue,
        labelPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        indicatorPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.import_contacts)),
          Tab(icon: Icon(Icons.font_download)),
        ]);

    Widget _homeTab = Center(
      child: Text('home| lecture| feedback'),
    );

    Widget _examTab = Center(
      child: Text('exams'),
    );

    Widget _dictionaryTab = Center(
      child: Text('dictionary'),
    );

    Widget _initialBody = Center(
      child: Text('Welcome back'),
    );

    List<Widget> pages = [_homeTab, _examTab, _dictionaryTab];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: widget.viewModel.showTabs ? bottomTabs : Wrap(),
        appBar: AppBar(
          title: Text(widget.viewModel.title),
          leading: menuButton,
          actions: <Widget>[accountButton],
          backgroundColor: Colors.blue,
        ),
        body: widget.viewModel.subject == null
            ? _initialBody
            : pages[widget.viewModel.currentTab],
      ),
    );
  }
}
