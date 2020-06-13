import 'package:flutter/material.dart';
import 'package:hackathon_ccr/services/auth.dart';
import 'package:hackathon_ccr/shared/constants.dart';
import '../viewRoute/viewRoute.dart';

class RoutesPage extends StatefulWidget {
  @override
  _RoutesPageState createState() => _RoutesPageState();
}

final _formKey = GlobalKey<FormState>();

// Form values
String _origin;
String _destiny;
bool on_route = false;

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    return !on_route? Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 200,
            ),
            Divider(height: 40,color: Colors.white),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Origem',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                    )
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Coloque aqui o ponto de partida.'),
                    validator: (val) => val.isEmpty ? 'Por favor, informe um valor de origem' : null,
                    onChanged: (val) => setState(() => _origin = val),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Destino',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                    )
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Coloque aqui o ponto de chegada.'),
                    validator: (val) => val.isEmpty ? 'Por favor, informe um valor de destino' : null,
                    onChanged: (val) => setState(() => _destiny = val),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      color: Colors.red[700],
                      child: Text(
                        'Calcular Rota',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          print(_origin);
                          print(_destiny);
                          setState(() {
                            on_route = true;
                          });
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ) : 
    ViewRoute();
  }
}