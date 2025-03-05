import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:gallery_picker/models/media_file.dart';
import 'package:permission_handler/permission_handler.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<MediaFile> files = [];

  Future<void> _pickMedia() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      List<MediaFile> mediafiles = await GalleryPicker.pickMedia(
          context: context,
          singleMedia: false
      ) ?? [];

      setState(() {
        files = mediafiles;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission is required'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: files.length,
        itemBuilder: (BuildContext context, int index) {
          if (files[index].isImage) {
            return ImageProvider(media:files[index]);
          } else if (files[index].isVideo) {
            return VideoProvider(media:files[index]);}
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickMedia,
        child: Icon(Icons.image),
      ),
    );
  }
}
