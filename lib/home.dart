import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController catatanController = TextEditingController();

    void saveCatatan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('note', catatanController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil Menyimpan Data'),
      ),
    );
  }

  void readCatatan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      catatanController.text = prefs.getString('note') ?? '';
    });
  }

  @override
  void initState() {
    readCatatan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Catatan Rahasia"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: catatanController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Masukkan Catatan Rahasia',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    saveCatatan();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 18),
                  ),
                  
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: const Text(
                    "Tutup Catatan Rahasia",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
