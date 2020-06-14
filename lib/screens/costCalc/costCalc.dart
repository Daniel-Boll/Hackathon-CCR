 import 'package:flutter/material.dart';

showAlertDialog2(BuildContext context) {

   Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {},
  );
  Widget continuaButton = FlatButton(
    child: Text("Continar"),
    onPressed:  () {},
  );

  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    content: Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          SizedBox(
            height: 150.0,
            child: Image.asset(
              "assets/images/coin.png",
              fit: BoxFit.contain,
            ),
          ),
          Divider(),
          SizedBox(height: 5),
          Text(
            'Gasto em combustível    R\$256,00',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Text(
            'Gasto em alimentação    R\$180,00',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Text(
            'Gasto em estadia             R\$214,00',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Text(
            'Gasto em pedagio            R\$220,00',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Text(
            'Desconto em Truckoins     R\$79,00',
            style: TextStyle(
              color: Colors.green,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 30),
          Text(
            'Total    R\$791,00',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        
        ],
      )
    ),
  );

  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}