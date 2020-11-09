import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myethermine/blocs/blocs.dart';
import 'package:myethermine/ui/widgets/miner.dart';
import 'package:myethermine/ui/widgets/payouts_info.dart';
import 'package:myethermine/ui/widgets/per_min.dart';
import 'package:myethermine/ui/widgets/shares.dart';
import 'package:myethermine/ui/widgets/style/background.dart';
import 'package:myethermine/ui/widgets/style/cart_style.dart';
import 'package:myethermine/ui/widgets/style/clipper.dart';
import 'package:myethermine/ui/widgets/wallet.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 420,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange[300],
                    Colors.amberAccent[100]
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment(0.8, 0.6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amberAccent,
                    blurRadius: 15.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: BackgroundItemsPageStyle(),
            ),
          ),
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.amberAccent
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment(0.8, 0.6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amberAccent,
                    blurRadius: 15.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: BackgroundItemsPageStyle(),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            top: false,
            child: BlocConsumer<DashboardBloc, DashboardState>(
              listener: (context, state) {
                if (state is DashboardEmpty) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                }
              },
              builder: (context, state) {
                if (state is DashboardEmpty) {
                  BlocProvider.of<DashboardBloc>(context)
                      .add(DashboardRequested());
                }
                if (state is DashboardLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is DashboardLoadSuccess) {
                  final _state = state.dashboard;
                  bool _seen = ( _state.status == 'OK');
                  if (_seen) {
                    print('OK');
                  } else {
                    print(_state.error);
                  }
                  return RefreshIndicator(
                    color: Colors.amberAccent,
                    onRefresh: () {
                      BlocProvider.of<DashboardBloc>(context).add(
                        DashboardRefreshRequested(),
                      );
                      return _refreshCompleter.future;
                    },
                    child: ListView(
                      children: <Widget>[
                        TitleCart(title: 'Wallet Balance'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WalletWidget(
                            // coinsPerMin: _state.coinsPerMin,
                            // usdPerMin: _state.usdPerMin,
                            // btcPerMin: _state.btcPerMin,
                          ),
                        ),
                        TitleCart(title: 'Pool Balance'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PayoutWidget(
                            activeWorkers: _state.activeWorkers,
                            unpaid: _state.unpaid,
                          ),
                        ),
                        TitleCart(title: 'Estimated Earnings'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PerMinWidget(
                            coinsPerMin: _state.coinsPerMin,
                            usdPerMin: _state.usdPerMin,
                            btcPerMin: _state.btcPerMin,
                          ),
                        ),
                        TitleCart(title: 'Hashrate'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MinerWidget(
                            currentHashrate: _state.currentHashrate,
                            averageHashrate: _state.averageHashrate,
                            reportedHashrate: _state.reportedHashrate,
                          ),
                        ),
                        TitleCart(title: 'Shares'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SharesWidget(
                            validShares: _state.validShares,
                            invalidShares: _state.invalidShares,
                            staleShares: _state.staleShares,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is DashboardError) {
                  final _state = state.error;
                  return Center(
                    child: Text(_state.error),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}