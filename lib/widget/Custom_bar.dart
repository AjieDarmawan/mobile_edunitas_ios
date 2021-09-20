part of 'widget.dart';

class CustomTabar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabar({
    this.selectedIndex,
    @required this.titles,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 48),
            height: 1,
            // color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: defaultMargin, top: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (onTap != null) {
                                  onTap(titles.indexOf(e));
                                }
                              },
                              child: Text(e,
                                  style: (titles.indexOf(e) == selectedIndex)
                                      ? blackFontStyle3.copyWith(
                                          fontWeight: FontWeight.w500)
                                      : blueFontStyle)),
//                          SizedBox(
//                            height: 14,
//                          ),
                          Container(
                            width: 60,
                            height: 3,
                            margin: EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: (titles.indexOf(e) == selectedIndex)
                                  ? "020202".toColor()
                                  : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
