import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myethermine/utils/eth_balance_format.dart';

import 'style/cart_style.dart';

class WalletWidget extends StatelessWidget {

  final String address = '0x460a6deec1d52c9c397e92fdc8c4bc05d10f8429';
  final String balance;

  @required
  const WalletWidget({Key key, this.balance}) : super(key: key);

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
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 40.0,
              ),
              child: SvgPicture.asset(
                'assets/img/ethereum-logo.svg',
                alignment: Alignment.centerRight,
                height: 110,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _WalletItem(address: address, balance: balance),
                ],
              ),
            ),
          ]),
        ),
        ShadowBoxCart(),
      ],
    );
  }
}

class _WalletItem extends StatelessWidget {

  final String address;
  final String balance;

  const _WalletItem({Key key, this.address, this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var balanceItem = int.parse(balance);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${address.substring(0, 6)}...${address.substring(address.length - 6, address.length)}",
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            children: [
              Text(
                "${EthAmountFormatter(balanceItem).format()} ETH",
                // balance,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

