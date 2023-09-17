// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TFLite Image Classification',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageClassificationScreen(),
//     );
//   }
// }
//
// class ImageClassificationScreen extends StatefulWidget {
//   @override
//   _ImageClassificationScreenState createState() =>
//       _ImageClassificationScreenState();
// }
//
// class _ImageClassificationScreenState extends State<ImageClassificationScreen> {
//   Interpreter? interpreter;
//   PickedFile? pickedImage;
//   List<String> labels = [];
//   String? classificationResult;
//
//   @override
//   void initState() {
//     super.initState();
//     loadModel();
//     loadLabels();
//   }
//
//   Future<void> loadModel() async {
//     try {
//       interpreter = await Interpreter.fromAsset('model.tflite');
//     } on FileSystemException {
//       print('Failed to load model.');
//     }
//   }
//
//   Future<void> loadLabels() async {
//     try {
//       String labelsContent =
//       await rootBundle.loadString('assets/labels.txt');
//       setState(() {
//         labels = labelsContent.split('\n');
//       });
//     } on FileSystemException {
//       print('Failed to load labels.');
//     }
//   }
//
//   Future<void> pickImageFromGallery() async {
//     var imagePicker = ImagePicker();
//     pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
//     setState(() {
//       classificationResult = null; // Clear previous classification result
//     });
//   }
//
//   Future<void> classifyImage() async {
//     if (pickedImage == null) {
//       setState(() {
//         classificationResult = 'No image selected';
//       });
//       return;
//     }
//     try {
//       File imageFile = File(pickedImage!.path);
//       var imageBytes = await imageFile.readAsBytes();
//       var inputShape = interpreter!.getInputTensor(0).shape;
//       var inputType = interpreter!.getInputTensor(0).type;
//       var outputShape = interpreter!.getOutputTensor(0).shape;
//       var outputType = interpreter!.getOutputTensor(0).type;
//
//       var inputBuffer = TensorBufferFloat32.fromList(inputShape, imageBytes);
//       var outputBuffer = TensorBufferFloat32(outputShape);
//
//       interpreter!.run(inputBuffer.buffer, outputBuffer.buffer);
//
//       var outputList = outputBuffer.getDoubleList();
//
//       var maxIndex = outputList.indexOf(outputList.reduce((curr, next) {
//         return curr > next ? curr : next;
//       }));
//
//       setState(() {
//         classificationResult = labels[maxIndex];
//       });
//     } on FileSystemException {
//       print('Failed to classify image.');
//     }
//   }
//
//   @override
//   void dispose() {
//     interpreter?.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TFLite Image Classification'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (classificationResult != null)
//             Text(
//               'Classification Result: $classificationResult',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//           SizedBox(height: 20),
//           TextButton(
//             onPressed: pickImageFromGallery,
//             child: Text('Pick Image'),
//           ),
//           SizedBox(height: 20),
//           TextButton(
//             onPressed: classifyImage,
//             child: Text('Classify Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }
