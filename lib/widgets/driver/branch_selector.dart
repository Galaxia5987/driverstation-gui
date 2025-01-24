import 'package:dashboard24/services/dashboard_state.dart';
import 'package:flutter/material.dart';

class BranchSelector extends StatefulWidget {
  final DashboardState dashboardState;
  final bool redAlliance;

  const BranchSelector({
    super.key,
    required this.dashboardState,
    required this.redAlliance,
  });

  @override
  State<BranchSelector> createState() => _BranchSelectorState();
}

class _BranchSelectorState extends State<BranchSelector> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    Color activeColor = widget.redAlliance ? Colors.red[700]! : Colors.indigo;

    return SizedBox(
      width: 250,
      height: 720,
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(2.5),
                child: Image.asset('images/reef_branch.png'),
              )),

          // Positioning the checkboxes directly over the image
          Positioned(
            top: 50,
            left: 45,
            child: Transform.scale(
              scale: 5,
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
                      widget.dashboardState.setBranchPose(_selected);
                    }
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 230.0,
            left: 40,
            child: Transform.scale(
              scale: 5,
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
                      widget.dashboardState.setBranchPose(_selected);
                    }
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 40,
            child: Transform.scale(
              scale: 5,
              child: Checkbox(
                value: _selected == 3,
                splashRadius: 9,
                checkColor: Colors.white,
                activeColor: activeColor,
                shape: const CircleBorder(),
                side: const BorderSide(width: 0.5, color: Colors.grey),
                onChanged: (value) {
                  setState(() {
                    if (value ?? false) {
                      _selected = 3;
                      widget.dashboardState.setBranchPose(_selected);
                    }
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 590.0,
            right: 0.0,
            left: 0.0,
            child: Transform.scale(
              scale: 5,
              child: Checkbox(
                value: _selected == 4,
                splashRadius: 9,
                checkColor: Colors.white,
                activeColor: activeColor,
                shape: const CircleBorder(),
                side: const BorderSide(width: 0.5, color: Colors.black),
                onChanged: (value) {
                  setState(() {
                    if (value ?? false) {
                      _selected = 4;
                      widget.dashboardState.setBranchPose(_selected);
                    }
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
