import 'package:flutter/material.dart';

class MinerWidget extends StatelessWidget {

  final int currentHashrate;
  final int reportedHashrate;

  @required
  const MinerWidget({
    Key key,
    this.currentHashrate,
    this.reportedHashrate
  }) : super(key: key);


  Widget _minerItem({String name, int hash}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '$hash',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Hashrate',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _minerItem(name: 'Current', hash: currentHashrate)),
                Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _minerItem(name: 'Reported', hash: reportedHashrate)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
