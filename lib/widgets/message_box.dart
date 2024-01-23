import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Color boxColor;
  final String messageText;
  final BorderRadius borderRadius;
  final bool isSender;

  const MessageBox({
    required this.boxColor,
    required this.messageText,
    required this.borderRadius,
    required this.isSender,
    super.key});

  @override
  Widget build(BuildContext context) =>
      Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius
              ),
              elevation: 8.0,
              color: boxColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(messageText),
                ),
              ),
            ),
          ),
        );

}

// return Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Container(
// width: MediaQuery.of(context).size.width / 2.5,
// alignment: Alignment.topLeft,
// decoration: BoxDecoration(
// borderRadius: borderRadius,
// color: boxColor,
// ),
// child: Text(messageText),
// ),
// ],
// );
