import 'package:flutter/material.dart';

class BasicNine extends StatelessWidget {
  const BasicNine({
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
            // painter: BasicPainter(),
            painter: BlurEffectPainter(),
            size: Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class BasicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.miter;
    paint.strokeMiterLimit = 2;
    canvas.drawPath(
        Path()
          ..lineTo(size.width / 2, size.height / 2)
          ..lineTo(size.width / 2, 0),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BlurEffectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue;

    // Mask filter will add gaussian blur effect
    paint.maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

    canvas.drawPath(
        Path()
          ..addRect(Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width / 2,
            height: size.height / 2,
          )),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
