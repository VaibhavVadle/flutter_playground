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
    path.reset();
    path.addOval(rect);
    // canvas.drawPath(path, indigo);
    // ----> Path shifting
    Path translatedPath = path.shift(Offset(size.width /4, 0));
    canvas.drawPath(translatedPath, indigo);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
