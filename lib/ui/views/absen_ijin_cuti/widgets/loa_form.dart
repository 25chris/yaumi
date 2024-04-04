import 'dart:io';

import 'package:flutter/material.dart';

class LOAForm extends StatefulWidget {
  const LOAForm({super.key});

  @override
  State<LOAForm> createState() => _LOAFormState();
}

class _LOAFormState extends State<LOAForm> {
  // final ImagePicker _picker = ImagePicker();
  File? _image;
  DateTimeRange? dateRange;
  final TextEditingController _reasonController = TextEditingController();

  // Future<void> _pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() {
  //       _image = File(image.path);
  //     });
  //   }
  // }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: dateRange,
    );

    if (newDateRange != null) {
      setState(() {
        dateRange = newDateRange;
      });
    }
  }

  void _submitForm() {
    // Here you can handle the form submission, e.g., validation and sending data to a backend or another screen
    print('Submit the form with:');
    print('Date Range: ${dateRange.toString()}');
    print('Reason for LOA: ${_reasonController.text}');
    if (_image != null) {
      print('Image Path: ${_image!.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOA Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: Text('Select Date Range'),
            ),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(labelText: 'Reason for LOA'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Pick an Image'),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
