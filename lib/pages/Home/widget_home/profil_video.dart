// part of 'widget_home.dart';


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eduNitas/model/Campus/PhotoModel.dart';
import 'package:http/http.dart' as http;
class PhotosListScreen extends StatefulWidget {
  PhotosListScreen({Key key}) : super(key: key);

  @override
  _PhotosListScreenState createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  bool _hasMore;
  int _pageNumber;
  bool _error;
  bool _loading;
  final int _defaultPhotosPerPageCount = 10;
  List<Photo> _photos;
  final int _nextPageThreshold = 5;

  Future<void> fetchPhotos() async {
    try {
      final response = await http.get(
          Uri.parse("https://dev-api.edunitas.com/list_campus?page=$_pageNumber"));
      List<Photo> fetchedPhotos = Photo.parseList(json.decode(response.body));
          //final fetchedPhotos = PhotoModel(response.body);

      setState(() {
        _hasMore = fetchedPhotos.length == _defaultPhotosPerPageCount;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _photos.addAll(fetchedPhotos);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }


  

  @override
  void initState() {
    super.initState();
    _hasMore = true;
    _pageNumber = 1;
    _error = false;
    _loading = true;
    _photos = [];
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campus 1")),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (_photos.isEmpty) {
      if (_loading) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              fetchPhotos();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Error while loading photos, tap to try agin"),
          ),
        ));
      }
    } else {
      return ListView.builder(
          itemCount: _photos.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _photos.length - _nextPageThreshold) {
              fetchPhotos();
            }
            if (index == _photos.length) {
              if (_error) {
                return Center(
                    child: InkWell(
                  onTap: () {
                    setState(() {
                      _loading = true;
                      _error = false;
                      fetchPhotos();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Error while loading photos, tap to try agin"),
                  ),
                ));
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(),
                ));
              }
            }
            final Photo photo = _photos[index];
            return Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    photo.cover,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(photo.nama,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            );
          });
    }
    return Container();
  }

  
}

