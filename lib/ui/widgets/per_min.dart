import 'package:flutter/material.dart';

import 'cart_style.dart';

class PerMinWidget extends StatelessWidget {
  final double coinsPerMin;
  final double usdPerMin;
  final double btcPerMin;

  @required
  const PerMinWidget(
      {Key key, this.coinsPerMin, this.usdPerMin, this.btcPerMin})
      : super(key: key);

  Widget _item({String title, double data, int num}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              data.toStringAsFixed(num),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _petminItem({String name, double permin, int num}) {
    var h = permin * 60;
    var d = permin * 1440;
    var m = d * 30;
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
        _item(title: 'hour', data: h, num: num),
        Divider(),
        _item(title: 'day', data: d, num: num),
        Divider(),
        _item(title: 'month', data: m, num: num),
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
                    child: _petminItem(name: 'ETH', permin: coinsPerMin, num: 5)),
                Container(
                    height: 110,
                    child: VerticalDivider(
                        thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _petminItem(name: 'USD', permin: usdPerMin, num: 2)),
              ],
            ),
          ),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}
