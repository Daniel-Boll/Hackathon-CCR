import 'package:flutter/material.dart';
import 'package:hackathon_ccr/shared/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  double _rating = 3.5;
  String _generalDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pinimg.com/564x/b0/69/42/b06942586d6a03d7147a64f05629badf.jpg'),
                radius: 80,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Posto do Zé ($_rating)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
            Divider(height: 30,color: Colors.white),
            SmoothStarRating(
              rating: _rating,
              isReadOnly: false,
              size: 40,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              spacing: 2.0,
              color: Colors.yellow,
              borderColor: Colors.yellow,
              onRated: (value) {
                // print("rating value -> $value");
                // print("rating value dd -> ${value.truncate()}");
              },
            ),
            SizedBox(height: 30),
            TextField(
              decoration: textInputDecoration.copyWith(hintText: 'Descreva sua experiência.'),
              onChanged: (val) => setState(() => _generalDesc = val),
            ),
            SizedBox(height: 15),
            Container(
              height: 200,
              child: PageView(
                controller: PageController(viewportFraction: .8),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green[700],
                      ),
                      title: Text("Blá blá blá"),
                      subtitle: Text('blá blá blá'),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green[700],
                      ),
                      title: Text("Blá blá blá"),
                      subtitle: Text('blá blá blá'),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green[700],
                      ),
                      title: Text("Blá blá blá"),
                      subtitle: Text('blá blá blá'),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}