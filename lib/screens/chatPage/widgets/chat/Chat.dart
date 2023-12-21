import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: MessageList(), // The list of messages
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageInputField(), // The input field at the bottom
            ),

        ],
      ),
    );
  }
}




class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with your dynamic message count
      itemBuilder: (context, index) {

        return ListTile(
          title: Text('Message $index'), // Replace with your message content

        );
      },
    );
  }
}


class MessageInputField extends StatefulWidget {
  @override
  _MessageInputFieldState createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _isShiftPressed = false;

  void _sendMessage() {
    print('Sending message: ${_controller.text}');
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RawKeyboardListener(
              focusNode: FocusNode(), // This focus node is for listening to key events
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent) {
                  if (event.isShiftPressed) {
                    _isShiftPressed = true;
                  }

                  // Check for Enter key press without Shift
                  if (event.data.logicalKey == LogicalKeyboardKey.enter &&
                      !_isShiftPressed) {
                    _sendMessage();

                  }
                }
                if (event is RawKeyUpEvent) {
                  if (event.data.logicalKey == LogicalKeyboardKey.shiftLeft ||
                      event.data.logicalKey == LogicalKeyboardKey.shiftRight) {
                    _isShiftPressed = false;
                  }
                }
              },
              child: TextField(
                controller: _controller,
                maxLines: 15,
                minLines: 2,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
