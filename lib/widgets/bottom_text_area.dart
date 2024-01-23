import 'package:flutter/material.dart';

class BottomTextArea extends StatefulWidget {
  const BottomTextArea({required this.onPressed, super.key});

  final Function onPressed;

  @override
  State<BottomTextArea> createState() => _BottomTextAreaState();
}

class _BottomTextAreaState extends State<BottomTextArea> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
                ),
              ),
            ),
            ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            shape: const CircleBorder(),
            child: const Icon(Icons.send),
            onPressed: () => widget.onPressed,)
        ],
      ),
    );
  }
}
