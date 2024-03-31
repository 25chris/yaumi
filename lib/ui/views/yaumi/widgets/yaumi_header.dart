import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

class YaumiLastPeriode extends StatelessWidget {
  final String previousTotalPoin;
  const YaumiLastPeriode({super.key, required this.previousTotalPoin});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1.5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Periode\n",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[800]),
                ),
                TextSpan(
                  text: "Sebelumnya:\n",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey[600]),
                ),
                TextSpan(
                  text: previousTotalPoin,
                  style: ktsBodyRegular.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueGrey[800]),
                )
              ]))
            ],
          ),
        ));
  }
}

class YaumiCurrentPeriode extends StatelessWidget {
  final String currentTotalPoin;
  const YaumiCurrentPeriode({super.key, required this.currentTotalPoin});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1.5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Periode\n",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[800]),
                ),
                TextSpan(
                  text: "Sekarang:\n",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey[600]),
                ),
                TextSpan(
                  text: currentTotalPoin,
                  style: ktsBodyRegular.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueGrey[800]),
                )
              ]))
            ],
          ),
        ));
  }
}

class YaumiDailyAverage extends StatelessWidget {
  final String todayPoin;
  const YaumiDailyAverage({super.key, required this.todayPoin});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 1.5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Total Poin\n",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[800]),
                ),
                TextSpan(
                  text: "Hari ini:\n",
                  style: ktsBodyRegular.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey[600]),
                ),
                TextSpan(
                  text: todayPoin,
                  style: ktsBodyRegular.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueGrey[800]),
                )
              ]))
            ],
          ),
        ));
    ;
  }
}
