import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'modal/menssage.dart';

class Testimonial extends StatefulWidget {
  @override
  _TestimonialState createState() => _TestimonialState();
}

Future<Uint8List> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return await file.readAsBytes();
}

List<Map> message = List<Map>();

mockMessage() async {
  message.add({
    "message": Message(
        messenger:
            "Etiam fermentum dictum felis, sit amet condimentum quam tincidunt a.",
        datePublisher: DateTime(2020, 5, 2),
        linkImage: await getImageFileFromAssets('question1.jpg'),
        uuidUser: "1"),
  });
  message.add({
    "message": Message(
        messenger:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fringilla ex ac accumsan condimentum. Proin ultricies velit sed risus interdum, a congue tellus lacinia. Etiam fermentum dictum felis, sit amet condimentum quam tincidunt a.",
        datePublisher: DateTime(2020, 5, 20),
        linkImage: await getImageFileFromAssets('question2.jpg'),
        uuidUser: "2"),
  });
  message.add({
    "message": Message(
        messenger:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fringilla ex ac accumsan condimentum. Proin ultricies velit sed risus interdum, a congue tellus lacinia. Etiam fermentum dictum felis, sit amet condimentum quam tincidunt a.",
        datePublisher: DateTime(2020, 5, 10),
        linkImage: await getImageFileFromAssets('question3.jpg'),
        uuidUser: "3")
  });

  for (var obj in message) {
    obj['gaveLike'] = false;
  }

  Message.sortListMessage(message);
  return message;
}

class _TestimonialState extends State<Testimonial> {
  final _formKey = GlobalKey<FormState>();
  List<Map> messages = List<Map>();
  TextEditingController messageUser = TextEditingController(text: "");
  bool _isHaveImage = false;
  Image imgPoster;
  Uint8List imgFilePoster;

  _retriveData() async {
    messages = await mockMessage();
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    if (message.length == 0) {
      _retriveData();
    }else{
      messages = message;
    }
  }

//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    if (message.length == 0) {
//      _retriveData();
//    } else {
//      messages = message;
//    }
//  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _isHaveImage = true;
      imgPoster = Image.file(image);
    });
    imgFilePoster = await image.readAsBytes();
  }

  Container _commentInput(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
          bottomLeft: Radius.circular(14.0),
          bottomRight: Radius.circular(14.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(FontAwesomeIcons.feather, color: Color(0xff7A7A7A)),
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              width: size.width * 0.75,
              height: size.width * 0.1,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Digite um depoimento",
                    helperStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                controller: messageUser,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Porfavor, digite uma mensagem";
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _commentButtons(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.039, left: 12, right: 12),
      padding: EdgeInsets.only(top: 80, left: 13, right: 13),
      height: size.height * 0.32,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xffF3DCCC),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14.0),
          bottomRight: Radius.circular(14.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: getImage,
            child: _isHaveImage
                ? Container(
                    height: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: imgPoster.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Color(0x99323232),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    imgPoster = null;
                                    _isHaveImage = false;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.trash,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ) /* add child content here */,
                  )
                : Card(
                    color: Color(0x80D68954),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 0,
                    child: Container(
                      height: 90,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.images,
                              size: 35,
                              color: Colors.white,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 14),
                              child: Text(
                                "Adicionar uma foto".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          _buttons("Publicar", FontAwesomeIcons.solidPaperPlane),
        ],
      ),
    );
  }

  _buttons(String text, IconData iconData) {
    return GestureDetector(
      child: Container(
        width: 152,
        padding: EdgeInsets.only(top: 1, bottom: 4),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
              side: BorderSide(color: Color(0xffD68954))),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              messages.add({
                'gaveLike': false,
                "message": Message(
                    uuidUser: '1',
                    messenger: messageUser.text,
                    datePublisher: DateTime.now(),
                    linkImage: imgFilePoster)
              });
              setState(() {
                messageUser = TextEditingController(text: "");
                imgFilePoster = null;
                imgPoster = null;
                _isHaveImage = false;
              });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(iconData, color: Colors.white),
              Text(
                text,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          color: Color(0xffD68954),
        ),
      ),
    );
  }

  _headComment(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.025),
      height: size.height*0.35,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(child: _commentButtons(size)),
          Positioned(bottom: size.height*0.25, child: _commentInput(size)),
        ],
      ),
    );
  }

  _bodyMessage(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 8, right: 8),
      child: Expanded(
        flex: 1,
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, i) {
              var message = messages[i];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0xffF3DCCC),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(message['message'].linkImage)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          message['message'].messenger,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                !message['gaveLike']
                                    ? message['message'].Likes++
                                    : message['message'].Likes--;
                                setState(() {
                                  print(message['gaveLike']);
                                  message['gaveLike'] = !message['gaveLike'];
                                  print(message['gaveLike']);
                                });
                              },
                              child: message['gaveLike']
                                  ? Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.heart,
                                      color: Colors.black,
                                    ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.0004),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _headComment(size),
              _bodyMessage(size),
            ],
          ),
        ),
      ),
    );
  }
}
