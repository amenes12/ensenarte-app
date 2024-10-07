import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../components/menu_button_component.dart';
import '../helpers/gesture_classification_helper.dart';

late List<CameraDescription> _cameras;

class ValidationWidget extends StatefulWidget {
  const ValidationWidget({
    super.key,
    required this.title,
    required this.targetLetter,
  });

  final String title;
  final String? targetLetter; // Nueva propiedad para la seña específica

  @override
  State<ValidationWidget> createState() => _ValidationWidgetState();
}

class _ValidationWidgetState extends State<ValidationWidget>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  late GestureClassificationHelper _gestureClassificationHelper;
  Map<String, double>? _classification;
  bool _isProcessing = false;
  bool _isGestureCorrect = false; // Indica si el gesto es correcto
  late CameraDescription _cameraDescription;
  bool _gestureDetected = false; // Variable para asegurarse de que se ha detectado un gesto

  // init camera
  _initCamera() {
    _cameraDescription = _cameras.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(
        _cameraDescription, ResolutionPreset.high,
        imageFormatGroup: Platform.isIOS
            ? ImageFormatGroup.bgra8888
            : ImageFormatGroup.yuv420);
    _cameraController!.initialize().then((value) {
      _cameraController!.startImageStream(_imageAnalysis);
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _imageAnalysis(CameraImage cameraImage) async {
    // Si ya se está procesando una imagen, se salta esta frame
    if (_isProcessing) {
      return;
    }
    _isProcessing = true;
    _classification =
        await _gestureClassificationHelper.inferenceCameraFrame(cameraImage);
    _isProcessing = false;

    // Aquí agregamos la lógica para verificar si la letra específica se detectó correctamente
    if (_classification != null) {
      double threshold =
          0.8; // Umbral de confianza para considerar la detección correcta
      bool gestureCorrect = _classification!.entries.any((entry) =>
          entry.key == widget.targetLetter && entry.value > threshold);

      setState(() {
        _isGestureCorrect = gestureCorrect;
        _gestureDetected = true; // Ahora sabemos que se ha detectado un gesto
      });
    }
  }

  // this function using config camera and init model
  _initHelper() async {
    await _camerasInit(); // Esperamos a que las cámaras se inicialicen
    _gestureClassificationHelper = GestureClassificationHelper();
    await _gestureClassificationHelper.init(); // Inicializamos el helper
    _initCamera(); // Inicializamos la cámara después de que el helper esté listo
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initHelper(); // Iniciamos el proceso de inicialización
    });
    WidgetsBinding.instance
        .addObserver(this); // Agregamos el observador del ciclo de vida
  }

  _camerasInit() async {
    _cameras = await availableCameras();
  }

  // handle app lifecycle state change (pause/resume)
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        _cameraController?.stopImageStream();
        break;
      case AppLifecycleState.resumed:
        if (_cameraController != null &&
            !_cameraController!.value.isStreamingImages) {
          await _cameraController!.startImageStream(_imageAnalysis);
        }
        break;
      default:
    }
  }

  // dispose camera
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    _gestureClassificationHelper.close();
    super.dispose();
  }

  Widget cameraWidget(context) {
    if (_cameraController == null) return Container();

    // get current camera preview size
    var camera = _cameraController!.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(_cameraController!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
          MenuButtonComponent(),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            child: cameraWidget(context),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_classification != null)
                    ...(_classification!.entries.toList()
                      ..sort((a, b) => a.value.compareTo(b.value)))
                        .reversed
                        .take(3)
                        .map(
                          (e) => Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(e.key),
                            const Spacer(),
                            Text(e.value.toStringAsFixed(2))
                          ],
                        ),
                      ),
                    ),
                  if (_gestureDetected)
                    _isGestureCorrect
                        ? Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "¡Gesto Correcto!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                        : Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.close, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Inténtalo de nuevo",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}