import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BasicThree extends StatelessWidget {
  const BasicThree({
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
            // painter: SaveRestoreCanvasCustomPainter(),
            painter: SaveCanvasLayerCustomPainter(),
            size: Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class SaveRestoreCanvasCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(10, 0);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: 200,
            height: 200),
        Paint()..color = Colors.blue);
    canvas.restore();
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: 100,
            height: 100),
        Paint()..color = Colors.orange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SaveCanvasLayerCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: 100,
            height: 100),
        Paint()..color = Colors.orange);
    canvas.saveLayer(const Rect.fromLTWH(0, 0, 200, 200),
        Paint()..color = Colors.transparent.withValues(alpha: 0.7));
    canvas.drawRect(
        const Rect.fromLTWH(0, 0, 200, 200), Paint()..color = Colors.blue);
    canvas.drawRect(
        const Rect.fromLTWH(0, 0, 100, 200), Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
