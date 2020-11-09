import 'package:flutter/material.dart';

import 'style/cart_style.dart';

class PerMinWidget extends StatelessWidget {
  final double coinsPerMin;
  final double usdPerMin;
  final double btcPerMin;

  @required
  const PerMinWidget(
      {Key key, this.coinsPerMin, this.usdPerMin, this.btcPerMin})
      : super(key: key);

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
                        _PerMinItemDate(title: ''),
                        _PerMinItemDate(title: 'hour'),
                        _PerMinItemDate(title: 'day'),
                        _PerMinItemDate(title: 'month'),
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
                      _PerMinItemDate(title: 'ETH'),
                      _PerMinItem(data: ethH, num: 5),
                      _PerMinItem(data: ethD, num: 5),
                      _PerMinItem(data: ethM, num: 5),
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
                      _PerMinItemDate(title: 'USD'),
                      _PerMinItem(data: usdH, num: 2),
                      _PerMinItem(data: usdD, num: 2),
                      _PerMinItem(data: usdM, num: 2),
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

class _PerMinItemDate extends StatelessWidget {
  final String title;

  const _PerMinItemDate({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class _PerMinItem extends StatelessWidget {
  final double data;
  final int num;

  const _PerMinItem({Key key, this.data, this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
