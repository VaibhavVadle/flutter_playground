import 'package:flutter/material.dart';

class BasicSix extends StatelessWidget {
  const BasicSix({
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
            // painter: MasterPainter(),
            painter: CalculateBoundPainter(),
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
    Paint orange = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange
      ..strokeWidth = 2;
    Paint indigo = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.indigo
      ..strokeWidth = 2;
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 4,
    );
    Path path = Path()..addRect(rect);
    canvas.drawPath(path, orange);
    // ----> Reset used to reset the path and used to avoid override of canvas
    // path.reset();
    // path.addOval(rect);
    // canvas.drawPath(path, indigo);

    // ----> Path shifting
    // Path translatedPath = path.shift(Offset(size.width /4, 0));
    // canvas.drawPath(translatedPath, indigo);

    // ----> Path rotation
    canvas.drawPath(path, orange);
    Matrix4 transformation = Matrix4.identity();
    // Note the value is in radian
    transformation.rotateX(0.7853); // Radian of 90 degree is 0.7853

    Path transformPath = path.transform(transformation.storage);
    canvas.drawPath(transformPath, indigo);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CalculateBoundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;
    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..cubicTo(0, size.height / 8, size.width, size.height, size.width,
          size.height / 2);
    canvas.drawPath(path, paint);
    Rect rect = path.getBounds();
    print('Height ${rect.height} Width ${rect.width}');
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
