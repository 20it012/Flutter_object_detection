import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_object_detection/main.dart';
import 'package:flutter_tflite/flutter_tflite.dart';



class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  bool isWorking = false;
  String result="";
  late CameraController cameraController;
  CameraImage? imgCamera;
  //
  // List<CameraDescription>? cameras;
  // late CameraController controller;

  // Future<void> setupCamera() async {
  //   try {
  //     // Get available cameras
  //     cameras = await availableCameras();
  //     // Initialize the camera controller
  //     cameraController = CameraController(cameras![0], ResolutionPreset.max);
  //     // Initialize the camera controller
  //     await cameraController.initialize();
  //     // Start camera preview
  //     await cameraController.startImageStream(onCameraImage);
  //     print('Camera Initialized Successfully');
  //   } catch (e) {
  //     print('Failed to set up camera: $e');
  //   }
  // }

  // loadModel() async
  // {
  //   await Tflite.loadModel(
  //     model: "mobilenet_v1_1.0_224.tflite",
  //     labels: "mobilenet_v1_1.0_224.txt",
  //   );
  // }

  initCamera(){
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController.initialize().then((value)
    {
      if(!mounted)
        {
          return;
        }

        setState(() {
          cameraController.startImageStream((imageFromStream) =>
        {
          if(!isWorking)
          {
            isWorking = true,
            imgCamera = imageFromStream,
            // runModelOnStreamFrames();
          }

        });
      });
    });
  }

  // runModelOnStreamFrames() async
  // {
  //   if(imgCamera != null)
  //     {
  //       var recognitions = await Tflite.runModelOnFrame(
  //           bytesList: imgCamera.planes.map((plane)
  //           {
  //             return plane.bytes;
  //           }).toList(),
  //
  //           imageHeight: imgCamera.height,
  //           imageWidth: imgCamera.width,
  //           imageMean: 127.5,
  //           imageStd: 127.5,
  //           rotation: 90,
  //           numResults: 2,
  //           threshold: 0.1,
  //           asynch: true,
  //           );
  //       result = "";
  //       recognitions.forEach((response)
  //       {
  //         result += response["label"] + "" + (response["confidence"] as double).toStringAsFixed(2) + "\n \n";
  //       });
  //
  //       setState(() {
  //         result;
  //       });
  //
  //       isWorking = false;
  //     }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   loadModel();
  // }
  //
  // @override
  // void dispose() async
  // {
  //   super.dispose();
  //
  //   await Tflite.close();
  //   cameraController?.dispose();
  // }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/jarvis.jpg")
                ),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    color: Colors.black,
                    height: 320,
                    width: 330,
                    child: Image.asset("assets/camera.jpg"),
                  ),
                ),
                Center(
                  child: FloatingActionButton(
                    onPressed: initCamera(),
                    child: Container(
                      margin: EdgeInsets.only(top: 35),
                      height: 270,
                      width: 305,
                      child: imgCamera == null
                          ? Container(
                              height: 270,
                              width: 360,
                              child: Icon(Icons.photo_camera_front, color: Colors.blueAccent, size: 40,),
                            )
                          : AspectRatio(
                              aspectRatio: cameraController.value.aspectRatio,
                              child: CameraPreview(cameraController),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
