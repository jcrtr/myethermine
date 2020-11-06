import 'package:flutter/material.dart';
import 'cart_style.dart';


class MinerWidget extends StatelessWidget {

  final double currentHashrate;
  final double averageHashrate;
  final int reportedHashrate;

  @required
  const MinerWidget({
    Key key,
    this.currentHashrate,
    this.averageHashrate,
    this.reportedHashrate,
  }) : super(key: key);


  Widget _minerItems({String name, double hash}) {
    var h = hash / 1000000;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          h.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text('MH/s',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _minerItem({String name, int hash}) {
    var h = hash / 1000000;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          h.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text('MH/s',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                blurRadius: 15.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _minerItems(name: 'Current', hash: currentHashrate)),
                Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _minerItems(name: 'Average', hash: averageHashrate)),
                Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _minerItem(name: 'Reported', hash: reportedHashrate)),
              ],
            ),
          ),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}
