import 'package:flutter/material.dart';
import 'view_pdf.dart';
import 'package:flutter_share/flutter_share.dart';

class ShowOptions extends StatelessWidget {
  String pdfPath;
  String reportTitle;
  ShowOptions(this.pdfPath,this.reportTitle);

  Future<void> shareFile() async {
    await FlutterShare.shareFile(
      title: reportTitle,
      text: 'Checkout the '+reportTitle,
      filePath: pdfPath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report Options"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PdfViewerPage(path: pdfPath),
                      ),
                    ); 
                  },
                  child: Container(
                    width: 165,
                    height: 180,
                    child: Column(children: <Widget>[
                      Center(
                          child: Text('View report',
                              textScaleFactor: 2.0,
                              textAlign: TextAlign.center)),
                      SizedBox(height: 15),
                      Expanded(
                        child : Container(
                        color: Colors.amber[100],
                        child: Icon(Icons.visibility, size: 40.0),
                      )
                      ),
                      
                    ]),
                    padding: EdgeInsets.all(25.0),
                  ),
                ),
                elevation: 5.0,
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.pink.withAlpha(200),
                  onTap: () {
                    print("Tapped on share");
                    shareFile();
                  },
                  child: Container(
                    width: 165,
                    height: 180,
                    child: Column(children: <Widget>[
                      Center(
                          child: Text('Share report',
                              textScaleFactor: 2.0,
                              textAlign: TextAlign.center)),
                      SizedBox(height: 15),
                      Expanded(
                        child : Container(
                        color: Colors.green[100],
                        child: Icon(Icons.share, size: 40.0),
                      )
                      ),
                      
                    ]),
                    padding: EdgeInsets.all(25.0),
                  ),
                ),
                elevation: 5.0,
              ),
            ],
          ),
        ),
      );    
  }
}

