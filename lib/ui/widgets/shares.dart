import 'package:flutter/material.dart';
import 'package:myethermine/ui/widgets/miner_chart.dart';
import 'package:myethermine/ui/widgets/cart_style.dart';

class SharesWidget extends StatelessWidget {
  final int validShares;
  final int invalidShares;
  final int staleShares;

  @required
  const SharesWidget(
      {Key key, this.validShares, this.invalidShares, this.staleShares})
      : super(key: key);

  Widget _sharesItem({String name, int shares}) {
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
          '$shares',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
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
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _sharesItem(name: 'Valid', shares: validShares)),
                Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _sharesItem(name: 'Stale', shares: staleShares)),
                Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _sharesItem(name: 'Invalid', shares: invalidShares)),
              ],
            ),
          ),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}
