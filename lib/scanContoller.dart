//
// import 'dart:math';
//
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_tflite/flutter_tflite.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
// class ScanContoller extends GetxController{
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     initCamera();
//     initTflite();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     cameraController.dispose();
//   }
//   late CameraController cameraController;
//   late List<CameraDescription> cameras;
//   var isCameraInitialized=false.obs;
//   var cameraCount=0;
//    List<dynamic> _recognitions=[];
//   // final cameraPreview = Transform.scale(
//   //   scale: cameraController.value.aspectRatio / deviceRatio,
//   //   child: Center(
//   //     child: AspectRatio(
//   //       aspectRatio: _cameraController.value.aspectRatio,
//   //       child: CameraPreview(_cameraController),
//   //     ),
//   //   ),
//   // );
//
//
//
//   initCamera()async{
//     if(await Permission.camera.request().isGranted){
//       cameras=await availableCameras();
//       cameraController=await CameraController(cameras[0],ResolutionPreset.max);
//       await cameraController.initialize().then((value){
//
//           cameraController.startImageStream((image){
//             cameraCount++;
//             if(cameraCount%10==0){
//               cameraCount=0;
//               objectDetactor(image);
//             }
//             update();
//           } );
//
//
//       });
//       isCameraInitialized(true);
//       update();
//     }else{
//       print('Permission denied');
//     }
//   }
//   initTflite()async{
//     await Tflite.loadModel(
//       model: "assets/model_unquant.tflite",
//       labels: "assets/labels.txt",
//       isAsset: true,
//       numThreads: 1,
//       useGpuDelegate: false,
//
//     );
//   }
//   objectDetactor(CameraImage image)async{
//     var detector=await Tflite.runModelOnFrame(bytesList:image.planes.map((e){
//       return e.bytes;
//     }).toList(),
//     asynch: true,
//       imageHeight: image.height,
//       imageWidth: image.width,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       numResults: 1,
//       rotation: 90,
//       threshold: 0.4,
//     );
//     if(detector!=null){
//       print("Result is $detector");
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Object Scanner'),
//       ),
//       body: Stack(
//         children: [
//           //cameraPreview,
//           Positioned(
//             bottom: 20,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: Colors.black54,
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Detected Objects:',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   _recognitions.isNotEmpty
//                       ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: _recognitions.map<Widget>((result) {
//                       String objectName = result['label'];
//                       double confidence = result['confidence'];
//                       return Text(
//                         '$objectName (${(confidence * 100).toStringAsFixed(2)}%)',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                       );
//                     }).toList(),
//                   )
//                       : Text(
//                     'Scanning...',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//   }
//
//
// }
