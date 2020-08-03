import 'package:bkapp_flutter/core/services/api/http_requests.dart';
import 'package:bkapp_flutter/environment_config.dart';
import 'package:flutter/material.dart';

class MenuRequests extends StatelessWidget {
  const MenuRequests({
    Key key,
    @required this.position,
    @required this.onDragEnd
  }) : super(key: key);

  final Offset position;
  final Function onDragEnd;

  @override
  Widget build(BuildContext context) {
    if (EnvironmentConfig.ENV == 'DEV') {
      return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          child: RaisedButton(
            color: Colors.deepPurple,
            child: Icon(Icons.bug_report, color: Colors.white,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            onPressed: () => alice.showInspector()),
          feedback: RaisedButton(
            color: Colors.redAccent,
            child: Icon(Icons.accessible_forward, color: Colors.white,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            onPressed: () => alice.showInspector()),
          childWhenDragging: Container(),
          onDragEnd: (details) => onDragEnd(details)
        ),
      );
    }
    return SizedBox();
  }

  @mustCallSuper
  bool debugCheckContext(BuildContext context) {
    assert(debugCheckHasStack(context));
    return true;
  }

  bool debugCheckHasStack(BuildContext context) {
    assert(() {
      if (context.widget is! Stack && context.findAncestorWidgetOfExactType<Stack>() == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('No Stack widget found.'),
          ErrorDescription(
            '${context.widget.runtimeType} widgets require a Stack '
            'widget ancestor.\n'
          ),
          ErrorHint(
            'To introduce a Stack widget, you can either directly '
            'include one.',
          ),
          ...context.describeMissingAncestor(expectedAncestorType: Stack)
        ]
        );
      }
      return true;
    }());
    return true;
  }
}
