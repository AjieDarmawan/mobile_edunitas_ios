part of 'widget_home.dart';

class ListProdi extends StatefulWidget {
  ListProdi({Key key}) : super(key: key);

  @override
  _ListProdi createState() => _ListProdi();
}

class _ListProdi extends State<ListProdi> {
  //var gabs = ApiMessage.getData;
  ScrollController _controller;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {//you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {//you can do anything here
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: mainColor1,
        title: Text("Prodi"),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: (MediaQuery.of(context).size.width)-(MediaQuery.of(context).size.width/5),
                  child: Card(
                    color: mainColor1,
                    child: Center(
                      child: Text("Nama Prodi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    borderOnForeground: true,
                    elevation: 10,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("S1 - Akuntansi", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
                                Divider(thickness: 1,),
                                Row(
                                  children: [
                                    Icon(Icons.school, color: Colors.yellow,),
                                    SizedBox(width: 10,),
                                    Text("Gelar lulusan S.E. (Sarjana Ekonomi)", style: TextStyle(color: mainColor1),)
                                  ],
                                ),
                                Divider(thickness: 1,),
                                Text("Kampus Penyelenggara", style: TextStyle(color: mainColor1, fontSize: 10)),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 7,
                                    itemBuilder: (context, index){
                                      return Container(
                                        width: 50,
                                        height: 50,
                                        child: Card(
                                          borderOnForeground: true,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                )
              ],
            );
          }),
    );
  }
}

class ApiProdi {
  static final getData = [
    {
      'list_prodi': 'Akuntansi',
      'data': [
        {
          'prodi_name': 'S1-Akuntansi',
          'gelar': 'S.E. (Sarjana Ekonomi)',
          'list_kampus': [
            {
              'nama_nama': 'Polnas',
              'img':''
            },
            {
              'nama_nama': 'Polnas2',
              'img':''
            },
            {
              'nama_nama': 'Polnas3',
              'img':''
            },
            {
              'nama_nama': 'Polnas4',
              'img':''
            },
          ]
        },
        {
          'prodi_name': 'S2-Akuntansi',
          'gelar': 'M.E. (Magister Ekonomi)',
          'list_kampus': [
            {
              'nama_nama': 'Polnas',
              'img':''
            },
            {
              'nama_nama': 'Polnas2',
              'img':''
            },
            {
              'nama_nama': 'Polnas3',
              'img':''
            },
            {
              'nama_nama': 'Polnas4',
              'img':''
            },
          ]
        }
      ]
    },
    {
      'list_prodi': 'Teknik Informatika',
      'data': [
        {
          'prodi_name': 'S1-Teknik Informatika',
          'gelar': 'S.T. (Sarjana Teknik)',
          'list_kampus': [
            {
              'nama_nama': 'Polnas',
              'img':''
            },
            {
              'nama_nama': 'Polnas2',
              'img':''
            },
            {
              'nama_nama': 'Polnas3',
              'img':''
            },
            {
              'nama_nama': 'Polnas4',
              'img':''
            },
          ]
        }
      ]
    },
    {
      'list_prodi': 'Manajemen',
      'data': [
        {
          'prodi_name': 'S1-Manajemen',
          'gelar': 'S.Mn. (Sarjana Manajemen)',
          'list_kampus': [
            {
              'nama_nama': 'Polnas',
              'img':''
            },
            {
              'nama_nama': 'Polnas2',
              'img':''
            },
          ]
        }
      ]
    },
  ];
}

