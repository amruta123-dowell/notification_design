import 'package:flutter/material.dart';

class ProgressBarWidget extends StatefulWidget {
  final double progressNo;
  const ProgressBarWidget({required this.progressNo, super.key});

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  double get findWidth {
    if (widget.progressNo == 10) {
      return (MediaQuery.sizeOf(context).width * 1 / 10) - 10;
    } else if (widget.progressNo == 20) {
      return (MediaQuery.sizeOf(context).width * 2 / 10) - 15;
    } else if (widget.progressNo == 30) {
      return (MediaQuery.sizeOf(context).width * 3 / 10) - 20;
    } else if (widget.progressNo == 40) {
      return (MediaQuery.sizeOf(context).width * 4 / 10) - 25;
    } else if (widget.progressNo == 50) {
      return (MediaQuery.sizeOf(context).width * 5 / 10) - 30;
    } else if (widget.progressNo == 60) {
      return (MediaQuery.sizeOf(context).width * 6 / 10) - 35;
    } else if (widget.progressNo == 70) {
      return (MediaQuery.sizeOf(context).width * 7 / 10) - 40;
    } else if (widget.progressNo == 80) {
      return (MediaQuery.sizeOf(context).width * 8 / 10) - 45;
    } else if (widget.progressNo == 90) {
      return (MediaQuery.sizeOf(context).width * 9 / 10) - 50;
    }
    return double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 22, 22, 23),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Positioned(
          child: Container(
            height: 10,
            width: findWidth,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
