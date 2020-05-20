part of dictionary_page_widget;

class _DictionaryPageMobile extends StatelessWidget {
  final viewModel;

  const _DictionaryPageMobile({this.viewModel});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextEditingController dictionarySerch = TextEditingController();
    TextEditingController phraseController = TextEditingController();
    TextEditingController definitionController = TextEditingController();

    Widget searchBar = RoundedTextBoxWidget(
      controller: dictionarySerch,
      isPassword: false,
      label: 'Search',
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
      icon: Icons.search,
    );

    Widget searchButton = RoundedButtonWidget(
      text: 'Filter',
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: false,
      function: () => viewModel.dictionaryFilter = dictionarySerch.text,
    );

    Widget addDefinitionBody = Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          RoundedTextBoxWidget(
            controller: phraseController,
            isPassword: false,
            label: 'Phrase',
            icon: Icons.textsms,
            primaryColor: Colors.white,
            secondaryColor: Colors.blue,
            boarder: true,
          ),
          SizedBox(height: 20),
          RoundedTextBoxWidget(
            controller: definitionController,
            isPassword: false,
            label: 'Definition',
            primaryColor: Colors.white,
            secondaryColor: Colors.blue,
            icon: Icons.text_fields,
            boarder: true,
          ),
          SizedBox(height: 20),
          RoundedButtonWidget(
              text: 'Submit',
              primaryColor: Colors.blue,
              secondaryColor: Colors.white,
              boarder: true,
              function: () {
                viewModel.addDefinition(
                  phrase: phraseController.text,
                  definition: definitionController.text,
                );
                viewModel.menuOpen = false;
                definitionController.clear();
                phraseController.clear();
                Navigator.of(context).pop();
                viewModel.showTabs = true;
              }),
          SizedBox(height: 20),
        ],
      ),
    );

    void addDefinitionPanel() {
      viewModel.menuOpen = true;
      viewModel.showTabs = false;

      Scaffold.of(context).showBottomSheet(
        (context) => BottomSheetWidget(
          primaryColor: Colors.blue,
          secondaryColor: Colors.white,
          sheetTop: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () {
                  viewModel.menuOpen = false;
                  definitionController.clear();
                  phraseController.clear();
                  Navigator.of(context).pop();
                  viewModel.showTabs = true;
                },
              ),
              Text(
                'Add Definition',
                style: theme.textTheme.headline2,
              ),
            ],
          ),
          body: Container(child: addDefinitionBody),
        ),
      );
    }

    Widget dictionaryDefs =
        viewModel.dictionary == null || viewModel.dictionary.length == 0
            ? Center(child: Text('no definitions available'))
            : ListView.builder(
                itemCount: viewModel.dictionary.length,
                itemBuilder: (context, int index) {
                  return DefinitionCardWidget(
                    definition: viewModel.dictionary[index],
                    hasMenu: viewModel.currentSubject.isAdmin,
                    onMenuTap: (value) => viewModel.editResources(value, index),
                    menuItems: [
                      PopupMenuItem<String>(
                        value: 'DELETE_DEFINITION',
                        child: Text(
                          'delete',
                          style: theme.textTheme.bodyText2,
                        ),
                      ),
                    ],
                  );
                });

    return BasePageWidget(
      pageName: 'Dictionary',
      content: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(child: searchBar),
              SizedBox(width: 10),
              searchButton
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Definitions', style: theme.textTheme.headline3),
              viewModel.currentSubject.isAdmin
                  ? IconButton(
                      icon: Icon(Icons.add, color: Colors.blue),
                      onPressed: () => addDefinitionPanel(),
                    )
                  : Container(),
            ],
          ),
          Expanded(child: dictionaryDefs)
        ],
      ),
    );
  }
}
