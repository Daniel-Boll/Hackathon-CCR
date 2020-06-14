import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackathon_ccr/models/facility.dart';
import 'package:hackathon_ccr/services/auth.dart';
import 'package:hackathon_ccr/services/databaseFacility.dart';
import 'package:hackathon_ccr/shared/constants.dart';
import '../viewRoute/viewRoute.dart';
import 'package:flutter_map/flutter_map.dart';
export 'package:flutter_map/src/geo/latlng_bounds.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/geo/crs/crs.dart';
import 'package:flutter_map/src/map/flutter_map_state.dart';
import 'package:flutter_map/src/map/map.dart';
import 'package:flutter_map/src/plugins/plugin.dart';
import 'package:latlong/latlong.dart';

export 'package:flutter_map/src/core/point.dart';
export 'package:flutter_map/src/geo/crs/crs.dart';
export 'package:flutter_map/src/geo/latlng_bounds.dart';
export 'package:flutter_map/src/layer/circle_layer.dart';
export 'package:flutter_map/src/layer/group_layer.dart';
export 'package:flutter_map/src/layer/layer.dart';
export 'package:flutter_map/src/layer/marker_layer.dart';
export 'package:flutter_map/src/layer/overlay_image_layer.dart';
export 'package:flutter_map/src/layer/polygon_layer.dart';
export 'package:flutter_map/src/layer/polyline_layer.dart';
export 'package:flutter_map/src/layer/tile_layer.dart';
export 'package:flutter_map/src/layer/tile_provider/tile_provider.dart';
export 'package:flutter_map/src/layer/tile_provider/mbtiles_image_provider.dart';
export 'package:flutter_map/src/plugins/plugin.dart';

class RoutesPage extends StatefulWidget {
  @override
  _RoutesPageState createState() => _RoutesPageState();
}

final _formKey = GlobalKey<FormState>();

// Form values
String _origin;
String _destiny;
bool on_route = false;

 LatLng OrigemCo = LatLng(-25.431015, -49.270167);
 LatLng DestinoCo = LatLng(-12.979161, -38.500039);

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;


class _RoutesPageState extends State<RoutesPage> {
  
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final LatLng _center =  LatLng(45.521563, -122.677433);  
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  String googleAPIKey = "AIzaSyCQRBtJcnzbHPJNP-zZXqrzW3RG9oI679E";


  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return !on_route ? Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          children: <Widget>[
            
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
                  SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      color: Colors.red[700],
                      child: Text(
                        'Popular Banco',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        double rate = 3.0;

                        var allThreeRate = {
                          'bathroomRate': rate,  
                          'courtyardRate': rate,
                          'securityRate': rate,
                          'dieselRate': rate,
                          'treatmentRate': rate
                        };

                        var review = { 
                          'reviewerName': 'Nome',
                          'reviewerRate': 3,
                          'reviewerDescription': 'Muito podre',
                          'reviewerSpecificRate': allThreeRate
                        }; 

                        String rand = new Random().nextInt((10000000)+100000).toString();
                        DatabaseFacilityService(uid: rand);

                        dynamic result = await DatabaseFacilityService(uid: rand).updateFacilityData('lat', 'lng', 'name', 3, allThreeRate, review);

                        if(result != null){
                          print(result.uid);
                          DatabaseFacilityService(uid: result.uid);
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
    ) 
    : 
    Stack(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height-110,
          child: FlutterMap(
            options: new MapOptions(
              center: new LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']
              ),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(51.5, -0.09),
                    builder: (ctx) =>
                    new Container(
                      child: new FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
    
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 60.0,
          color: Colors.white,
          child: Center( 
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 25.0),
                FlatButton(
                  child: Text("445km"),
                  onPressed: () => {
                    print("ajdgjawkdhawkld")
                  },
                ),
                VerticalDivider(),
                FlatButton(
                  child: Text("R\$ 256,00"),
                  onPressed: () => {
                    print("ajdgjawkdhawkld")
                  },
                ),
                VerticalDivider(),
                FlatButton(
                  child: Text("3 Paradas"),
                  onPressed: () => {
                    Scaffold.of(context).openDrawer()
                  },
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}