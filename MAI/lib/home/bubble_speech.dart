import 'package:flutter/material.dart';

enum NipLocation { TOP, RIGHT, BOTTOM, LEFT }

class SpeechBubble extends StatelessWidget {
  SpeechBubble({
    Key key,
    @required this.child,
    this.nipLocation: NipLocation.BOTTOM,
    this.color: Colors.redAccent,
    this.borderRadius: 4.0,
    this.height,
    this.width,
    this.padding
  }) : super(key: key);

  final Widget child;
  final NipLocation nipLocation;
  final Color color;
  final double borderRadius;
  final double height;
  final double width;

  final Widget padding;

  Widget build(BuildContext context) {
    Offset nipOffset;
    switch (this.nipLocation) {
      case NipLocation.TOP:
        nipOffset = Offset(0.0, 7.07 - 1.5);
        break;
      case NipLocation.RIGHT:
        nipOffset = Offset(-7.07 + 1.5, 0.0);
        break;
      case NipLocation.BOTTOM:
        nipOffset = Offset(0.0, -7.07 + 1.5);
        break;
      case NipLocation.LEFT:
        nipOffset = Offset(7.07 - 1.5, 0.0);
        break;
      default:
    }

    if (this.nipLocation == NipLocation.TOP ||
        this.nipLocation == NipLocation.BOTTOM) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          children: this.nipLocation == NipLocation.BOTTOM
              ? list(nipOffset)
              : list(nipOffset).reversed.toList(),
      );
    } else {
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: this.nipLocation == NipLocation.RIGHT
              ? list(nipOffset)
              : list(nipOffset).reversed.toList(),
      );
    }
  }

  List<Widget> list(Offset nipOffset) {
    return <Widget>[
      speechBubble(),
      nip(nipOffset),
    ];
  }

  Widget speechBubble() {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(this.borderRadius),
      ),
      color: this.color,
      elevation: 1.0,
      child: Container(
        height: this.height,
        width: this.width,
        padding: this.padding ?? const EdgeInsets.all(8.0),
        child: this.child,
      ),
    );
  }

  Widget nip(Offset nipOffset) {
    return Transform.translate(
      offset: nipOffset,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(45 / 360),
        child: Material(
          borderRadius: BorderRadius.all(
            Radius.circular(1.5),
          ),
          color: this.color,
          child: Container(
            height: 12,
            width: 12,
          ),
        ),
      ),
    );
  }
}