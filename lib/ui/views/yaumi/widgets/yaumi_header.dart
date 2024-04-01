import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/yaumi/yaumi_viewmodel.dart';

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

class YaumiSavedPoin extends StatelessWidget {
  final String todayPoin;
  final YaumiViewModel viewModel;
  const YaumiSavedPoin(
      {super.key, required this.todayPoin, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HttpService().getYaumiByDateAndMail(
            email: 'zatunur.badar@gmail.com',
            date: DateFormat("yyyy-MM-dd").format(viewModel.selectedDateTime)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 50, top: 20, bottom: 20),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            final poinData = snapshot.data!.data;
            if (poinData!.isEmpty) {
              return StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text("Anda belum menyimpan data yaumi hari ini. ",
                            style: ktsBodyRegular.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[800])),
                        horizontalSpaceSmall,
                      ],
                    ),
                  ));
            } else {
              return StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text("Total poin tersimpan hari ini: ",
                            style: ktsBodyRegular.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[800])),
                        horizontalSpaceSmall,
                        Text(
                          poinData.first.attributes!.poin!.toString(),
                          style: ktsBodyRegular.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey[800]),
                        )
                      ],
                    ),
                  ));
            }
          } else {
            return Container();
          }
        });
  }
}
