import 'package:flutter/material.dart';
import 'dart:math' as math;

class BasicFive extends StatelessWidget {
  const BasicFive({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: MasterPainter(),
            size: Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Path path = Path();
    // ----> Instead of multiple lineTo use addPolygon
    // path
    //   ..lineTo(size.width / 2, 0)
    //   ..lineTo(size.width / 2, size.height / 2)
    //   ..lineTo(size.width, size.height / 2)
    //   ..lineTo(size.width, size.height);
    path
      .addPolygon([
        Offset(0, 0),
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height / 2),
        Offset(size.width, size.height / 2),
        Offset(size.width, size.height),
      ], false);

    // ----> Draw canvas with path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
