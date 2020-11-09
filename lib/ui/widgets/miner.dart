import 'package:flutter/material.dart';
import 'style/cart_style.dart';

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
                    child: _MinerItem(name: 'Current', hash: currentHashrate)),
                Container(
                    height: 40,
                    child: VerticalDivider(
                        thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _MinerItem(name: 'Average', hash: averageHashrate)),
                Container(
                    height: 40,
                    child: VerticalDivider(
                        thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child:
                    _MinerItemsReported(name: 'Reported', hash: reportedHashrate)),
              ],
            ),
          ),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}

class _MinerItem extends StatelessWidget {
  final String name;
  final double hash;

  const _MinerItem({Key key, this.name, this.hash}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Text(
          'MH/s',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _MinerItemsReported extends StatelessWidget {
  final String name;
  final int hash;

  const _MinerItemsReported({Key key, this.name, this.hash}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Text(
          'MH/s',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
