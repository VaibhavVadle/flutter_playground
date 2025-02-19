import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BasicOne extends StatelessWidget {
  const BasicOne({
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
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromLTRB(20, 20, 200, 300);
    // ---->
    // canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    // canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
    // ---->
    // canvas.drawCircle(center, 50, paint);
    // ---->
    // canvas.drawRect(
    //     Rect.fromCenter(center: center, width: 200, height: 300), paint);
    // canvas.drawRect(Rect.fromLTWH(20, 20, size.width, size.height), paint);
    // canvas.drawRect(rect, paint);
    // ---->
    // canvas.drawOval(rect, paint);
    // canvas.drawOval(Rect.fromCircle(center: Offset.zero, radius: 20), paint);
    // ---->
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(20)), paint);
    // canvas.drawRRect(RRect.fromRectAndCorners(rect,bottomRight: Radius.circular(20)), paint);
    // canvas.drawRRect(RRect.fromRectXY(rect, 10, 20), paint);
    // ---->
    // Rect bigRect = Rect.fromLTRB(10, 20, 100, 200);
    // RRect bigRRect = RRect.fromRectXY(bigRect, 75, 25);
    // Rect smallRect = Rect.fromLTRB(20, 30, 100, 190);
    // RRect smallRRect = RRect.fromRectXY(smallRect, 75, 25);
    // paint.style = PaintingStyle.fill;
    // canvas.drawDRRect(bigRRect, smallRRect, paint);
    // ---->
    // canvas.drawColor(Colors.blue, BlendMode.src);
    // ---->
    // paint.shader = ui.Gradient.linear(
    //   Offset.zero,
    //   Offset(size.width, size.height),
    //   [Colors.green, Colors.blue],
    // );
    // canvas.clipRect(Offset.zero & size);
    // canvas.drawPaint(paint);
    // ---->
    // final List<Offset> points = <Offset>[
    //   Offset.zero,
    //   Offset(size.width, 0),
    //   Offset(size.width / 2, size.height / 2),
    //   Offset.zero,
    // ]; // ‹Offset>[]
    // canvas.drawPoints(ui.PointMode.polygon, points, paint);
    // ----> More optimized than drawPoints
    // final Float32List points = Float32List.fromList([
    //   0,
    //   0,
    //   size.width,
    //   0,
    //   size.width / 2,
    //   size.height / 2,
    //   0,
    //   0,
    // ]);
    // canvas.drawRawPoints(ui.PointMode.polygon, points, paint);
    // ---->
    Paint newPaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width / 2,
          height: size.height / 2));
    canvas.drawShadow(path, Colors.blue, 10, false);
    canvas.drawPath(path, newPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
