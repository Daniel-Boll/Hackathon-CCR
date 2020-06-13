import 'package:flutter/material.dart';
import '../createAccount/createAccount.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context){
    final phoneField = TextField(
      obscureText: false,
      style: TextStyle(color: Color(0xFFbdc6cf)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "E-mail/Telefone",
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );

    final passField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "Senha",
        filled: true,
        fillColor: Colors.white,
      ),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: double.infinity,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

        onPressed: () {},

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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
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
                phoneField,
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
    );
  }
}