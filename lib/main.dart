import 'package:flutter/material.dart';
import 'package:singleton/pages/log_message_page.dart';
import 'package:singleton/pages/show_audit_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "1"),
                Tab(text: "2"),
                Tab(text: "3"),
                Tab(text: "Show audit file"),
              ],
            ),
            title: Text('file audit manager'),
          ),
          body: TabBarView(
            children: [
              LogMessagePage(),
              LogMessagePage(),
              LogMessagePage(),
              ShowAuditFilePage()
            ],
          ),
        ),
      ),
    );
  }
}

/*
Create a Singleton implementation which will write to a common file.
a. Imagine that you wanted to audit all the actions in your application.
b. It would make sense to log that into a file with a guarantee that all
callers will write to the same file.(For each call to the FileAuditManager your code will generate a
timestamp and will write the message entry into the file with a
newline character at the end of each message.)
 */
