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

  Widget _itemDate({String title}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _petMinItem({double data, int num}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Text(
        data.toStringAsFixed(num),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    var ethH = coinsPerMin * 60;
    var ethD = ethH * 24;
    var ethM = ethD * 30;
    
    var usdH = usdPerMin * 60;
    var usdD = usdH * 24;
    var usdM = usdD * 30;
    
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _itemDate(title: ''),
                        _itemDate(title: 'hour'),
                        _itemDate(title: 'day'),
                        _itemDate(title: 'month'),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 90,
                    child: VerticalDivider(
                        thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                  child: Column(
                    children: [
                      _itemDate(title: 'ETH'),
                      _petMinItem(data: ethH, num: 5),
                      _petMinItem(data: ethD, num: 5),
                      _petMinItem(data: ethM, num: 5),
                    ],
                  ),
                ),
                Container(
                    height: 90,
                    child: VerticalDivider(
                        thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                  child: Column(
                    children: [
                      _itemDate(title: 'USD'),
                      _petMinItem(data: usdH, num: 2),
                      _petMinItem(data: usdD, num: 2),
                      _petMinItem(data: usdM, num: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}
