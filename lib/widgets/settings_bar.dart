import 'package:flutter/material.dart';
import '../models/game_logic.dart';
import '../utils/dialogs.dart';

class SettingsBar extends StatelessWidget {
  final GameLogic gameLogic;

  const SettingsBar({Key? key, required this.gameLogic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.only(bottom: 12.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: CustomPaint(
          painter: TrapezoidPainter(),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.rule, color: Color(0xFFEC6043)),
                  onPressed: () => showRulesDialog(context),
                ),
                IconButton(
                  icon: const Icon(Icons.settings,
                      color: Color(0xFFEC6043)),
                  onPressed: () => showSettingsDialog(context),
                ),
                IconButton(
                  icon: const Icon(Icons.bar_chart,
                      color: Color(0xFFEC6043)),
                  onPressed: () => showStatisticsDialog(context, gameLogic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFEC6043)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final radius = 20.0; // Радиус закругления нижних углов
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * 0.95, size.height - radius * 0.6)
      ..arcToPoint(
        Offset(size.width * 0.95 - radius, size.height),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(size.width * 0.05 + radius, size.height)
      ..arcToPoint(
        Offset(size.width * 0.05, size.height - radius * 0.6),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(0, 0);
    //..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
