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

    void menuOnTap(index) {
      viewModel.currentSubject = index;
      viewModel.title = subjects[index].name;
      closeMenu();
    }

    Widget menuBody = Container(
      height: 500,
      child: viewModel.busy
          ? SpinnerWidget()
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
        labelPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        indicatorPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(icon: Icon(Icons.home, size: 30)),
          Tab(icon: Icon(Icons.import_contacts, size: 27)),
          Tab(icon: Icon(Icons.group, size: 27)),
          Tab(icon: Icon(Icons.font_download, size: 27)),
          Tab(icon: Icon(Icons.forum, size: 27))
        ]);

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

    List<Widget> _pages = [
      HomePageWidget(viewModel: viewModel),
      ExamPageWidget(viewModel: viewModel),
      UsersPageWidget(viewModel: viewModel),
      DictionaryPageWidget(viewModel: viewModel),
      FeedbackPageWidget(viewModel: viewModel),
    ];

    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: widget.viewModel.showTabs ? bottomTabs : Wrap(),
        appBar: AppBar(
          title: Text(widget.viewModel.title, style: theme.textTheme.headline2),
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
