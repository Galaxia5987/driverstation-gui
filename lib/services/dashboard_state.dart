import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nt4/nt4.dart';

class DashboardState {
  static const String _robotAddress = kDebugMode ? '127.0.0.1' : '10.30.15.2';

  late NT4Client _client;

  late NT4Subscription _matchTimeSub;
  late NT4Subscription _redAllianceSub;

  late NT4Topic _reefPosePub;
  late NT4Topic _branchPosePub;

  int _reefPose = 1;
  int _branchPose = 1;

  bool _connected = false;

  DashboardState() {
    _client = NT4Client(
      serverBaseAddress: _robotAddress,
      onConnect: () {
        Future.delayed(const Duration(milliseconds: 200), () => _sendAll());
        _connected = true;
      },
      onDisconnect: () => _connected = false,
    );

    _matchTimeSub = _client.subscribePeriodic('/SmartDashboard/MatchTime', 1.0);
    _redAllianceSub =
        _client.subscribePeriodic('/SmartDashboard/IsRedAlliance', 1.0);

    _reefPosePub = _client.publishNewTopic(
        '/Dashboard/TargetReefPose', NT4TypeStr.typeInt);
    _branchPosePub = _client.publishNewTopic(
      'Dashboard/TargetBranchPose', NT4TypeStr.typeInt);

    _client.setProperties(_reefPosePub, false, true);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_connected) {
        _sendAll();
      }
    });
  }

  Stream<bool> connectionStatus() {
    return _client.connectionStatusStream().asBroadcastStream();
  }

  Stream<double> matchTime() async* {
    await for (final value in _matchTimeSub.stream()) {
      if (value is double) {
        yield value;
      }
    }
  }

  Stream<bool> isRedAlliance() async* {
    await for (final value in _redAllianceSub.stream(yieldAll: true)) {
      if (value is bool) {
        yield value;
      }
    }
  }

  void setReefPose(int reefPose) {
    if (reefPose <= 2 && reefPose >= 0) {
      _reefPose = reefPose;
      _client.addSample(_reefPosePub, _reefPose);
    }
  }

  void setBranchPose(int branchPose) {
    if (branchPose <= 2 && branchPose >= 0) {
      _branchPose = branchPose;
      _client.addSample(_branchPosePub, _branchPose);
    }
  }

  void _sendAll() {
    _client.addSample(_reefPosePub, _reefPose);
    _client.addSample(_branchPosePub, _branchPose);
  }
}
