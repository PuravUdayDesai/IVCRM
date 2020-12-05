import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'show_options.dart';
import 'package:flutter/material.dart';

reportGen(List<List<String>> rep_list, String reportTitle, BuildContext context){
  String p="";
      final pw.Document doc = pw.Document();

  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.BoxBorder(
                    bottom: true, width: 0.5, color: PdfColors.grey)),
            child: pw.Text('Portable Document Format',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text(reportTitle, textScaleFactor: 2)
                    ])),                    
            pw.Table.fromTextArray(context: context, data: rep_list),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            // pw.Image(
            //   pw.AssetImage('Assets/Images/CRM1.jpg'),
            //   PdfImage(
                
            //   ),
            //   fit : pw.BoxFit.contain,
            // ),
            // pw.Container(
            //   height : 100.0,
            //   width : 100.0,
            //   decoration : pw.BoxDecoration(
            //     image : pw.DecorationImage(
            //       fit : pw.BoxFit.contain,
            //       image : pw.AssetImage('Assets/Images/CRM1.jpg')
            //     ),
            //   ),
            // ),
          ]));
      getExternalStorageDirectory().then((Directory d){
          p = d.path+"/report.pdf";
          final File file = File('${p}');
          file.writeAsBytesSync(doc.save());
          print("Report generated");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ShowOptions(p,reportTitle),
            ),
          );
      });
}
      