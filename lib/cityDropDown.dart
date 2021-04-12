import 'package:flutter/material.dart';
import 'package:weather/models/forcast.dart';
import 'package:weather/models/location.dart';
import 'package:weather/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'extensions.dart';
import 'package:intl/intl.dart';

class CityDropDown extends StatefulWidget {
  final List<Location> locations;
  const CityDropDown(this.locations);

  @override
  _CityDropDownState createState() =>
      _CityDropDownState(this.locations);
}

class _CityDropDownState extends State<CityDropDown> {
  final List<Location> locations;
  final Location location;
  _CityDropDownState(List<Location> locations)
      : this.locations = locations,
        this.location = locations[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: createAppBar(this.locations, this.location, context)
            
        );
  }


Widget createAppBar(
    List<Location> locations, Location location, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
                child: Column(children: [
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Tap to change location',
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: locations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                
                              });
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  child: Center(
                                    child: Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${locations[index].city.capitalizeFirstOfEach}, ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          TextSpan(
                                              text:
                                                  '${locations[index].country.capitalizeFirstOfEach}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            ));
                      })),
            ]));
          },
        );
      },
      child: Container(
          padding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
          margin: const EdgeInsets.only(
              top: 35, left: 15.0, bottom: 15.0, right: 15.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(60)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                )
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '${location.city.capitalizeFirstOfEach}, ',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    TextSpan(
                        text: '${location.country.capitalizeFirstOfEach}',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16)),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Tap to change location',
              ),
            ],
          )),
    );
  }
}