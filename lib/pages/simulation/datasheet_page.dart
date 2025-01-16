import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class DatasheetPage extends StatefulWidget {
  const DatasheetPage({Key? key}) : super(key: key);

  @override
  State<DatasheetPage> createState() => _DatasheetPageState();
}

class _DatasheetPageState extends State<DatasheetPage> {
  final pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(Get.arguments)));

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Datasheet',
      withArrow: true,
      body: Stack(
        children: [
          PdfViewPinch(
            controller: pdfPinchController,
            onDocumentLoaded: (value) => setState(() {
              isLoading = false;
            }),
          ),
          if (isLoading)
            Center(
              child: CustomLoading(
                size: 30,
              ),
            )
        ],
      ),
    );
  }
}
