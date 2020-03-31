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
  TextEditingController dictionarySerch = TextEditingController();

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
          Tab(icon: Icon(Icons.font_download, size: 27)),
        ]);

    Widget usersButton = RoundedButtonWidget(
      text: 'Users',
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: false,
      function: () {},
    );

    Widget feedbackButton = RoundedButtonWidget(
      text: 'Feedback',
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: false,
      function: () {},
    );

    Widget currentQuestions = viewModel.currentSubject == null
        ? Center(child: Text('no subject selected'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.currentQuestions.length,
            itemBuilder: (context, int index) {
              return Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Text(
                    '${viewModel.currentSubject.currentQuestions[index].question}',
                    style: theme.textTheme.bodyText1.copyWith(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            });

    Widget searchBar = RoundedTextBoxWidget(
      controller: dictionarySerch,
      isPassword: false,
      label: 'Search',
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
      icon: Icons.search,
    );

    Widget dictionaryDefs = viewModel.currentSubject == null
        ? Center(child: Text('no subject selected'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.dictionary.length,
            itemBuilder: (context, int index) {
              return DefinitionCardWidget(
                  definition: viewModel.currentSubject.dictionary[index],
                  onTap: () {});
            });

    Widget _homePage = BasePageWidget(
        pageName: 'Home',
        content: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[usersButton, feedbackButton],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Current Questions',
                style: theme.textTheme.headline3,
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: currentQuestions),
          ],
        ));

    Widget _examPage =
        BasePageWidget(pageName: 'Exams', content: Text('hello'));

    Widget _dictionaryPage = BasePageWidget(
      pageName: 'Dictionary',
      content: Column(
        children: <Widget>[
          SizedBox(height: 20),
          searchBar,
          SizedBox(height: 20),
          Expanded(child: dictionaryDefs)
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

    List<Widget> _pages = [_homePage, _examPage, _dictionaryPage];
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
