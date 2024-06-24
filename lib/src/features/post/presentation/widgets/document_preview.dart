import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:pdfx/pdfx.dart';

class DocumentPreview extends StatefulWidget {
  const DocumentPreview({
    this.docUrl,
    this.docFile,
    super.key,
  });

  final String? docUrl;
  final File? docFile;

  @override
  State<DocumentPreview> createState() => _DocumentPreviewState();
}

class _DocumentPreviewState extends State<DocumentPreview> {
  late PdfControllerPinch pdfControllerPinch;
  int totalPageCount = 0;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    if (widget.docFile != null) {
      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openFile(widget.docFile!.path),
      );
    } else if (widget.docUrl != null) {
      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openData(InternetFile.get(widget.docUrl!)),
      );
    }
    pdfControllerPinch.addListener(() {
      setState(() {
        currentPage = pdfControllerPinch.page;
        totalPageCount = pdfControllerPinch.pagesCount ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          PdfViewPinch(
            scrollDirection: Axis.horizontal,
            controller: pdfControllerPinch,
          ),
          Positioned(
            top: 4,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenPdfView(
                      docUrl: widget.docUrl,
                      docFile: widget.docFile,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.fullscreen,
                color: LegalReferralColors.borderGrey199,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenPdfView extends StatefulWidget {
  const FullScreenPdfView({this.docUrl, this.docFile, super.key});

  final String? docUrl;
  final File? docFile;

  @override
  State<FullScreenPdfView> createState() => _FullScreenPdfViewState();
}

class _FullScreenPdfViewState extends State<FullScreenPdfView> {
  late PdfControllerPinch pdfControllerPinch;
  int totalPageCount = 0;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    if (widget.docFile != null) {
      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openFile(widget.docFile!.path),
      );
    } else if (widget.docUrl != null) {
      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openData(InternetFile.get(widget.docUrl!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PDF Viewer',
        ),
        backgroundColor: LegalReferralColors.primaryBackground,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Total Pages: $totalPageCount'),
              IconButton(
                onPressed: () {
                  pdfControllerPinch.previousPage(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.linear,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              Text('Current Page: $currentPage'),
              IconButton(
                onPressed: () {
                  pdfControllerPinch.nextPage(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.linear,
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              ),
            ],
          ),
          Expanded(
            child: PdfViewPinch(
              controller: pdfControllerPinch,
              onDocumentLoaded: (doc) {
                setState(() {
                  totalPageCount = doc.pagesCount;
                });
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
