import 'package:flutter/material.dart';

class ExampleOne extends StatelessWidget {
  const ExampleOne({
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
    // canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
    // canvas.drawLine(Offset(size.width, 0), Offset(0, size.height), paint);
    // canvas.drawCircle(center, 50, paint);
    // canvas.drawRect(
    //     Rect.fromCenter(center: center, width: 200, height: 300), paint);
    // canvas.drawRect(Rect.fromLTWH(20, 20, size.width, size.height), paint);
    // canvas.drawRect(rect, paint);
    // canvas.drawOval(rect, paint);
    // canvas.drawOval(Rect.fromCircle(center: Offset.zero, radius: 20), paint);
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(20)), paint);
    // canvas.drawRRect(RRect.fromRectAndCorners(rect,bottomRight: Radius.circular(20)), paint);
    // canvas.drawRRect(RRect.fromRectXY(rect, 10, 20), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
