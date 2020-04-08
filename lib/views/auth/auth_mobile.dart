part of auth_view;

class _AuthMobile extends StatefulWidget {
  final AuthViewModel viewModel;

  _AuthMobile(this.viewModel);

  @override
  __AuthMobileState createState() => __AuthMobileState();
}

class __AuthMobileState extends State<_AuthMobile> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool _register = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget emailInput = RoundedTextBoxWidget(
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
      label: 'email',
      controller: _emailController,
      isPassword: false,
      icon: Icons.person,
    );

    Widget passwordInput = RoundedTextBoxWidget(
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
      label: 'password',
      controller: _passwordController,
      isPassword: true,
      icon: Icons.lock,
    );

    Widget nameInput = RoundedTextBoxWidget(
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
      label: 'name',
      controller: _nameController,
      isPassword: false,
      icon: Icons.text_format,
    );

    Widget submitButton = RoundedButtonWidget(
      text: 'SUBMIT',
      boarder: false,
      busy: widget.viewModel.busy,
      function: () {
        if (_register)
          widget.viewModel.signUp(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          );
        else
          widget.viewModel.logIn(
            email: _emailController.text,
            password: _passwordController.text,
          );
      },
      secondaryColor: Colors.white,
      primaryColor: Colors.blue,
    );
    void clearControllers() {
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
    }

     Widget loginSheetHeader = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: theme.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Text('Login', style: theme.textTheme.headline3),
      ],
    );

    void loginSheet() {
      clearControllers();
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          sheetTop: loginSheetHeader,
          body: Column(
            children: <Widget>[
              SizedBox(height: 60),
              emailInput,
              SizedBox(height: 20),
              passwordInput,
              SizedBox(height: 50),
              submitButton,
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    }

    Widget registerSheetHeader = Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.close, color: theme.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Text('Register', style: theme.textTheme.headline3),
      ],
    );

    void registerSheet() {
      clearControllers();
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          sheetTop: registerSheetHeader,
          body: Column(
            children: <Widget>[
              SizedBox(height: 40),
              nameInput,
              SizedBox(height: 20),
              emailInput,
              SizedBox(height: 20),
              passwordInput,
              SizedBox(height: 50),
              submitButton,
              SizedBox(height: 60),
            ],
          ),
        ),
      );
    }

    Widget loginButton = RoundedButtonWidget(
      text: 'LOGIN',
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: false,
      function: loginSheet,
    );

    Widget registerButton = RoundedButtonWidget(
      text: 'REGISTER',
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: true,
      function: registerSheet,
    );

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset : false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoWidget(),
            SizedBox(height: 80),
            loginButton,
            SizedBox(height: 15),
            registerButton,
          ],
        ),
      ),
    );
  }
}
