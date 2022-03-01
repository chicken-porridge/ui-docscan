import 'package:docscan/pages/home.dart';
import 'package:docscan/services/auth.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class LoginPage extends StatelessWidget {
  final AuthBloc authBloc;

    const LoginPage({Key key, this.authBloc}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc get _authBloc => widget.authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: LoginForm(
        authBloc: _authBloc,
      ),
    );
  }
}


class LoginForm extends StatelessWidget {
  final AuthBloc authBloc;

  LoginForm({Key key, this.authBloc}) : super(key: key);

  final TextEditingController emailController =
      TextEditingController(text: "akughoni@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "asdasdasd");

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.all(20),
            child: SafeArea(
                child: Form(
                  key: _formKey,
                  child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/document_logo.png",
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                      ),
                      Text(
                        "Scanner App",
                        style: text,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                  ),
                  Text(
                    "Login",
                    style: title,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: TextFormField(
                      cursorColor: Color(0x1a34395E),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        iconColor: purple,
                        hintText: 'email',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: TextFormField(
                      cursorColor: Color(0x1a34395E),
                      controller: passwordController,
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.key),
                        iconColor: purple,
                        hintText: 'password',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Dont have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "myRoute");
                          },
                          child: Text(" Create One",
                              style: TextStyle(
                                color: purple,
                                fontSize: 16,
                              )))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 50,
                    width: 500,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6777EF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      // onPressed: () {},
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => HomePage()),
                      //   );
                      // },
                      onPressed: _login,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ])) )));
  }
    void _login() {
    authBloc.add(LoginProcess(
      email: emailController.text,
      password: passwordController.text,
    ));
  }
}}
