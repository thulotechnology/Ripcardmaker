import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:rip_card_maker/template/template2.dart';
import 'package:share/share.dart';

class FinalCard extends StatefulWidget {
  final TemplateData templateData;
  final int index;

  const FinalCard({required this.templateData, required this.index, Key? key})
      : super(key: key);

  @override
  State<FinalCard> createState() => _FinalCardState();
}

class _FinalCardState extends State<FinalCard> {
  final GlobalKey _cardKey = GlobalKey();

  Future<Uint8List> _captureCard() async {
    RenderRepaintBoundary boundary =
        _cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  void _saveToGallery() async {
    Uint8List bytes = await _captureCard();
    await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
    ScaffoldMessenger.of(_cardKey.currentContext!).showSnackBar(
      const SnackBar(content: Text('Image saved to gallery')),
    );
  }

  void _shareCard() async {
    Uint8List bytes = await _captureCard();
    await Share.shareFiles(['data:image/png;base64,${base64Encode(bytes)}'],
        text: 'Check out my memorial card!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Card"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              key: _cardKey,
              child: Column(
                children: [Text('Name: ${widget.templateData.latePerson}'),
            Text('Birth Date: ${widget.templateData.dob}'),
            Text('Death Date: ${widget.templateData.dod}'),
            Text('Description: ${widget.templateData.desc}'),
                  Container(
                    height: 400,
                    child: widget.templateData.widget,
                  ),
                ],
              ),
            ),
            // widget.templateData.image != null
            //     ? ClipOval(
            //         child: Image.memory(
            //           Uint8List.fromList(widget.templateData.image!.codeUnits),
            //           fit: BoxFit.cover,
            //           width: 100,
            //           height: 100,
            //         ),
            //       )
            //     : SizedBox.shrink(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _shareCard,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(202, 166, 223, 235),
                            Color.fromARGB(255, 173, 246, 176),
                            Color.fromARGB(255, 143, 194, 235)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.share,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _saveToGallery,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(202, 166, 223, 235),
                            Color.fromARGB(255, 173, 246, 176),
                            Color.fromARGB(255, 143, 194, 235)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.download_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                // Expanded(
                //   child: GestureDetector(
                //     onTap: _addToFavorites,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(vertical: 10),
                //       decoration: const BoxDecoration(
                //         gradient: LinearGradient(
                //           colors: [
                //             Color.fromARGB(202, 166, 223, 235),
                //             Color.fromARGB(255, 173, 246, 176),
                //             Color.fromARGB(255, 143, 194, 235)
                //           ],
                //           begin: Alignment.topLeft,
                //           end: Alignment.bottomRight,
                //         ),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey,
                //             spreadRadius: 3,
                //             blurRadius: 5,
                //             offset: Offset(3, 5),
                //           ),
                //         ],
                //       ),
                //       child: Icon(
                //         Icons.favorite,
                //         size: 30,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

