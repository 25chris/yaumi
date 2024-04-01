import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/services/http_service.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';

import 'yaumi_log_viewmodel.dart';

class YaumiLogView extends StackedView<YaumiLogViewModel> {
  const YaumiLogView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    YaumiLogViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log Yaumi"),
        ),
        body: FutureBuilder(
            future:
                HttpService().getYaumiByMail(email: 'zatunur.badar@gmail.com'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeAlign: 6,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                final data = snapshot.data!.data;
                final sortedData = data!
                  ..sort((a, b) =>
                      b.attributes!.date!.compareTo(a.attributes!.date!));
                return ListView.builder(
                    itemCount: sortedData.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: GlobalKey(),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sortedData[index].attributes!.poin!.toString(),
                                style: ktsBodyLarge.copyWith(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
                                    color: sortedData[index].attributes!.poin! <
                                            30
                                        ? Colors.red
                                        : sortedData[index].attributes!.poin! <
                                                80
                                            ? Colors.amber
                                            : Colors.green),
                              ),
                            ],
                          ),
                          title: Text(
                            DateFormat("EEEE, dd MMMM yyyy", "id_ID")
                                .format(sortedData[index].attributes!.date!),
                            style: ktsBodyLarge.copyWith(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w800,
                                color: Colors.blue),
                          ),
                          subtitle: Text("Target poin harian: 80.00"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {},
                        ),
                      );
                    });
              } else {
                return Container();
              }
            }));
  }

  @override
  YaumiLogViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      YaumiLogViewModel();
}
