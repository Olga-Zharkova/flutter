import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextDecoration extends SingleChildRenderObjectWidget {
  final Color color;

  const TextDecoration({
    required this.color,
    super.child,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTextBackground(color: color);
  }
}

class RenderTextBackground extends RenderProxyBox {
  final Color _color;

  RenderTextBackground({
    Color color = Colors.transparent,
    RenderBox? child,
  })  : _color = color,
        super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      final double width = child!.size.width;
      final double height = child!.size.height;
      final double strokeWidth = height / 4;
      final paint = Paint()
        ..color = _color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.square;
      final double startDx = offset.dx - strokeWidth;
      final double endDx = offset.dx + width + strokeWidth;
      final double endDy = offset.dy + height + strokeWidth;
      final double startDy = offset.dy - strokeWidth;
      final path = Path()
        ..moveTo(startDx, startDy)
        ..lineTo(endDx, startDy)
        ..lineTo(endDx, endDy)
        ..lineTo(startDx, endDy)
        ..lineTo(startDx, startDy);
      context.canvas.drawPath(path, paint);
      context.paintChild(child!, offset);
    }
  }
}
