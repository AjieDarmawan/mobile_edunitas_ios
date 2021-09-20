part of 'inboxPages.dart';

class NoMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Opacity(
            opacity: 0.9,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/noMessagexhdpi.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                child: Text(
                  "Mohon Maaf !",
                  textAlign: TextAlign.center,
                  style: blueFontStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: Text(
                  "Saat ini kamu tidak memiliki pesan.",
                  textAlign: TextAlign.center,
                  style: blackFontStyle1.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
