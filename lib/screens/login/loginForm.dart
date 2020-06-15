import 'package:flutter/material.dart';
import 'package:hackathon_ccr/screens/login/createAccount.dart';
import 'package:hackathon_ccr/services/auth.dart';
import 'package:hackathon_ccr/shared/loading.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  // Authentication variables needed
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // Text field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context){
    final emailField = TextField(
      obscureText: false,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "E-mail",
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) => setState(() => email = val),
    );

    final passField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "Senha",
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) => setState(() => password = val),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: double.infinity,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        onPressed: () async {
          if(_formKey.currentState.validate()){
            setState(() => loading = true);
            
            print(email);
            print(password);  

            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
            if(result == null) {
              setState(() {
                error = 'Could not sign in with those credential!';
                loading = false;
              });
            }
          }
        },

        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final createAccountBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        height: 14.0,
        minWidth: double.infinity,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAccount()),
          );
        },

        child: Text("Criar conta",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 10.0),
                    passField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    createAccountBtn
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}