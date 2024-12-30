import 'package:flutter/material.dart';

class UretimTakipScreen extends StatefulWidget {
  const UretimTakipScreen({Key? key}) : super(key: key);

  @override
  _UretimTakipScreenState createState() => _UretimTakipScreenState();
}

class _UretimTakipScreenState extends State<UretimTakipScreen> {
  final TextEditingController qrController1 = TextEditingController();
  final TextEditingController qrController2 = TextEditingController();
  final TextEditingController qrController3 = TextEditingController();

  bool qr1Filled = false;
  bool qr2Filled = false;
  bool qr3Filled = false;

  @override
  void dispose() {
    qrController1.dispose();
    qrController2.dispose();
    qrController3.dispose();
    super.dispose();
  }

  void onQrCodeScanned(String qrCode, int index) {
    setState(() {
      if (index == 1) {
        qrController1.text = qrCode;
        qr1Filled = true;
      } else if (index == 2) {
        qrController2.text = qrCode;
        qr2Filled = true;
      } else if (index == 3) {
        qrController3.text = qrCode;
        qr3Filled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üretim Takip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQrInputField(qrController1, qr1Filled, 1),
                _buildQrInputField(qrController2, qr2Filled, 2),
                _buildQrInputField(qrController3, qr3Filled, 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrInputField(
      TextEditingController controller, bool isFilled, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'QR Kodu $index',
            filled: true,
            fillColor: isFilled ? Colors.green[100] : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onTap: () async {
            // Simulate QR code scanning
            String scannedCode = await simulateQrCodeScanning();
            onQrCodeScanned(scannedCode, index);
          },
        ),
      ),
    );
  }

  Future<String> simulateQrCodeScanning() async {
    // Simulate a delay for QR code scanning
    await Future.delayed(const Duration(seconds: 2));
    return 'QR12345';
  }
}
