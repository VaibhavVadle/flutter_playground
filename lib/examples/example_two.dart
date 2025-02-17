import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  ValueNotifier<ui.Image?> imageInfoNotifier = ValueNotifier<ui.Image?>(null);

  @override
  void initState() {
    _getImage();
    super.initState();
  }

  void _getImage() {
    NetworkImage image = const NetworkImage(
        "https://images.pexels.com/photos/11898887/pexels-photo-11898887.jpeg?auto=compress&cs=tinysrgb&w=300&h=400&dpr=2");
    ImageStream stream = image.resolve(ImageConfiguration.empty);
    ImageStreamListener streamListener = ImageStreamListener(
      (imageInfo, synchronousCall) {
        imageInfoNotifier.value = imageInfo.image;
      },
    );
    stream.addListener(streamListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: CustomPaint(
            // painter: CustomTextPainter(),
            painter: CustomImagePainter(imageInfoNotifier: imageInfoNotifier),
            size: Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class CustomTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ui.ParagraphStyle paragraphStyle =
        ui.ParagraphStyle(fontSize: 18, fontWeight: FontWeight.w600);
    ui.TextStyle textStyle = ui.TextStyle(color: Colors.black);
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);
    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText("Hello world!");
    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: size.width));
    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CustomImagePainter extends CustomPainter {
  CustomImagePainter({required this.imageInfoNotifier})
      : super(repaint: imageInfoNotifier);
  final ValueNotifier<ui.Image?> imageInfoNotifier;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black;
    ui.Image? image = imageInfoNotifier.value;
    if (image != null) {
      // canvas.drawImage(image, Offset.zero, paint);
      // ---->
      // Size imgSize = Size(image.width.toDouble(), image.height.toDouble());
      // Rect imgRect = Offset.zero & imgSize;
      // Rect canvasRect = Offset.zero & size;
      // canvas.drawImageRect(image, imgRect, canvasRect, paint);
      // ---->
      List<RSTransform> transforms = [
        RSTransform.fromComponents(
          rotation: 0,
          scale: 1,
          anchorX: 0,
          anchorY: 0,
          translateX: 0,
          translateY: 0,
        ),
        RSTransform.fromComponents(
          rotation: 0,
          scale: 1.5,
          anchorX: 0,
          anchorY: 0,
          translateX: 100,
          translateY: 100,
        ),
        RSTransform.fromComponents(
          rotation: 0.28,
          scale: 1,
          anchorX: 0,
          anchorY: 0,
          translateX: 200,
          translateY: 300,
        ),
      ];

      List<Rect> rects = [
        const Rect.fromLTWH(0, 0, 100, 100),
        const Rect.fromLTWH(100, 100, 100, 100),
        const Rect.fromLTWH(200, 300, 100, 100),
      ];

      List<Color> colors = [
        Colors.white.withOpacity(0.5),
        Colors.red.withOpacity(0.5),
        Colors.blue.withOpacity(0.5),
      ];
      canvas.drawAtlas(image, transforms, rects, colors, BlendMode.plus, null, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
