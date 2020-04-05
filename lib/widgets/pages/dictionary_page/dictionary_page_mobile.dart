part of dictionary_page_widget;

class _DictionaryPageMobile extends StatelessWidget {
  final viewModel;

  const _DictionaryPageMobile({this.viewModel});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextEditingController dictionarySerch = TextEditingController();
    Widget searchBar = RoundedTextBoxWidget(
      controller: dictionarySerch,
      isPassword: false,
      label: 'Search',
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
      icon: Icons.search,
    );

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
          Expanded(child: dictionaryDefs)
        ],
      ),
    );
  }
}
