import 'package:app/const/kMaterial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LaundryQRCode extends StatelessWidget {
  const LaundryQRCode({Key? key, required this.code}) : super(key: key);

  final String code;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "QR Code",
        style: GoogleFonts.roboto(
          fontSize: 14.0,
          color: kDark,
        ),
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        splashRadius: 20.0,
        icon: const Icon(
          AntDesign.arrowleft,
          color: kDark,
        ),
      ),
      backgroundColor: kWhite,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: kDark.withOpacity(0.2),
          width: 0.5,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: kWhite,
      appBar: appBar,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: 250,
              child: Text(
                "Download the Rider Mobile  \nApplication from our official website\nlaundrynaa.cdo and scan the provided QR Code below",
                style: GoogleFonts.roboto(
                  fontSize: 12.0,
                  color: kDark.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Hero(
              tag: code,
              child: ClipRRect(
                borderRadius: kDefaultRadius,
                child: QrImage(
                  backgroundColor: kWhite,
                  data: code,
                  version: QrVersions.auto,
                  gapless: true,
                  size: 250,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}