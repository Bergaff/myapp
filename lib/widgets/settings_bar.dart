import 'package:flutter/material.dart';
import '../models/game_logic.dart';
import '../utils/dialogs.dart';

class SettingsBar extends StatelessWidget {
  final GameLogic gameLogic;

  const SettingsBar({Key? key, required this.gameLogic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 48,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        border: Border(
          bottom: BorderSide(color: Colors.deepOrangeAccent, width: 2),
          left: BorderSide(color: Colors.deepOrangeAccent, width: 2),
          right: BorderSide(color: Colors.deepOrangeAccent, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListTile(
              leading: const Icon(Icons.rule, color: Colors.deepOrangeAccent),
              onTap: () => showRulesDialog(context),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.deepOrangeAccent),
              onTap: () => showSettingsDialog(context),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: const Icon(Icons.bar_chart, color: Colors.deepOrangeAccent),
              onTap: () => showStatisticsDialog(context, gameLogic),
            ),
          ),
        ],
      ),
    );
  }
}
