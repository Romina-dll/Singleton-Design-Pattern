import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../file_manager.dart';

//the logMessagePage is a stateful widget that allows the user to log messages.
class LogMessagePage extends StatefulWidget{
  const LogMessagePage({Key? key}) : super(key: key);

  @override
  State<LogMessagePage> createState() {
    // TODO: implement createState
    return _LogMessagePage();
  }
}

class _LogMessagePage extends State<LogMessagePage>{
  //A TextEditingController to control the text field that accepts the message
  final TextEditingController _controller = TextEditingController();

  //The _logMessage method logs a message to a file by calling the logMessage method of the FiledAuditManager
  //After logging the message, it clears the text field
  void _logMessage() async {
    await FileAuditManager().logeMessage(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter message'
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: _logMessage,
                child: Text('Log Message')
            )
          ],
        ),
      ),
    );
  }
}