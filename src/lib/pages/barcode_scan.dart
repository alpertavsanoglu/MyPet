import 'package:flutter/services.dart';
import 'package:myapp/global.dart';
import 'package:myapp/pages/pet_info_page.dart';
import '../utils/app_export.dart';
import "../classes/account.dart";
import "../firebase_operations/FirestoreCommunication.dart";
import "package:firebase_core/firebase_core.dart";

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});

  @override
  State<BarcodeScanPage> createState() => _BarcodeReaderPageState();
}

class _BarcodeReaderPageState extends State<BarcodeScanPage> {
  String? barcodeScanRes;

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version';
    }
    if (!mounted) return;
    setState(() => this.barcodeScanRes = barcodeScanRes);
//31- 40 arası
    // Check if the scanned barcode matches any pet ID
    if (await isPetId(barcodeScanRes)) {
      // Navigate to PetInfoPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetInfoPageScreen(),
        ),
      );
    }
  }

//burdan aşşası 46-51
  // Example function to check if the scanned code is a pet ID
  Future<bool> isPetId(String? code) async {
    String flagFound = "NO";
    // Initialize Firebase
    await Firebase.initializeApp();
    // Create an instance of FirestoreCommunication
    FirestoreCommunication fsc = FirestoreCommunication();
    List<account> UsersData = await fsc.iterateUsers();
    flagFound = fsc.FindOwner(barcodeScanRes,
        UsersData); //Since we do not have barcode number I am passing name and controlling it. Both are strings no problem.
    print(flagFound);
    account data = await fsc.readFromFStore("aaa@gmail.com");
    accFound = account.copy(data);
    if (flagFound != "NO") {
      print("geldi");
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scan'),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: scanBarcodeNormal,
                child: Text(
                  barcodeScanRes == null
                      ? 'Start Barcode scan'
                      : 'Scan Result : $barcodeScanRes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ));
}