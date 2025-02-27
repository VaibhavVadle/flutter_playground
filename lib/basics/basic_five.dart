import 'dart:ui';

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
            painter: ContourPathPainter(),
            // painter: MasterPainter(),
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
    path.addPolygon([
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

class ContourPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;

    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 4,
    );
    Path path = Path()
      ..addRect(Rect.fromCenter(
          center: Offset.zero, width: size.width / 4, height: size.height / 4))
      ..addOval(rect);
    // ----> Use of compute metrics to get the area of contour's in path of canvas
    List<PathMetric> pathMetrics = path.computeMetrics().toList();
    print(pathMetrics.length);
    //2*(L+b) = 2*(75+100) = 350
    print(pathMetrics.first.length);
    //2*pi*r
    print(pathMetrics.last.length);
    Path pathSub = pathMetrics.last.extractPath(10, 100);
    canvas.drawPath(pathSub, paint);
    // ----> Tangent used to get the position or angle
    Tangent? tangent = pathMetrics.last.getTangentForOffset(80);
    print(tangent?.position);
    print(tangent?.vector);
    path.addPolygon([
      Offset.zero,
      for(int i=0;i<15;i++) Offset(186.1 + (-0.9 *i*10),265.8 + (0.5*i*10))
    ], false);
    // 127
    print(tangent?.angle);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
