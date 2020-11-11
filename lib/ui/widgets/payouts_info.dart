import 'package:flutter/material.dart';
import 'package:myethermine/utils/eth_balance_format.dart';

import 'style/cart_style.dart';

class PayoutWidget extends StatelessWidget {
  final int activeWorkers;
  final int unpaid;

  @required
  const PayoutWidget({Key key, this.activeWorkers, this.unpaid})
      : super(key: key);

  Widget _itemWorkers({String title, int data}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '$data',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _itemEth({String title, int data}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '${EthAmountFormatter(data).format()}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
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
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: _itemWorkers(title: 'Active Miner', data: activeWorkers)),
                Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                Expanded(
                    child: _itemEth(title: 'Unpaid', data: unpaid)),
              ],
            ),
          ),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}
