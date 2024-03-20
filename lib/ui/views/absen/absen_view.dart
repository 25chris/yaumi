import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';
import 'package:yaumi/ui/common/app_shared_style.dart';
import 'package:yaumi/ui/common/ui_helpers.dart';
import 'package:yaumi/ui/views/absen/widgets/button_row_widget.dart';
import 'package:yaumi/ui/views/absen/widgets/main_widget.dart';

import 'absen_viewmodel.dart';

class AbsenView extends StackedView<AbsenViewModel> {
  const AbsenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AbsenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Absen ",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 30.0,
                      color: Colors.blueGrey[600],
                      fontStyle: FontStyle.italic,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: "Kerja",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 30.0,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w800),
                )
              ])),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.green,
                    )),
              ),
            ],
          ),
        ),
        StaggeredGrid.count(
          crossAxisCount: 6,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 1.5,
                child: DatePicker(
                  DateTime.now().subtract(const Duration(days: 11)),
                  locale: "id_ID",
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.teal,
                  selectedTextColor: Colors.white,
                  activeDates: List.generate(
                      10,
                      (index) =>
                          DateTime.now().subtract(Duration(days: index))),
                  daysCount: 14, // 10 days back, current day, 3 days forward
                  onDateChange: (date) {
                    // Check if the selected date is within the inactive range
                    // if (date.isAfter(now) && date.isBefore(threeDaysAhead)) {
                    // Show dialog or toast to inform about inactive date selection
                    // showDialog(
                    // context: context,
                    // builder: (context) => AlertDialog(
                    // title: Text('Date Unavailable'),
                    // content: Text('This date is not available for selection.'),
                    // actions: [
                    // TextButton(
                    // onPressed: () => Navigator.of(context).pop(),
                    // child: Text('OK'),
                    // ),
                    // ],
                    // ),
                    // );
                    // } else {
                    // Update the state with the new date if it's within the active range
                    // setState(() {
                    // _selectedDate = date;
                    // });
                    // }
                  },
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 6,
                mainAxisCellCount: 4.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: MainWidget(),
                  ),
                )),
          ],
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/300"),
            ),
            title: Text("Masuk Jam 08.00"),
            subtitle: Text("Lokasi absen kerja: Lokasi, Kota"),
            trailing: IconButton(
              onPressed: null,
              icon: Icon(Icons.info),
            ),
          ),
        )
      ],
    ));
  }

  @override
  AbsenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AbsenViewModel();
}
