import 'package:flutter/material.dart';

class ButtonRowWidget extends StatefulWidget {
  final Function(int) onButtonPressed;

  const ButtonRowWidget({super.key, required this.onButtonPressed});
  @override
  _ButtonRowWidgetState createState() => _ButtonRowWidgetState();
}

class _ButtonRowWidgetState extends State<ButtonRowWidget> {
  int _activeButton = 0; // No button is active by default

  @override
  Widget build(BuildContext context) {
    // List of icons for the buttons
    final icons = [
      Icons.home,
      Icons.search,
      Icons.notifications,
      Icons.account_circle
    ];
    // Corresponding labels for the buttons
    final labels = ['Masuk', 'Ijin', 'Sakit', 'WFH'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(icons.length, (index) {
        return GestureDetector(
          onTap: () {
            widget.onButtonPressed(index);
            setState(() {
              _activeButton = index;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 50, // Square shape
                height: 50,
                decoration: BoxDecoration(
                  color:
                      _activeButton == index ? Colors.blue : Colors.grey[300],
                  shape: BoxShape.rectangle,
                ),
                child: Icon(
                  icons[index],
                  color: _activeButton == index ? Colors.white : Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                labels[index],
                style: TextStyle(
                  color: _activeButton == index ? Colors.blue : Colors.black,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
