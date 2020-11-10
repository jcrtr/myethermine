import 'dart:async';
import 'package:awesome_loader/awesome_loader.dart';
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

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Completer<void> _refreshCompleter;
  bool _isDark;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    var _darkMode = MediaQuery.of(context).platformBrightness;
    if (_darkMode == Brightness.dark){
      _isDark = true;
      print(_darkMode);
    } else {
      _isDark = false;
      print(_darkMode);
    }
    return CupertinoScrollbar(
      child: Stack(
        children: [
          if (_isDark == false) {
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(25, 1, 65, 1),
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.amberAccent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment(0.8, 0.6),
                  ),
                ),
                child: BackgroundItemsPageStyle(),
              ),
            ),
          } else {},
          SafeArea(
            minimum: const EdgeInsets.only(
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
                    child: AwesomeLoader(
                      loaderType: AwesomeLoader.AwesomeLoader4,
                      color: Colors.blue,
                    ),
                  );
                }
                if (state is DashboardLoadSuccess) {
                  final _state = state.dashboard;
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
                        BlocConsumer<DashboardEthBloc, DashboardEthState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is DashboardEthEmpty) {
                              BlocProvider.of<DashboardEthBloc>(context)
                                  .add(DashboardEthRequested());
                            }
                            if (state is DashboardEthLoading) {
                              return Center(
                                child: AwesomeLoader(
                                  loaderType: AwesomeLoader.AwesomeLoader4,
                                  color: Colors.blue,
                                ),
                              );
                            }
                            if (state is DashboardEthLoadSuccess) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: WalletWidget(
                                  balance: state.balance.result,
                                ),
                              );
                            }
                            if (state is DashboardEthError) {
                              // final _state = state.error;
                              return Center(
                                child: Text('error'),
                              );
                            }
                            return Center(
                              child: AwesomeLoader(
                                loaderType: AwesomeLoader.AwesomeLoader4,
                                color: Colors.blue,
                              ),
                            );
                          },
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
                  // final _state = state.error;
                  return Center(
                    child: Text('_state.error'),
                  );
                }
                return Center(
                  child: AwesomeLoader(
                    loaderType: AwesomeLoader.AwesomeLoader4,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
