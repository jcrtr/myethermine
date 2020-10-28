import 'package:flutter/material.dart';

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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '$shares',
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
            'Shares',
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
                        child: _sharesItem(name: 'Valid', shares: validShares)),
                    Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                    Expanded(
                        child: _sharesItem(name: 'Stale', shares: staleShares)),
                    Container(height: 40, child: VerticalDivider(thickness: 1.5, color: Colors.deepOrange)),
                    Expanded(
                        child: _sharesItem(name: 'Invalid', shares: invalidShares)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
