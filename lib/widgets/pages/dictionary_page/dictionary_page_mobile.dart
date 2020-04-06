part of dictionary_page_widget;

class _DictionaryPageMobile extends StatelessWidget {
  final viewModel;
  final scaffoldKey;

  const _DictionaryPageMobile({this.viewModel, @required this.scaffoldKey});

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

      scaffoldKey.currentState.showBottomSheet(
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

    Widget dictionaryDefs = viewModel.currentSubject == null ||
            viewModel.currentSubject.dictionary.length == 0
        ? Center(child: Text('no definitions available'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.dictionary.length,
            itemBuilder: (context, int index) {
              return DefinitionCardWidget(
                definition: viewModel.currentSubject.dictionary[index],
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
          searchBar,
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Definitions', style: theme.textTheme.headline3),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.blue),
                onPressed: () => addDefinitionPanel(),
              )
            ],
          ),
          Expanded(child: dictionaryDefs)
        ],
      ),
    );
  }
}
