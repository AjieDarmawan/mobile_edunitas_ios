part of 'inboxPages.dart';

class MessageDetail extends StatefulWidget {
  final String konten, keterangan, sender;

  MessageDetail({
    this.konten,
    this.keterangan,
    this.sender,
  });

  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Inbox",
          style: whiteFontStyle,
        ),
        backgroundColor: mainColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Html(
                data: widget.konten.toString(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: yellowColor,
              ),
              height: 32,
              width: 200,
              child: Center(
                child: Text(
                  widget.sender.isEmpty ? "eduNitas" : widget.sender,
                  style: blueFontStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
