import 'package:flutter/material.dart';
import 'package:hardware/camera/controller.dart';
import 'package:hardware/components/drawer.dart';

class CameraView extends StatelessWidget {
  CameraView({Key? key}) : super(key: key);
  final controller = CameraController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Câmera'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.acessCam();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
              IconButton(
                onPressed: () {
                  controller.acessGaleryMultipleImage();
                },
                icon: const Icon(Icons.photo_library),
              ),
              IconButton(
                onPressed: () {
                  controller.acessGalery();
                },
                icon: const Icon(Icons.photo_sharp),
              )
            ],
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (_ctx, _child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: controller.listImages.length,
                  itemBuilder: (_ctx, i) {
                    final img = controller.listImages[i];

                    return Image.file(img);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
