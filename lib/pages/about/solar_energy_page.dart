import 'package:flutter/material.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class SolarEnergyPage extends StatefulWidget {
  const SolarEnergyPage({Key? key}) : super(key: key);

  @override
  State<SolarEnergyPage> createState() => _SolarEnergyPageState();
}

class _SolarEnergyPageState extends State<SolarEnergyPage> {
  final pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(
          "http://www2.aneel.gov.br/aplicacoes/atlas/pdf/03-Energia_Solar(3).pdf")));

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Energia Solar',
      withArrow: true,
      body: Stack(
        children: [
          PdfViewPinch(
            controller: pdfPinchController,
            onDocumentLoaded: (value) => setState(() {
              isLoading = false;
            }),
            onDocumentError: (value) => setState(() {
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
