import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class BusinessesAngelListWidget extends StatefulWidget {
  final Map selectedBusiness;
  final String businessTarget;
  final String businessEquity;

  BusinessesAngelListWidget(this.selectedBusiness, this.businessTarget, this.businessEquity);

  @override
  _BusinessesAngelListWidgetState createState() => _BusinessesAngelListWidgetState();
}

class _BusinessesAngelListWidgetState extends State<BusinessesAngelListWidget> {
  Future businessesAngelList;

  @override
  void initState() {
    super.initState();
    businessesAngelList = getBusinessesAngels(
      widget.selectedBusiness['businessAddress'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
        future: businessesAngelList,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  SpinKitThreeBounce(
                    color: Theme.of(context).primaryColor,
                    size: 25.0,
                  ),
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  SpinKitThreeBounce(
                    color: Theme.of(context).primaryColor,
                    size: 25.0,
                  ),
                ],
              ),
            );
          }
          if (snapshot.data['result'] == false) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  right: 60.0,
                  top: 310,
                ),
                child: Text(
                  'There was a problem fetching business details, please try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }
          if (snapshot.data['result'] == true &&
              snapshot.data['list'].length == 0) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 60.0,
                  right: 60.0,
                ),
                child: Text(
                  'No angels found',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data['list'].length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width - 40,
                    height: 53,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            snapshot.data['list'][index]['username'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            getAngelsFunding(widget.selectedBusiness['businessAddress'],
                                    snapshot.data['list'][index]['eth_address'])
                                .then(
                              (data) {
                                if (data['result'] == true) {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      elevation: 20.0,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      padding: EdgeInsets.all(0),
                                      content: Container(
                                        height: 165,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  snapshot.data['list'][index]
                                                          ['username'] +
                                                      '\'s  investment',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0),
                                                  child: Text(
                                                      'VPM : ' +
                                                          data['details'] +
                                                          ' VPM',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Text(
                                                      'Equity : ' +
                                                          (int.parse(data[
                                                                      'details']) *
                                                                  100 /
                                                                  (int.parse(widget
                                                                          .businessTarget) *
                                                                      100 /
                                                                      int.parse(
                                                                          widget
                                                                              .businessEquity)))
                                                              .toStringAsFixed(
                                                                  2) +
                                                          "%",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (data['result'] == false) {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      padding: EdgeInsets.all(20),
                                      content: Text(
                                        "Please try again later",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text('Check investment'),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            minimumSize: Size(100, 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

// Get all the investors of a business

Future<dynamic> getBusinessesAngels(String businessAddress) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://192.168.203.76:8080/api/getBusinessesAngelInvestors'));
  request.body = json.encode({"business_address": businessAddress});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return await jsonDecode(await response.stream.bytesToString());
}

// Get investment done by a particular angel

Future<dynamic> getAngelsFunding(
    String businessAddress, String angelAddress) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://192.168.203.76:8080/api/getFundingDetails'));
  request.body =
      json.encode({"business_address": businessAddress, "angel_address": angelAddress});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  return await jsonDecode(await response.stream.bytesToString());
}
