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

    return SizedBox(
      width: 450,
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            widget.redAlliance ? Image.asset('images/reef_red.png') : Image.asset('images/reef_blue.png'),
            Positioned(
              left: 90,
              top: 220,
              child: Transform.scale(
                scale: 3.0,
                child: Checkbox(
                  value: _selected == 0,
                  splashRadius: 9,
                  checkColor: Colors.white,
                  activeColor: activeColor,
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  onChanged: (value) {
                    setState(() {
                      if (value ?? false) {
                        _selected = 0;
                        widget.dashboardState.setReefPose(_selected);
                      }
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: 200,
              top: 35,
              child: Transform.scale(
                scale: 3.0,
                child: Checkbox(
                  value: _selected == 1,
                  splashRadius: 9,
                  checkColor: Colors.white,
                  activeColor: activeColor,
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  onChanged: (value) {
                    setState(() {
                      if (value ?? false) {
                        _selected = 1;
                        widget.dashboardState.setReefPose(_selected);
                      }
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: 315,
              top: 220,
              child: Transform.scale(
                scale: 3.0,
                child: Checkbox(
                  value: _selected == 2,
                  splashRadius: 9,
                  checkColor: Colors.white,
                  activeColor: activeColor,
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  onChanged: (value) {
                    setState(() {
                      if (value ?? false) {
                        _selected = 2;
                        widget.dashboardState.setReefPose(_selected);
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
