part of dictionary_page_widget;

class _DictionaryPageMobile extends StatelessWidget {
  final viewModel;

  const _DictionaryPageMobile({this.viewModel});

  @override
  Widget build(BuildContext context) {
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

    Widget dictionaryDefs = viewModel.currentSubject == null
        ? Center(child: Text('no subject selected'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.dictionary.length,
            itemBuilder: (context, int index) {
              return DefinitionCardWidget(
                definition: viewModel.currentSubject.dictionary[index],
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
