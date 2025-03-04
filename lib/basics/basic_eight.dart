import 'package:flutter/material.dart';

class BasicEight extends StatefulWidget {
  const BasicEight({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<BasicEight> createState() => _BasicEightState();
}

class _BasicEightState extends State<BasicEight> {
  ValueNotifier<Offset> offsetNotifier = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: GestureDetector(
            onTapDown: (details) {
              offsetNotifier.value = details.localPosition;
            },
            child: CustomPaint(
              painter: ClickableCanvasPainter(
                offsetNotifier: offsetNotifier,
                onTap: () {
                  debugPrint('Clicked -> ${offsetNotifier.value}');
                },
              ),
              size: Size(300, 400),
            ),
          ),
        ),
      ),
    );
  }
}

class ClickableCanvasPainter extends CustomPainter {
  final ValueNotifier<Offset> offsetNotifier;
  final VoidCallback onTap;

  ClickableCanvasPainter({
    required this.offsetNotifier,
    required this.onTap,
  }) : super(repaint: offsetNotifier);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    Path path = Path()
      ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width / 2,
        height: size.height / 2,
      ));
    canvas.drawPath(path, paint);

    if(path.contains(offsetNotifier.value)) {
      onTap();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
