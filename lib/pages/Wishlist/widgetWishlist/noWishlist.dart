part of 'widgetWishlist.dart';

class NoWishlist extends StatelessWidget {
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
                  image: AssetImage('assets/noWishlistxhdpi.png'),
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
                width: 250,
                child: Text(
                  "Saat ini belum ada daftar kampus yang kamu favoritkan",
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
