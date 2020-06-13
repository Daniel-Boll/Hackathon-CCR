import 'package:flutter/material.dart';


class CreateAccount extends StatelessWidget {
  final nameField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "Nome",
      filled: true,
      fillColor: Colors.white,
    ),
  );

  final phoneField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "Telefone",
      filled: true,
      fillColor: Colors.white,
    ),
  );

  final mailField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "E-mail",
      filled: true,
      fillColor: Colors.white,
    ),
  );

  final placaField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "Placa do caminhão",
      filled: true,
      fillColor: Colors.white,
    ),
  );

  final cpfField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "Cpf",
      filled: true,
      fillColor: Colors.white,
    ),
  );

  final anttField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "ANTT",
      filled: true,
      fillColor: Colors.white,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                nameField,
                SizedBox(height: 45.0),
                phoneField,
                SizedBox(height: 45.0),
                mailField,
                SizedBox(height: 45.0),
                placaField,
                SizedBox(height: 45.0),
                cpfField,
                SizedBox(height: 45.0),anttField,
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xff01A0C7),
                  child: MaterialButton(
                    height: 14.0,
                    minWidth: double.infinity,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                    onPressed: () {},

                    child: Text("Cadastrar",
                        textAlign: TextAlign.center,
                  ),
                );

              
              
              
              ]
          ),
        )
      ,),
    );
  }
}

