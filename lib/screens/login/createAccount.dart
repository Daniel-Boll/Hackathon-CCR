import 'package:flutter/material.dart';
import 'package:hackathon_ccr/services/auth.dart';
import 'package:hackathon_ccr/shared/loading.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

// Need to be static
final _formKey = GlobalKey<FormState>();

class _CreateAccountState extends State<CreateAccount> {

  
    // Var placeholder
    String _currentName;
    String _currentPhone;
    String _currentEmail;
    String _currentPassword;
    String _currentPlaca;
    String _currentCPF;
    String _currentANTT;

    String error = '';

  @override
  Widget build(BuildContext context) {

    // Authentication Params
    final AuthService _auth = AuthService();

    bool loading = false;

    // Form widgets
    final nomeField = TextField(
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "Nome",
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) => setState(() => _currentName = val),
    );

    final phoneField = TextField(
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "Telefone",
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) => setState(() => _currentPhone = val),
    );

    final mailField = TextField(
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "E-mail",
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) => setState(() => _currentEmail = val),
    );

    final passField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        hintText: "Senha",
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) => setState(() => _currentPassword = val),
    );

    final placaField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "Placa do caminhão",
      filled: true,
      fillColor: Colors.white,
    ),
    onChanged: (val) => setState(() => _currentPlaca = val),
  );

  final cpfField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "CPF",
      filled: true,
      fillColor: Colors.white,
    ),
    onChanged: (val) => setState(() => _currentCPF = val),
  );

  final anttField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      hintText: "ANTT",
      filled: true,
      fillColor: Colors.white,
    ),
    onChanged: (val) => setState(() => _currentANTT = val),
  );

    return SafeArea(
        child: loading ? Loading() : Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 20.0),
            child: SingleChildScrollView(
              child:Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 120.0,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height:20.0),
                    nomeField,
                    SizedBox(height: 10.0),
                    phoneField,
                    SizedBox(height: 10.0),
                    mailField,
                    SizedBox(height: 10.0),
                    passField,
                    SizedBox(height: 10.0),
                    placaField,
                    SizedBox(height: 10.0),
                    cpfField,
                    SizedBox(height: 10.0),
                    anttField,
                    SizedBox(height: 4.0),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red[700],
                        fontSize: 18
                      )
                    ),
                    SizedBox(height: 20.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.red[700],
                      child: MaterialButton(
                        height: 14.0,
                        minWidth: double.infinity,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() => loading = true);

                            dynamic result = await _auth.registerWithEmailAndPassword(
                              _currentEmail, _currentPassword,
                              _currentName, _currentPhone,
                              _currentPlaca, _currentCPF, _currentANTT
                            );
                            
                            if(result == null){
                              setState(() {
                                loading = true;
                                error = 'Por favor, informe um e-mail válido';
                              });
                            }
                        }
                      },

                        child: Text(
                            "Cadastrar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                        ),
                      )
                    ),
                    SizedBox(height: 20.0)
                  ]
                ),
              )
            )
          )
        )
      ),
    );
  }
}
