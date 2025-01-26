import 'package:dashboard24/services/dashboard_state.dart';
import 'package:flutter/material.dart';

const int feederValue = 5;

class FeederSelector extends StatefulWidget {
  final DashboardState dashboardState;
  final bool redAlliance;

  const FeederSelector({
    super.key,
    required this.dashboardState,
    required this.redAlliance,
  });

  @override
  State<FeederSelector> createState() => _FeederSelectorState();
}

class _FeederSelectorState extends State<FeederSelector> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    Color activeColor = widget.redAlliance ? Colors.red[700]! : Colors.indigo;

    return ClipRect( // To prevent overflowing content
      child: Transform.scale(
        scale: 1.0,
        child: Stack(
          children: [
            // First Image
            Padding(
              padding: const EdgeInsets.fromLTRB(500, 0, 0, 0), // Adjust padding if necessary
              child: Transform(
                alignment: Alignment.bottomRight,
                transform: Matrix4.identity()..scale(0.3), // Scale image down
                child: Image.asset('images/coral_station.png'),
              ),
            ),

            // Position the checkbox over the first image (bottom-right)
            Positioned(
              bottom: 90,
              left: 1090, 
              child: Transform.scale(
                scale: 5, 
                child: Checkbox(
                  value: _selected == 11,
                  splashRadius: 9,
                  checkColor: Colors.white,
                  activeColor: activeColor,
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  onChanged: (value) {
                    setState(() {
                      if (value ?? false) {
                        _selected = 11;
                        widget.dashboardState.setBranchPose(feederValue);
                        widget.dashboardState.setReefPose(_selected);
                      }
                    });
                  },
                ),
              ),
            ),

            // Second Image (Reversed)
            Align(  
              alignment: Alignment.bottomLeft, // Align to the bottom left
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..scale(0.3) 
                  ..rotateY(3.141592653589793) // Reverse the image
                  ..translate(300.0, 0.0, 0.0),
                child: Image.asset('images/coral_station.png'),
              ),
            ),

            // Position the checkbox over the second image (bottom-left)
            Positioned(
              bottom: 90,
              left: 250, // Adjusted positioning to make sure it fits within the screen
              child: Transform.scale(
                scale: 5,
                child: Checkbox(
                  value: _selected == 12, // Different value for the second checkbox
                  splashRadius: 9,
                  checkColor: Colors.white,
                  activeColor: activeColor,
                  shape: const CircleBorder(),
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  onChanged: (value) {
                    setState(() {
                      if (value ?? false) {
                        _selected = 12;
                        widget.dashboardState.setBranchPose(feederValue);
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
