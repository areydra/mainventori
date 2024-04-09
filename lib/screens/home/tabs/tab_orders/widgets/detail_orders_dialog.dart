import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/daos/orders_list.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DetailOrdersDialog extends StatefulWidget {
  final Order order;
  final Function refreshDataProducts;

  const DetailOrdersDialog({
    Key? key,
    required this.order,
    required this.refreshDataProducts,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailOrdersDialog createState() => _DetailOrdersDialog();
}

class _DetailOrdersDialog extends State<DetailOrdersDialog> {
  final doc = pw.Document();
  final database = AppDatabase();
  List<OrdersListData> ordersList = [];
  FutureOr<Uint8List>? generatedPDF;

  @override
  void initState() {
    super.initState();
    fetchOrderList();
    generatePDF();
  }

  void fetchOrderList() async {
    DaosOrdersListGetItems data =
        await database.ordersListDao.getItems(widget.order.id);

    setState(() {
      ordersList = data.ordersList;
    });
  }

  generatePDF() async {
    DaosOrdersListGetItems data =
        await database.ordersListDao.getItems(widget.order.id);

    doc.addPage(pw.MultiPage(
      build: (context) {
        return [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'MaInventori',
                style: pw.TextStyle(
                  color: PdfColor.fromHex('1570EF'),
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'I N V O I C E',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              )
            ],
          ),
          pw.SizedBox(height: 24),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Table(children: [
                    pw.TableRow(children: [
                      pw.Text(
                        'Diterbitkan atas nama',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 20),
                    ]),
                    pw.TableRow(children: [
                      pw.Row(children: [
                        pw.Text('Penjual'),
                        pw.SizedBox(width: 10),
                        pw.Text(': '),
                        pw.Text(
                          'MaInventori',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ]),
                    ]),
                    pw.TableRow(children: [
                      pw.Text(
                        'dummyspace',
                        style: pw.TextStyle(
                          color: PdfColor.fromHex('#FFF'),
                        ),
                      ),
                    ]),
                  ])
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Table(children: [
                    pw.TableRow(children: [
                      pw.Text(
                        'Untuk',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 20),
                    ]),
                    pw.TableRow(children: [
                      pw.Row(children: [
                        pw.Table(columnWidths: {
                          0: const pw.FixedColumnWidth(110),
                        }, children: [
                          pw.TableRow(children: [
                            pw.Text('Pembeli'),
                            pw.Text(
                              ': ${widget.order.customer}',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ])
                        ]),
                      ]),
                    ]),
                    pw.TableRow(children: [
                      pw.Row(children: [
                        pw.Table(columnWidths: {
                          0: const pw.FixedColumnWidth(110),
                        }, children: [
                          pw.TableRow(children: [
                            pw.Text('Tanggal pembelian'),
                            pw.Text(
                              ': ${DateFormat('dd MMMM yyyy').format(widget.order.deliveryDate)}',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ])
                        ]),
                      ]),
                    ]),
                  ]),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 24),
          pw.Container(
            width: double.infinity,
            color: PdfColor.fromHex('#0f0f0f'),
            height: 1,
          ),
          pw.SizedBox(height: 14),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    'INFO PRODUK',
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                ),
                pw.SizedBox(
                  width: 100,
                  child: pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Text(
                      'JUMLAH',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 100,
                  child: pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Text(
                      'HARGA SATUAN',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                pw.SizedBox(
                  width: 100,
                  child: pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Text(
                      'TOTAL HARGA',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ]),
          pw.SizedBox(height: 14),
          pw.Container(
            width: double.infinity,
            color: PdfColor.fromHex('#0f0f0f'),
            height: 1,
          ),
          pw.SizedBox(height: 10),
          pw.ListView.builder(
            itemCount: data.ordersList.length,
            itemBuilder: ((context, index) {
              return pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Expanded(
                        child: pw.Text(
                          data.ordersList[index].productName,
                        ),
                      ),
                      pw.SizedBox(
                        width: 100,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            data.ordersList[index].quantity.toString(),
                          ),
                        ),
                      ),
                      pw.SizedBox(
                        width: 100,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            'Rp${NumberFormat.decimalPattern('id').format(data.ordersList[index].sellingPrice)}',
                          ),
                        ),
                      ),
                      pw.SizedBox(
                        width: 100,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            'Rp${NumberFormat.decimalPattern('id').format((data.ordersList[index].sellingPrice * data.ordersList[index].quantity))}',
                          ),
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: double.infinity,
                    color: PdfColor.fromHex('#d0d3d9'),
                    height: 0.5,
                  ),
                  pw.SizedBox(height: 10),
                ],
              );
            }),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.SizedBox(
                width: 200,
                child: pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text(
                    'TOTAL BELANJA (${widget.order.totalOrdersQuantity} BARANG)',
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold),
                  ),
                ),
              ),
              pw.SizedBox(
                width: 100,
                child: pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text(
                    'Rp${NumberFormat.decimalPattern('id').format(widget.order.totalOrdersSellingPrice)}',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ];
      },
    ));

    setState(() {
      generatedPDF = doc.save();
    });
  }

  onPressSavePdf() async {
    if (generatedPDF == null) {
      return;
    }

    final dir = await getDownloadsDirectory();

    if (dir == null) {
      return;
    }

    final fileName =
        'Invoice_MaInventori_${widget.order.customer}_${DateFormat('dd MMMM yyyy').format(widget.order.deliveryDate)}.pdf';
    final file = File('${dir.path}/$fileName');

    await file.writeAsBytes(await generatedPDF!);

    SmartDialog.dismiss();
    SmartDialog.showToast(
      'Invoice telah disimpan dalam folder Downloads dengan nama $fileName',
      displayTime: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 1000,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: 800,
            height: 950,
            child: Visibility(
              visible: generatedPDF != null,
              child: PdfPreview(
                build: (format) => generatedPDF as FutureOr<Uint8List>,
                allowSharing: false,
                allowPrinting: false,
                canChangeOrientation: false,
                canChangePageFormat: false,
                initialPageFormat: PdfPageFormat.a4,
                pdfFileName: "Invoice_MaInventori_${widget.order.customer}.pdf",
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 150,
                  child: Button(
                    onPress: () => {SmartDialog.dismiss()},
                    text: 'Tutup',
                    backgroundColor: Colors.white,
                    borderColor: const Color.fromRGBO(133, 141, 157, 1),
                    textColor: const Color.fromRGBO(133, 141, 157, 1),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 150,
                  child: Button(
                    text: 'Download PDF',
                    textColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(225, 131, 8, 1),
                    onPress: onPressSavePdf,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
