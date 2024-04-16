import 'package:flutter/material.dart';
import 'constants.dart';

class RoundedButton extends StatelessWidget {
  final String lble;
  final Color clr;
  final void Function()? onPress;
  RoundedButton(
      {this.lble = 'label', this.clr = Colors.white, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: clr,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            lble,
          ),
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String? sender;
  final String? text;
  final bool isMe; //checks if current user is sending message

  MessageBubble({this.sender, this.text, this.isMe = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start, //change to leftside for others
        children: [
          Material(
            color: isMe
                ? Color(0xFF03EC9A)
                : Color(0xFF1DDBE2), //change to green for others
            elevation: 5,
            borderRadius: isMe
                ? kCurrentUserMessageBubbleBorder
                : kOtherUserMessageBubbleBorder,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text!,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          Text(
            sender!,
            style: TextStyle(color: Colors.white70, fontSize: 12),
          )
        ],
      ),
    );
  }
}
