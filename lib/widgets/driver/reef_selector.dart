import 'dart:math';

import 'package:dashboard24/services/dashboard_state.dart';
import 'package:flutter/material.dart';

class ReefSelector extends StatefulWidget {
  final DashboardState dashboardState;
  final bool redAlliance;

  const ReefSelector({
    super.key,
    required this.dashboardState,
    required this.redAlliance,
  });

  @override
  State<ReefSelector> createState() => _ReefSelectorState();
}

class _ReefSelectorState extends State<ReefSelector> {
  int _selected = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor = widget.redAlliance ? Colors.red[700]! : Colors.indigo;

    return Transform.scale(
      scale: 1.5,
      child: SizedBox(
      width: 450,
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            widget.redAlliance
                ? Image.asset('images/reef_red.png', fit: BoxFit.fill)
                : Image.asset('images/reef_blue.png', fit: BoxFit.fill),
            ...List.generate(12, (index) {
              double angle = ((index * 30) + 15) * (3.141592653589793 / 180);
              double radius = 150;

              double left = 450 / 2 + radius * cos(angle) - 20;
              double top = 450 / 2 + radius * sin(angle) - 20;

              return Positioned(
                left: left,
                top: top,
                child: Transform.rotate(
                  angle: 0.0,
                  child: Transform.scale(
                    scale: 3.0,
                    child: Checkbox(
                      value: _selected == index,
                      splashRadius: 9,
                      checkColor: Colors.white,
                      activeColor: activeColor,
                      shape: const CircleBorder(),
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                      onChanged: (value) {
                        setState(() {
                          if (value ?? false) {
                            _selected = index;
                            widget.dashboardState.setReefPose(_selected);
                          }
                        });
                      },
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    ));
  }
}
