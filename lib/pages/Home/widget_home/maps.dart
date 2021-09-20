part of 'widget_home.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  String position;
  //List<Wisata> potsList = [];
  double nLat = -6.307612065268697;
  double nLong = 106.8271279335022;
  LatLng myPostion;
  CameraPosition _kGooglePlex;
  dynamic gab;

  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  // get Current Location
  void getCurrentLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    try {
      setState(() {
        nLat = currentLocation.latitude;
        nLong = currentLocation.longitude;
        myPostion = LatLng(nLat, nLong);
        print("Lat : ${currentLocation.latitude}");
        print("Lon : ${currentLocation.longitude}");

        ///
        // Next Function add to marker
        mapsCamera();
      });
    } on Exception {
      print("Null");
    }
  }

  // Set Camera
  void mapsCamera() {
    LatLng _center = LatLng(nLat, nLong);
    LatLng _lastPosition = _center;
    _kGooglePlex = CameraPosition(target: LatLng(nLat, nLong), zoom: 14.4746);
    final CameraPosition _kLake = CameraPosition(
        bearing: 30,
        target: LatLng(nLat, nLong),
        tilt: 59.440717697143555,
        zoom: 16);
    _goToTheLake(_kLake);
    _onAddMarkerButtonPressed(_lastPosition);
  }

  Future<void> _goToTheLake(CameraPosition _kLake) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void _onAddMarkerButtonPressed(LatLng lastPosition) {
    setState(() {
      _markers.add(Marker(
        //This marker id can be anything that uniquely identifier each marker.
        markerId: MarkerId(lastPosition.toString()),
        position: lastPosition,
      ));
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _kGooglePlex = CameraPosition(target: LatLng(nLat, nLong), zoom: 14.4746);
  //   getCurrentLocation();
  // }

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(target: LatLng(nLat, nLong), zoom: 14.4746);
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "DETAILS",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Roboto', fontSize: 20),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 2000.0,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                    ),
                  ),
                ],
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "Posisi Anda Saat ini",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: GoogleMap(
                                    mapType: MapType.normal,
                                    initialCameraPosition: _kGooglePlex == null
                                        ? ""
                                        : _kGooglePlex,
                                    markers: _markers,
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      _controller.complete(controller);
                                      _onAddMarkerButtonPressed(myPostion);
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _getLocation,
//        tooltip: 'Get Location',
//        child: Icon(Icons.flag),
//      ),
    );
  }
}
