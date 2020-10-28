import 'package:flutter/material.dart';
import 'package:myethermine/ui/widgets/miner_chart.dart';

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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          h.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Text('MH/s',
          style: TextStyle(
            fontSize: 12,
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          h.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        Text('MH/s',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
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
            child: Column(
              children: [
                Row(
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
                MinerChart(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
