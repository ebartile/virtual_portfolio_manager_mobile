import 'package:flutter/material.dart';

class MoreBusinessDataWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;

  MoreBusinessDataWidget(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Business owner',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    snapshot.data["details"]["owner"],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              height: 35,
              margin: EdgeInsets.only(
                top: 5,
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Created on ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    snapshot.data["details"]["createdOn"].split(',')[0],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 35,
              margin: EdgeInsets.only(
                top: 5,
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Business status',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    snapshot.data["details"]["targetReachedDB"]
                        ? 'Target reached'
                        : 'Raising funding',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
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
