import 'package:flutter/material.dart';

class BasicFour extends StatelessWidget {
  const BasicFour({
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
    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rectOne = Rect.fromLTRB(10, 20, 100, 200);
    Rect rectTwo = Rect.fromCenter(center: center, width: 100, height: 150);
    RRect rRectOne = RRect.fromRectAndRadius(rectOne, Radius.circular(20));
    RRect rRectTwo = RRect.fromRectAndRadius(rectTwo, Radius.circular(20));

    Path path = Path();
    // ----> Add Rect to path
    // path.addRect(rectOne);
    // path.addRect(rectTwo);
    // ----> Add RRect to path
    path.addRRect(rRectOne);
    path.addRRect(rRectTwo);
    // ----> Add Oval to path
    path.addOval(rectTwo);
    // ----> Draw canvas with path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
