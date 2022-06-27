part of 'shared.dart';

const double defaultMargin = 24;

Color blueColor = "#01588E".toColor();
Color blueSecondColor = "#2DCEDE".toColor();
Color mainColor = "#1661D5".toColor();
Color yellowColor = "#FFCE00".toColor();
Color abuColor = "#F1F1F1".toColor();
Color fontmainColor = "#2D364C".toColor();
Color orenColor = "#FFB300".toColor();
Color whiteColor = "#FFFFFF".toColor();
Color blackColor = "#424242".toColor();

Color mainColor1 = Color(0xFF01588E);

TextStyle orenFontStyle = GoogleFonts.montserrat().copyWith(color: orenColor);
TextStyle blueFontStyle = GoogleFonts.montserrat().copyWith(color: blueColor);
TextStyle blueFontStyleBold = GoogleFonts.montserrat()
    .copyWith(color: blueColor, fontWeight: FontWeight.bold);
TextStyle blueFontStyle2Bold = GoogleFonts.montserrat()
    .copyWith(fontSize: 16, color: blueColor, fontWeight: FontWeight.bold);
TextStyle abuFontStyle = GoogleFonts.montserrat().copyWith(color: abuColor);
TextStyle whiteFontStyle = GoogleFonts.montserrat().copyWith(color: whiteColor);

TextStyle blackFontStyle1 = GoogleFonts.montserrat()
    .copyWith(color: blackColor, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.montserrat()
    .copyWith(color: blackColor, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 =
    GoogleFonts.montserrat().copyWith(color: blackColor);
TextStyle blackFontStyle4 =
    GoogleFonts.montserrat().copyWith(color: blackColor, fontSize: 9);

TextStyle blackFontStyle1Bold = GoogleFonts.montserrat()
    .copyWith(color: blackColor, fontSize: 22, fontWeight: FontWeight.bold);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

String emailValidator(String value) {
  //Toast.show(value, context, duration: 3, gravity: Toast.BOTTOM);
  if (value.length == 0) {
    return "Masukan email";
  } else if (!value.contains('@')) {
    return "Email salah";
  } else {
    return null;
  }
}

String nameValidator(String value) {
  if (value.length < 4) {
    return "Tidak boleh kosong";
  } else {
    return null;
  }
}

String baruValidator(String value) {
  if (value.length < 1) {
    return "Tidak boleh kosong";
  } else {
    return null;
  }
}

String noZeroNumberValidator(String value) {
  if (value == "0") {
    return "Tidak boleh kosong";
  } else {
    return null;
  }
}

String teleponValidator(String value) {
  String fchar = value != null || value != "" ? value.substring(0, 1) : "0";
  if (value.length < 10) {
    return "Nomor salah, gunakan lebih dari 10 angka";
  } else if (fchar != '8') {
    return "Masukan nomor tanpa angka 0";
  } else {
    return null;
  }
}

String waValidator(String value) {
  String fchar = value != null || value != "" ? value.substring(0, 1) : "0";
  if (value.length < 10) {
    return "Nomor salah, gunakan lebih dari 10 angka";
  } else if (fchar != '8') {
    return "Masukan nomor tanpa angka 0";
  } else {
    return null;
  }
}

String nomianl2Validator(String value) {
  if (value.length < 2) {
    return "Nomor salah, gunakan lebih dari 2 angka";
  } else {
    return null;
  }
}

String activasiValidator(String value) {
  if (value.length < 5) {
    return "Harus lebih dari 6 karakter";
  } else {
    return null;
  }
}

bool _isHidePassword = true;

class EduButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String buttonText;
  final int textSize;
  final Color buttonColor, textColor;
  EduButton(
      {@required this.onPressed,
      this.buttonText,
      this.textSize,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? yellowColor,
        shape: StadiumBorder(),
      ),
      child: Center(
        child: Text(
          buttonText ?? 'Click',
          maxLines: 1,
          style: blueFontStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: textSize ?? 14,
              color: textColor ?? mainColor1),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class EduButtonSecond extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String buttonText;
  final int textSize;

  EduButtonSecond({@required this.onPressed, this.buttonText, this.textSize});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(width: 2.0, color: yellowColor),
        shape: StadiumBorder(),
      ),
      child: Center(
        child: Text(
          buttonText ?? 'Click',
          maxLines: 1,
          style: blueFontStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: textSize ?? 14),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class EduButtonSecondIcon extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  EduButtonSecondIcon(
      {@required this.onPressed, this.icon, this.iconColor, this.iconSize});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(width: 2.0, color: yellowColor),
        shape: StadiumBorder(),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      onPressed: onPressed,
    );
  }
}

Widget ErrorDataHandler(context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 250,
          child: Image.asset('assets/noTransactionxhdpi.png'),
        ),
        SizedBox(
          height: 48.0,
        ),
        Text(
          'Terjadi Kesalahan',
          style: blueFontStyleBold.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          'Silahkan ulangi beberapa saat lagi.',
          style: blackFontStyle3,
        ),
      ],
    ),
  );
}
