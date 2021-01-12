import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;

import '../helper.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetalView extends StatefulWidget {
  DetalView({Key key, this.uuid, this.name}) : super(key: key);

  static const routname = '/Detal';

  final String uuid;
  final String name;
  @override
  _DetalViewState createState() => _DetalViewState();
}

class _DetalViewState extends State<DetalView> {
  bool _isLoading = false;
  bool _isError = true;
  String _errorMessage = '';
  HotelDetal hoteldetal;
  String _frees = "";
  String _paids = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gatDate();
  }

  gatDate() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final resp = await http.get('https://run.mocky.io/v3/${widget.uuid}');

      if (resp.statusCode == 200) {
        final data = json.decode(resp.body);

        hoteldetal = HotelDetal.fromJson(data);

        for (var item in hoteldetal.services['free']) {
          _frees += (item.toString() + '\n');
        }

        for (var item in hoteldetal.services['paid']) {
          _paids += (item.toString() + '\n');
        }

        setState(() {
          _isError = false;
        });
      } else {
        setState(() {
          var d = json.decode(resp.body);
          _errorMessage = d['message'].toString();
        });

        showAlertDialog(context, _errorMessage, () async {
          print("Ok process");
        });
      }

      print(resp.body);
    } catch (e) {
      print(e);
      _errorMessage = e.toString();
      showAlertDialog(context, _errorMessage, () async {
        print("Ok process");
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isError ? Text('') : Text('${widget.name}'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _isError
              ? Center(
                  child: Text(_errorMessage,
                      style: TextStyle(fontSize: 20, color: Colors.red)))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: CarouselSlider.builder(
                        itemCount: hoteldetal.photos.length,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            child: Center(
                                child: Image.asset(
                              'assets/images/${hoteldetal.photos[index]}',
                              fit: BoxFit.fill,
                              width: 400,
                            )),
                          );
                        },
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Страна: ${hoteldetal.address.country}',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Город: ${hoteldetal.address.city}',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Улица: ${hoteldetal.address.street}',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Рейтинг: ${hoteldetal.rating}',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Сервиси',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Платные',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  child: AutoSizeText(
                                    _paids,
                                    style: TextStyle(fontSize: 14.0),
                                    maxLines: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'Бесплатно',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  height: 200,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  child: AutoSizeText(
                                    _frees,
                                    style: TextStyle(fontSize: 14.0),
                                    maxLines: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
