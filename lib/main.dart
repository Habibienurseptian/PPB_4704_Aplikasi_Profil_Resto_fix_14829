import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Restaurant Mars';
    biodata['email'] = 'MarsRes@gmail.com';
    biodata['phone'] = '+62345678910';
    biodata['image'] = '1.jpg';
    biodata['menu'] = 'Soto Ayam, Pecel Lele';
    biodata['addr'] = 'St. Mars in Milky way';
    biodata['waktu'] = '09.00 - 21.00';
    biodata['location'] = 'https://maps.app.goo.gl/LbTdBiNqgp89uWe57';
    biodata['desc'] =
        "'Restoran ini menyajikan sarapan, makan siang, dan makan malam. Makanan di restoran ini enak dan para pelayannya sopan. Restoran makanan lautnya mengkhususkan diri dalam menyajikan ikan dan kerang.'";
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Colors.black, biodata['name'] ?? ''),
              SizedBox(
                height: 10,
              ),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  btnContact(Icons.email_sharp, Colors.green[900],
                      "mailto:${biodata['email'] ?? 'Tanya Seputar Resto'}"),
                  btnContact(Icons.phone, Colors.blueAccent,
                      "tel:${biodata['phone'] ?? ''}"),
                  btnContact(Icons.location_pin, Colors.deepPurple,
                      "loc:${biodata['location'] ?? ''}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(
                height: 10,
              ),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              teksKotak(Colors.black38, 'List Menu'),
              textAttribute('List Menu', biodata['menu'] ?? ''),
              teksKotak(Colors.black38, 'Alamat'),
              textAttribute('Alamat', biodata['addr'] ?? ''),
              teksKotak(Colors.black38, 'Jam Buka'),
              textAttribute('Jam Buka', biodata['waktu'] ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

Expanded btnContact(IconData icon, var color, String uri) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () {
        launch(uri);
      },
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: color,
          foregroundColor: Colors.white),
    ),
  );
}

Row textAttribute(String judul, String teks) {
  return Row(
    children: [
      Container(
        width: 105,
        child: Text(
          ' $judul ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      Text(
        ': ',
        style: TextStyle(fontSize: 18),
      ),
      Text(
        teks,
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}

Container teksKotak(Color bgColor, String teks) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    width: double.infinity,
    decoration: BoxDecoration(color: bgColor),
    child: Text(
      teks,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}

Future launch(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Tidak dapat memanggil : $uri');
  }
}
