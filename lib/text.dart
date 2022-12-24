import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double _angka = 0;
  List<String> _ukuran = ["Kilometer", "Meter"];
  var nilaiAwal;
  var nilaiKonvert;
  double hasil = 0;
// Mufahid
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Panjang')),
      body: Column(
        children: [
          Text('Nilai Awal'),
          TextField(
            onChanged: (text) {
              var bacaAngka = double.tryParse(text);
              if (bacaAngka != null) {
                setState(() {
                  _angka = bacaAngka;
                });
              }
            },
          ),
          DropdownButton(
            value: nilaiAwal,
            items: _ukuran.map((String value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                nilaiAwal = value;
              });
            },
          ),
          Text("Menjadi"),
          DropdownButton(
            value: nilaiKonvert,
            items: _ukuran.map((String value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                nilaiKonvert = value;
              });
            },
          ),
          ElevatedButton(onPressed: () => convert(), child: Text("Ubah")),
          Text(hasil.toString()),
        ],
      ),
    );
  }
// Mufahid
  void convert() {
    setState(() {
      if (nilaiAwal == "kilometer" && nilaiKonvert == 'meter') {
        hasil = _angka * 1000;
      } else if (nilaiAwal == "meter" && nilaiKonvert == 'kilometer') {
        hasil = _angka / 1000;
      } else {
        hasil = _angka;
      }
    });
  }
}
  
// Mufahid