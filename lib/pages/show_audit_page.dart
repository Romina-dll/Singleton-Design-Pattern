import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singleton/file_manager.dart';

// the widget displays the contents of the audit file.
class ShowAuditFilePage extends StatefulWidget {
  const ShowAuditFilePage({Key? key}) : super (key: key);

  @override
  State<ShowAuditFilePage> createState() {
    // TODO: implement createState
    return _ShowAuditFilePage();
  }
}

class _ShowAuditFilePage extends State<ShowAuditFilePage>{
  //the content and filePath variables store the contents and file path of the audit file.
  String content = 'Loading...';
  String filePath = 'Loading...';

  @override
  void initState(){
    super.initState();
    loadFileData();
  }

  void loadFileData() async{
    String contentData = await FileAuditManager().readContent();
    String filePathData = await FileAuditManager().getFilePath();
    setState(() {
      content = contentData;
      filePath = filePathData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 16,
          top: 16,
          bottom: 16
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File path: $filePath',style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Text('File Content: \n$content',style: const TextStyle(fontSize: 10),),

              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: loadFileData,
                child: Text('Refresh'),
              ),
            )
          ],
        ),
      ),
    );
  }
}