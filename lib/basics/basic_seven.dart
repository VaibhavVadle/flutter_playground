import 'package:flutter/material.dart';

class BasicSeven extends StatelessWidget {
  const BasicSeven({
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
            painter: CombinePathPainter(),
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
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    Path path = Path()..addRect(rect);
    // ----> contains on path used to identify the offset point is inside or outside the path
    debugPrint(
        'Contains ${path.contains(Offset(size.width / 2, size.height / 2))}'); // true
    debugPrint(
        'Contains ${path.contains(Offset(size.width / 2, size.height / 16))}'); // false
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CombinePathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;
    Rect rectOne = Rect.fromCircle(
      center: Offset((size.width / 2) + (size.width / 8), size.height / 2),
      radius: size.width / 4,
    );
    Rect rectTwo = Rect.fromCircle(
      center: Offset((size.width / 2) - (size.width / 8), size.height / 2),
      radius: size.width / 4,
    );
    Path pathOne = Path()..addOval(rectOne);
    Path pathTwo = Path()..addOval(rectTwo);
    // canvas.drawPath(pathOne, paint);
    // canvas.drawPath(pathTwo,paint);
    // ----> Combine path to get intersect,difference, union, etc of two path
    // canvas.drawPath(Path.combine(PathOperation.intersect, pathOne, pathTwo), paint);
    // ---->
    paint.style = PaintingStyle.fill;
    canvas.drawPath(Path.combine(PathOperation.xor, pathOne, pathTwo), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
