import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:qrcode_card/shared/custom_widget.dart';

void main() async {
  //await LocalStorage.configurePrefs();
  CardUboApi.configureDio();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  final myController = TextEditingController();
}

class _MyAppState extends State<MyApp> {
  ScreenshotController screenshotController = ScreenshotController();
  String data = '';
  String emailuser = '';
  String url = '';
//  bool loading = true;

  var nameController = TextEditingController();
  late QrPainter _painter;
  GlobalKey globalKey = GlobalKey();

  int size = 2;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _painter = QrPainter(
        errorCorrectionLevel: QrErrorCorrectLevel.H,
        color: Colors.black,
        emptyColor: Colors.white,
        data: json.encode(data),
        version: QrVersions.auto,
      );
    //  loading = false;
    });

    return MaterialApp(
      title: 'Credencial UBO',
      scaffoldMessengerKey: NotificationService.messengerKey,
      home: Scaffold(
        body: Column(
          children: <Widget>[
         /*    if (loading)
              const CircularProgressIndicator()
            else */
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomPaint(
                      size: Size.square((size * 100).toDouble()),
                      key: globalKey,
                      painter: _painter),
                ),
              ),
            _buildTextField(
              nameController,
              "Ingrese email corporativo...",
            ),
            CustomFlatButton(
              text: 'Validar',
              onPressed: () {
                setState(() {
                  emailuser = nameController.text;
                });

                final res = CardUboApi.fetchUser(emailuser);
                try {
                  res.then((json) {
                    //  setState(() {
                    //emailuser =json.email;
                    url = urlOneParam(json.email.toString());

                    NotificationService.showSnackbarError(
                        'Usuario identificado',
                        Colors.white.withOpacity(0.9),
                        Colors.green);

                    setState(() {
                      data = url;
                    });

                    CustomCardView customcard = CustomCardView(
                      nombre: json.nombrePrimero,
                      appaterno: json.appaterno,
                      cargo: json.cargo,
                      direccion: json.direccion,
                      telefono: json.telefono,
                      email: json.email,
                      sitioweb: json.sitio_web,
                    );

                    screenshotController
                        .captureFromWidget(customcard)
                        .then((img) async {
                      
                
                      
                      UploadService upload = UploadService();
                      //  Image card = Image.memory(img);

                      upload.uploadImage('https://credencial.ubo.cl/api/upload',
                          img, json.idcredencialpersona.toString());
                    });
                  });
                } catch (e) {
                  data = 'invalido';

                  print('error al consultar el usuario $e');
                }
              },
            ),
            CustomFlatButton(
                text: 'Ver',
                onPressed: () {
                  setState(() {
                    //      print(user.idcredencialpersona);
                    //      print(user.appaterno);
                    openLink(url);
                  });
                })
          ],
        ),
      ),
    );
  }

  void openLink(String url) {
    html.window.open(url, '_blank');
  }

  String urlOneParam(String para2) {
    String url = 'http://descarga.ubo.cl/?para2=$para2';

    return url;
  }

  Widget _buildTextField(
      TextEditingController textController, String hintText) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: TextField(
            onChanged: (value) {
              setState(() {
                data = value;
              });
            },
            textAlign: TextAlign.center,
            controller: textController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 18, color: Colors.black26)),
          ),
        ));
  }
}
