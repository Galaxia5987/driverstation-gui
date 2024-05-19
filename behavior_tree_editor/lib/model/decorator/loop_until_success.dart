import 'package:behavior_tree_editor/model/decorator/decorator_node.dart';
import 'package:behavior_tree_editor/model/json_util.dart';

class LoopUntilSuccess extends DecoratorNode {
  LoopUntilSuccess({
    required super.position,
    super.child,
    super.uuid,
  });

  LoopUntilSuccess.fromDataJson(Map<String, dynamic> json)
      : this(
          position: offsetFromJson(json['position']),
          child: nodeFromJson(json['child']),
          uuid: json['uuid'],
        );

  @override
  String get subTitle => 'Repeats until success';

  @override
  String get title => 'Loop Until Success';

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'loop_until_success',
      'data': {
        'uuid': uuid,
        'position': position.toJson(),
        'child': children.isEmpty ? null : children[0].toJson(),
      },
    };
  }
}
