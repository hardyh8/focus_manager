import 'package:flutter/material.dart';

class TimeSelectionDialog extends StatefulWidget {
  const TimeSelectionDialog({super.key, required this.initialSecond});
  final int initialSecond;

  @override
  State<TimeSelectionDialog> createState() => _TimePickerDialogState();
}

class _TimePickerDialogState extends State<TimeSelectionDialog> {
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _hourController;

  @override
  void initState() {
    int hours = widget.initialSecond ~/ 3600;
    int remainingSeconds = widget.initialSecond % 3600;
    int minutes = remainingSeconds ~/ 60;
    _hourController = FixedExtentScrollController(initialItem: hours);
    _minuteController = FixedExtentScrollController(initialItem: minutes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Time'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Hours'),
              SizedBox(
                height: 150,
                width: 50,
                child: ListWheelScrollView.useDelegate(
                  controller: _hourController,
                  itemExtent: 40,
                  magnification: 1.5,
                  physics: const FixedExtentScrollPhysics(),
                  useMagnifier: true,
                  overAndUnderCenterOpacity: 0.5,
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) =>
                        Center(child: Text(index.toString())),
                    childCount: 25,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Minutes'),
              SizedBox(
                height: 150,
                width: 50,
                child: ListWheelScrollView.useDelegate(
                  controller: _minuteController,
                  itemExtent: 40,
                  magnification: 1.5,
                  physics: const FixedExtentScrollPhysics(),
                  useMagnifier: true,
                  overAndUnderCenterOpacity: 0.5,
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) =>
                        Center(child: Text(index.toString())),
                    childCount: 61,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context,
                [_hourController.initialItem, _minuteController.initialItem]);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context,
                [_hourController.selectedItem, _minuteController.selectedItem]);
          },
          child: const Text('Select Time'),
        ),
      ],
    );
  }
}
