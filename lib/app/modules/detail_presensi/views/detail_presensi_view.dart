import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_presensi_controller.dart';

class DetailPresensiView extends GetView<DetailPresensiController> {
  final Map<String, dynamic> data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETAIL PRESENSI'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "${DateFormat.yMMMMEEEEd().format(DateTime.parse(data['date']))}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Masuk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    "Jam : ${DateFormat.jms().format(DateTime.parse(data['masuk']!['date']))}"),
                Text(
                    "Posisi : ${data['masuk']!['lat']} , ${data['masuk']!['long']}"),
                Text("Status : ${data['masuk']!['status']}"),
                Text(
                    "Distance : ± ${data['masuk']!['distance'].toString().split(".").first} Meter"),
                Text("Address : ${data['masuk']!['address']}"),
                SizedBox(height: 20),
                Text(
                  "Keluar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(data['keluar']?['date'] == null
                    ? "Jam : -"
                    : "Jam : ${DateFormat.jms().format(DateTime.parse(data['keluar']!['date']))}"),
                Text(data['keluar']?['lat'] == null &&
                        data['keluar']?['long'] == null
                    ? "Posisi : -"
                    : "Posisi : ${data['keluar']!['lat']} , ${data['keluar']!['long']}"),
                Text(data['keluar']?['status'] == null
                    ? "Status : -"
                    : "Status : ${data['keluar']!['status']}"),
                Text(data['keluar']?['distance'] == null
                    ? "Distance : -"
                    : "Distance : ± ${data['keluar']!['distance'].toString().split(".").first} Meter"),
                Text(data['keluar']?['address'] == null
                    ? "Address : -"
                    : "Address : ${data['keluar']!['address']}"),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}
