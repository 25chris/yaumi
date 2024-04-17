import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/views/home/home_viewmodel.dart';

class YaumiMenuContent extends StatelessWidget {
  final HomeViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const YaumiMenuContent(
      {super.key, required this.viewModel, required this.userAccount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: InkWell(
        onTap: () => viewModel.toYaumi(),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '100.00 %\n',
                            style: ktsBodyLarge.copyWith(
                                fontSize: 17.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Poppins")),
                        TextSpan(
                            text: 'Progress 11 Januari - 10 Februari',
                            style: ktsBodyLarge.copyWith(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Poppins"))
                      ])))),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/praying.png'),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Muthaba'ah Yaumiah",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class AbsenMenuContent extends StatelessWidget {
  final HomeViewModel viewModel;
  final GoogleSignInAccount userAccount;
  const AbsenMenuContent(
      {super.key, required this.viewModel, required this.userAccount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: InkWell(
        onTap: () => viewModel.toAbsen(userAccount: userAccount),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '0 hari kerja\n',
                            style: ktsBodyLarge.copyWith(
                                fontSize: 17.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Poppins")),
                        TextSpan(
                            text: '0 hari ijin',
                            style: ktsBodyLarge.copyWith(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Poppins"))
                      ])))),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/time.png'),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Absen Kerja",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupMenuContent extends StatelessWidget {
  final HomeViewModel viewModel;
  const GroupMenuContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: InkWell(
        onTap: () => viewModel.toGroups(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red[300],
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '1\n',
                            style: ktsBodyLarge.copyWith(
                                fontSize: 17.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Poppins")),
                        TextSpan(
                            text: 'Group terdaftar',
                            style: ktsBodyLarge.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Poppins"))
                      ])))),
              StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/time.png'),
                  )),
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cari Group",
                        style: ktsBodyRegular.copyWith(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
