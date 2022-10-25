import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate() async {
    final pdf = Document();
    pdf.addPage(Page(
        build: (context) => Center(
            child: Text("My First PDF", style: TextStyle(fontSize: 48)))));

    return saveDocument(name: 'first.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {String name = 'generatedPdf.pdf', required Document pdf}) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = await File('${dir.path}/${name}');

    file.writeAsBytes(bytes);

    return file;
  }
}
