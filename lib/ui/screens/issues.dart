import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Issues extends StatefulWidget {
  @override
  _IssuesState createState() => _IssuesState();
}

class _IssuesState extends State<Issues> {
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  bool mapToggle = false;
  var currentLocation;
  var clients = [];
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
        populateClients();
      });
    });
  }

  populateClients() {
    clients = [];
    Firestore.instance.collection("markers").getDocuments().then((docs) {
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; ++i) {
          clients.add(docs.documents[i].data);
          initMarker(docs.documents[i].data);
        }
      }
    });
  }

  initMarker(client) {
    _markers.add(Marker(
      markerId: null,
      position: LatLng(-25.393361,
          28.262144), //client['Location'].latitude, client['Location'].longitude
      draggable: false,
      infoWindow: InfoWindow(title: "$client['Eskom'], 'Nice'"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('Find Eskom'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height - 80.0,
                  width: double.infinity,
                  child: mapToggle
                      ? GoogleMap(
                          mapToolbarEnabled: true,
                          mapType: MapType.normal,
                          onMapCreated: onMapCreated,
                          // myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          compassEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(currentLocation.latitude,
                                  currentLocation.longitude),
                              zoom: 14.0),
                          markers: _markers,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                  child: SpinKitCircle(
                                color: Colors.black,
                                size: 60.0,
                              )),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text("Please wait a moment...!!!",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
              Positioned(
                top: 50.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 10,
                            spreadRadius: 3)
                      ]),
                  child: TextField(
                    cursorColor: Colors.black,
                    //controller: locationController,
                    decoration: InputDecoration(
                        icon: Container(
                          margin: EdgeInsets.only(left: 20, top: 5),
                          width: 10,
                          height: 10,
                          child: Icon(
                            Icons.my_location,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "My location",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 16.0)),
                  ),
                ),
              ),
              Positioned(
                top: 105.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 10,
                            spreadRadius: 3)
                      ]),
                  child: TextField(
                    cursorColor: Colors.black,
                    //controller: locationController,
                    decoration: InputDecoration(
                        icon: Container(
                          margin: EdgeInsets.only(left: 20, top: 5),
                          width: 10,
                          height: 10,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter location",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 16.0)),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  // void _onCameraMove(CameraPosition position) {
  //   setState(() {
  //     _lastPosition = position.target;
  //   });
  // }

  // void _onAddMarkerPressed() {
  //   setState(() {
  //     _markers.add(Marker(markerId: MarkerId(_lastPosition.toString()),
  //     position: _lastPosition,
  //     infoWindow: InfoWindow(
  //       title: "we're here",
  //       snippet: "yes we are"
  //     ),
  //     icon: BitmapDescriptor.defaultMarker));
  //   });
  // }

}
