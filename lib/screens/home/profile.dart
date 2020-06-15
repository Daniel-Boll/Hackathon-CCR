import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_ccr/models/info.dart';
import 'package:hackathon_ccr/models/user.dart';
import 'package:hackathon_ccr/screens/home/modal.dart';
import 'package:hackathon_ccr/services/auth.dart';
import 'package:hackathon_ccr/services/database.dart';
import 'package:hackathon_ccr/shared/loading.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    bool _password = false;

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;

        return Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pinimg.com/564x/bc/f2/e0/bcf2e09c51f24a9cbf4bce267e4070ee.jpg'),
                    radius: 70,
                  ),
                ),
                Divider(
                  height: 50,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'NOME',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                      )
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.local_shipping,
                            color: Colors.white,
                            size: 40, 
                          ),
                          Text(
                            '0\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ] 
                      )
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 20,
                  endIndent: 285,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                Text(
                    userData.name,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 30),
                Text(
                    'ANTT',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                    )
                ),
                Divider(
                  color: Colors.white,
                  height: 20,
                  endIndent: 285,
                ),
                SizedBox(height: 10),
                Text(
                    userData.antt,
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(height: 30),
                Text(
                    'SENHA',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2,
                    )
                ),
                Divider(
                  color: Colors.white,
                  height: 20,
                  endIndent: 285,
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text(
                        _password ? (userData.password) : '*'*(userData.password).length,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    IconButton(
                      icon: _password ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                      tooltip: _password ? 'Ocultar a senha' : 'Mostrar a senha',
                      color: Colors.white,
                      onPressed: (){
                        _password = !_password;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                RaisedButton.icon(
                  icon: Icon(Icons.exit_to_app, color: Colors.white,),
                  color: Colors.red[700],
                  label: Text(
                    'Sair',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                  }
                ),
              ],
            ),
          ),
        );
        }else{
          return Loading();
        }
      }
    );
  }
}