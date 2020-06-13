import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
              height: 90,
              color: Colors.white,
            ),
            Text(
              'NOME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              )
            ),
            Divider(
              color: Colors.white,
              height: 20,
              endIndent: 285,
              thickness: 1,
            ),
            SizedBox(height: 10),
            Text(
                'Trucão',
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
                '120939021381',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 30),
            Text(
                'PASSWORD',
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
                '*************',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
            ),
          ],
        ),
      ),
    );
  }
}