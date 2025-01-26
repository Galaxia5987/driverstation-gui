import 'package:dashboard24/services/dashboard_state.dart';
import 'package:dashboard24/widgets/driver/branch_selector.dart';
import 'package:dashboard24/widgets/driver/reef_selector.dart';
import 'package:dashboard24/widgets/driver/feeder_selector.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final DashboardState dashboardState;

  const Dashboard({
    super.key,
    required this.dashboardState,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _redAlliance = false;

  @override
  void initState() {
    super.initState();

    widget.dashboardState.isRedAlliance().listen((event) {
      if (event != _redAlliance) {
        setState(() {
          _redAlliance = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Focus(
        skipTraversal: true,
        canRequestFocus: false,
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: StreamBuilder(
                  stream: widget.dashboardState.connectionStatus(),
                  builder: (context, snapshot) {
                    bool connected = snapshot.data ?? false;

                    return Text(
                      'NT4: ${connected ? 'Connected' : 'Disconnected'}',
                      style: TextStyle(
                        color: connected ? Colors.green : Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: BranchSelector(
                dashboardState: widget.dashboardState,
                redAlliance: _redAlliance,
              ),
            ),
            Align(
              alignment:
                  Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(440, 40, 40, 40),
                child: ReefSelector(
                  dashboardState: widget.dashboardState,
                  redAlliance: _redAlliance,
                ),
              ),
            ),
            Align(
              alignment:  Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: FeederSelector(
                  dashboardState: widget.dashboardState,
                  redAlliance: _redAlliance
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
