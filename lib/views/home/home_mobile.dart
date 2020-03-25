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
    List<Subject> subjects = widget.viewModel.subjects;
    ThemeData theme = Theme.of(context);
    var viewModel = widget.viewModel;

    void closeMenu() {
      viewModel.menuOpen = false;
      viewModel.showTabs = viewModel.currentSubject != null ? true : false;
      Navigator.of(context).pop();
    }

    Widget spinner = Center(
      child: CircularProgressIndicator(
          strokeWidth: 3, valueColor: AlwaysStoppedAnimation(Colors.white)),
    );

    void menuOnTap(index) {
      viewModel.currentSubject = index;
      viewModel.title = subjects[index].name;
      closeMenu();
    }

    Widget menuBody = Container(
      height: 500,
      child: viewModel.busy
          ? spinner
          : ListView.builder(
              itemCount: viewModel.subjects.length,
              itemBuilder: (context, int index) {
                return SubjectMenuItemWidget(
                  subject: subjects[index],
                  onTap: () => menuOnTap(index),
                );
              },
            ),
    );

    void showMenu() {
      viewModel.menuOpen = true;
      viewModel.showTabs = false;
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          onClose: () => closeMenu(),
          primaryColor: Colors.blue,
          secondaryColor: Colors.white,
          title: 'Choose a subject',
          body: Container(child: menuBody),
        ),
      );
    }

    void menuTap() {
      viewModel.menuOpen ? closeMenu() : showMenu();
    }

    Widget menuButton = IconButton(
      icon: Icon(Icons.menu, size: 30),
      onPressed: () => menuTap(),
    );

    Widget accountButton = IconButton(
      icon: Icon(
        Icons.settings,
        size: 26,
      ),
      onPressed: () => widget.viewModel.onAccount(),
    );

    Widget refreshButton = IconButton(
      icon: Icon(
        Icons.refresh,
        size: 30,
      ),
      onPressed: () => widget.viewModel.refreshPage(),
    );

    Widget bottomTabs = TabBar(
        onTap: (index) {
          viewModel.currentTab = index;
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

    Widget _homeTab = Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text('Home', style: theme.textTheme.headline1),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Placeholder(fallbackHeight: 100, fallbackWidth: 150),
                Placeholder(fallbackHeight: 100, fallbackWidth: 150),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text('Current Questions', style: theme.textTheme.bodyText1),
            Placeholder(
              fallbackHeight: 400,
              fallbackWidth: 300,
            )
          ],
        ),
      ),
    );

    Widget _examTab = Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text('Exams', style: theme.textTheme.headline1),
          ),
        ],
      ),
    );

    Widget _dictionaryTab = Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text('Dictionary', style: theme.textTheme.headline1),
          ),
        ],
      ),
    );

    Widget _initialBody = Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Welcome back', style: theme.textTheme.headline1),
          Center(
            child: Text(
              'Select a subject from the menu',
              style: theme.textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );

    List<Widget> _pages = [_homeTab, _examTab, _dictionaryTab];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: widget.viewModel.showTabs ? bottomTabs : Wrap(),
        appBar: AppBar(
          title: Text(widget.viewModel.title),
          leading: menuButton,
          actions: <Widget>[refreshButton, accountButton],
          backgroundColor: Colors.blue,
        ),
        body: widget.viewModel.currentSubject == null
            ? _initialBody
            : _pages[widget.viewModel.currentTab],
      ),
    );
  }
}
