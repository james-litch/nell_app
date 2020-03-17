part of auth_view;

class _AuthMobile extends StatefulWidget {
  final AuthViewModel viewModel;

  _AuthMobile(this.viewModel);

  @override
  __AuthMobileState createState() => __AuthMobileState();
}

class __AuthMobileState extends State<_AuthMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  bool _register = false;

  @override
  Widget build(BuildContext context) {
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

    void loginSheet() {
      clearControllers();
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          body: Column(
            children: <Widget>[
              SizedBox(height: 50),
              emailInput,
              SizedBox(height: 15),
              passwordInput,
              SizedBox(height: 30),
              submitButton
            ],
          ),
        ),
      );
    }

    void registerSheet() {
      clearControllers();
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheetWidget(
          body: Column(
            children: <Widget>[
              SizedBox(height: 50),
              nameInput,
              SizedBox(height: 15),
              emailInput,
              SizedBox(height: 15),
              passwordInput,
              SizedBox(height: 30),
              submitButton
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
