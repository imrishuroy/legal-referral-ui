// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';

// class MyPdfViewer extends StatefulWidget {
//   final String pdfUrl;
//   MyPdfViewer({@required this.pdfUrl});
//   @override
//   _MyPdfViewerState createState() => _MyPdfViewerState();
// }
// class _MyPdfViewerState extends State<MyPdfViewer> {
//   PDFViewController pdfViewController;
//   int currentPage = 0;
//   int totalPages = 0;
//   bool isReady = false;
//   String errorMessage = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: Stack(
//         children: [
//           PDFView(
//             filePath: null,
//             fitEachPage: true,
//             fitPolicy: FitPolicy.BOTH,
//             onRender: (_pages) {
//               setState(() {
//                 totalPages = _pages;
//               });
//             },
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//             },
//             onPageError: (page, error) {
//               setState(() {
//                 errorMessage = '$error';
//               });
//             },
//             onViewCreated: (PDFViewController vc) {
//               setState(() {
//                 pdfViewController = vc;
//               });
//               _loadPdf();
//             },
//           ),
//           errorMessage.isEmpty
//               ? !isReady
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Container()
//               : Center(
//                   child: Text(errorMessage),
//                 ),
//         ],
//       ),
//     );
//   }
 
// }