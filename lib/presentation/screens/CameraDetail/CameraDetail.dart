import 'dart:async';
import 'package:flutter/material.dart';
import 'package:traffic_solution_dsc/core/models/camera/camera.dart';

class CameraDetailScreen extends StatefulWidget {
  final Camera cameraData;

  CameraDetailScreen({required this.cameraData});

  @override
  _CameraDetailScreenState createState() => _CameraDetailScreenState();
}

class _CameraDetailScreenState extends State<CameraDetailScreen> {
  late Timer _timer;
  String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    _imageUrl =
        'http://giaothong.hochiminhcity.gov.vn/render/ImageHandler.ashx?id=${widget.cameraData.id}';
    _startImageFetcher();
  }

  void _startImageFetcher() {
    _timer = Timer.periodic(Duration(seconds: 12), (timer) {
      setState(() {
        _imageUrl =
            'http://giaothong.hochiminhcity.gov.vn/render/ImageHandler.ashx?id=${widget.cameraData.id}&&t=${DateTime.now().millisecondsSinceEpoch}';
        print("reset");
        print(_imageUrl);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cameraData.name ?? 'Camera Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Camera Details
            Text(
              'Camera ID: ${widget.cameraData.id}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Location: ${widget.cameraData.location ?? 'Unknown'}'),
            SizedBox(height: 8),
            Text('Angle: ${widget.cameraData.angle}°'),
            SizedBox(height: 8),

            // Live View Image
            Center(
              child: Image.network(
                _imageUrl,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Failed to load live view');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
