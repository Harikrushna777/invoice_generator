import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../modals/global.dart';

class bill_pdf_page extends StatefulWidget {
  const bill_pdf_page({Key? key}) : super(key: key);

  @override
  State<bill_pdf_page> createState() => _bill_pdf_pageState();
}

class _bill_pdf_pageState extends State<bill_pdf_page> {
  pw.Document pdf = pw.Document();

  generatePdf() async {
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Container(
          height: double.infinity,
          width: double.infinity,
          alignment: pw.Alignment.center,
          decoration: const pw.BoxDecoration(
            color: PdfColors.white,
          ),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Container(
                padding: pw.EdgeInsets.all(10),
                width: 200,
                alignment: pw.Alignment.center,
                decoration: pw.BoxDecoration(
                  color: PdfColors.purple,
                  borderRadius: pw.BorderRadius.only(
                      topRight: pw.Radius.circular(30),
                      bottomRight: pw.Radius.circular(30)),
                ),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.SizedBox(
                      height: 20,
                    ),
                    pw.Container(
                      height: 150,
                      width: 150,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        image: pw.DecorationImage(
                          image: pw.MemoryImage(
                            File(Global.image!.path).readAsBytesSync(),
                          ),
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      height: 20,
                    ),
                    pw.Text(
                      "Contact",
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Divider(
                      color: PdfColors.white,
                      thickness: 2,
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.SizedBox(
                      child: pw.Column(
                        children: [
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                "Name :",
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 14,
                                  color: PdfColors.white,
                                ),
                              ),
                              pw.Text(
                                Global.name!,
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.white,
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                "Contact :",
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "+91 ${Global.contact!.toString()}",
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "Education",
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Divider(
                      color: PdfColors.white,
                      thickness: 2,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      // children: [
                      //   pw.Text(
                      //     "Year : ${Global.passOutYear}",
                      //     style: pw.TextStyle(
                      //       color: PdfColors.white,
                      //       fontSize: 14,
                      //       fontWeight: pw.FontWeight.bold,
                      //     ),
                      //   )
                      // ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    generatePdf();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "User Bill",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => pdf.save(),
      ),
    );
  }
}
