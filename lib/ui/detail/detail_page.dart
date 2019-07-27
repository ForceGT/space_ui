import 'package:flutter/material.dart';
import 'package:space_ui/model/planets.dart';
import 'package:space_ui/ui/common/planet_summary.dart' as planetsummary;
import 'package:space_ui/ui/common/seperator.dart';
import 'package:space_ui/ui/text_style.dart';
import 'package:flutter/foundation.dart';

class DetailPage extends StatelessWidget {

  final Planet planet;

  DetailPage(this.planet);



 // final PlanetSummary planetSummary;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground () {
    return new Container(
      child: new Image.network(planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }


  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    final bool horizontal = false;
    var obj = new planetsummary.PlanetSummary(this.planet);
    debugPrint("==============Detail Page======================");
   // debugPrint("Planet =" + planet.toString());
    debugPrint("Horizontal =" + obj.horizontal.toString());
    debugPrint("====================================");
    return new Container(

      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),

        children: <Widget>[
          new planetsummary.PlanetSummary(planet,horizontal : horizontal),

          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle,
                  style: Style.headerTextStyle,),
                new Separator(),
                new Text(
                    planet.description, style: Style.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top),
      child: new BackButton(color: Colors.white),
    );
  }
}