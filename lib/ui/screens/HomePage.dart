import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:myethermine/blocs/blocs.dart';
import 'package:myethermine/ui/widgets/miner.dart';
import 'package:myethermine/ui/widgets/shares.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemBackground,
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Center(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardEmpty) {
                BlocProvider.of<DashboardBloc>(context).add(DashboardFetched());
              }
              if (state is DashboardError) {
                return Center(
                  child: Text('failed to fetch quote'),
                );
              }
              if (state is DashboardLoaded) {
                final _state = state.dashboard ;
                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MinerWidget(reportedHashrate: _state.reportedHashrate, currentHashrate: _state.reportedHashrate,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SharesWidget(validShares: _state.validShares, invalidShares: _state.invalidShares, staleShares: _state.staleShares,),
                    )
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
