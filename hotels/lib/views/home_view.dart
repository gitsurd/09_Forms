import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;

import '../helper.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);
  static const routname = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _viewsAsList = true;
  bool _isLoading = false;
  bool _isError = true;
  String _errorMessage = '';
  List<HotelPreview> hotels;

  @override
  void initState() {
    // TODO: implement initState
    // _viewsAsList = true;
    // _isLoading = false;
    // _isError = true;
    // _errorMessage = '';

    super.initState();

    gatDate();
  }

  gatDate() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final resp = await http
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

      if (resp.statusCode == 200) {
        final data = json.decode(resp.body);

        hotels =
            data.map<HotelPreview>((h) => HotelPreview.fromJson(h)).toList();
        print(hotels);
        //HotelPreview
        setState(() {
          _isError = false;
        });
      } else {
        setState(() {
          _errorMessage = resp.body.toString();
        });

        showAlertDialog(context, _errorMessage, _myOk);
      }

      print(resp.body);
    } catch (e) {
      print(e);
      _errorMessage = e.toString();
      showAlertDialog(context, _errorMessage, _myOk);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _myOk() async {
    print('MyOK');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                setState(() {
                  _viewsAsList = true;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.table_rows,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                setState(() {
                  _viewsAsList = false;
                });
              },
            )
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _isError
                ? Center(
                    child: Text(_errorMessage,
                        style: TextStyle(fontSize: 20, color: Colors.red)))
                : _viewsAsList
                    ? ListView(
                        children: <Widget>[
                          ...hotels.map((hotel) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.white70,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    //width: double.infinity,
                                    // decoration: BoxDecoration(
                                    //   image: DecorationImage(
                                    //     image: AssetImage(
                                    //         "assets/images/" + hotel.poster),
                                    //     fit: BoxFit.fill,
                                    //     //alignment: Alignment.topCenter,
                                    //   ),
                                    // ),
                                    decoration: ShapeDecoration(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight: const Radius.circular(10.0),
                                        ),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/" + hotel.poster),
                                        fit: BoxFit.fill,
                                        //alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(hotel.name,
                                            style: TextStyle(fontSize: 16)),
                                      )),
                                      Spacer(),
                                      Container(
                                        //alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RaisedButton(
                                            color: Colors.blue[400],
                                            onPressed: () {
                                              print("Button Pressed");
                                              var _resurl =
                                                  '/Detal/${hotel.name}/${hotel.uuid}';
                                              Navigator.of(context)
                                                  .pushNamed(_resurl);
                                            },
                                            child: Text(
                                              "Подробнее",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        children: <Widget>[
                          ...hotels.map((hotel) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    height: 100,
                                    //width: double.infinity,
                                    decoration: ShapeDecoration(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight: const Radius.circular(10.0),
                                        ),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/" + hotel.poster),
                                        fit: BoxFit.fill,
                                        //alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        hotel.name,
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: const Radius.circular(10.0),
                                        bottomRight:
                                            const Radius.circular(10.0),
                                      ),
                                    ),
                                    color: Colors.blue[400],
                                    onPressed: () {
                                      print("Button Pressed");
                                      var _resurl =
                                          '/Detal/${hotel.name}/${hotel.uuid}';
                                      Navigator.of(context).pushNamed(_resurl);
                                    },
                                    child: Text(
                                      "Подробнее",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ));
  }
}
