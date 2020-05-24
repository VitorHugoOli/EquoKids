import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'modal/menssage.dart';

class Testimonial extends StatefulWidget {
  @override
  _TestimonialState createState() => _TestimonialState();
}

mockMessage() {
  List<Map> message = List<Map>();
  message.add({
    "message": Message(
        messenger:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fringilla ex ac accumsan condimentum. Proin ultricies velit sed risus interdum, a congue tellus lacinia. Etiam fermentum dictum felis, sit amet condimentum quam tincidunt a.",
        datePublisher: DateTime(2020, 5, 2),
        linkImage: "assets/question1.jpg",
        uuidUser: "1"),
  });
  message.add({
    "message": Message(
        messenger:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fringilla ex ac accumsan condimentum. Proin ultricies velit sed risus interdum, a congue tellus lacinia. Etiam fermentum dictum felis, sit amet condimentum quam tincidunt a.",
        datePublisher: DateTime(2020, 5, 20),
        linkImage: "assets/question2.jpg",
        uuidUser: "2"),
  });
  message.add({
    "message": Message(
        messenger:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fringilla ex ac accumsan condimentum. Proin ultricies velit sed risus interdum, a congue tellus lacinia. Etiam fermentum dictum felis, sit amet condimentum quam tincidunt a.",
        datePublisher: DateTime(2020, 5, 10),
        linkImage: "assets/question3.jpg",
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
  bool _isHaveImage = false;
  Image imgPoster;

  @override
  void initState() {
    super.initState();
    messages = mockMessage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    messages = mockMessage();
  }

  Future getImage() async {
    print("vamo q vamo");
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _isHaveImage = true;
      imgPoster = Image.file(image);
    });
  }

  Container _commentInput(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 12, right: 12),
      padding: EdgeInsets.symmetric(horizontal: 20),
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

//  _isHaveImage
//              ? Container(
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                      image: imgPoster.image,
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//                  child: Column(
//                    verticalDirection: VerticalDirection.up,
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.all(10),
//                            height: 35,
//                            width: 35,
//                            decoration: BoxDecoration(
//                              borderRadius: new BorderRadius.all(
//                                Radius.circular(50),
//                              ),
//                              color: Color(0x99323232),
//                            ),
//                            child: GestureDetector(
//                              onTap: (){
//                                setState(() {
//                                  imgPoster = null;
//                                  _isHaveImage = false;
//                                });
//                              },
//                              child: Icon(FontAwesomeIcons.trash, size: 20),
//                            ),
//                          )
//                        ],
//                      )
//                    ],
//                  ) /* add child content here */,
//                )
//              : Container()



  Container _commentButtons(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.039, left: 12, right: 12),
      padding: EdgeInsets.only(top: 25, left: 13, right: 13),
      height: size.height * 0.09,
      decoration: BoxDecoration(
        color: Color(0xffF3DCCC),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14.0),
          bottomRight: Radius.circular(14.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buttons("Foto", FontAwesomeIcons.solidImages),
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
            print("humm");
            getImage();
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
      height: size.height * 0.155,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment:
                Alignment.lerp(Alignment.center, Alignment.bottomCenter, 4.8),
            child: _commentButtons(size),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _commentInput(size),
          ),
        ],
      ),
    );
  }

  _bodyMessage(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 8, right: 8),
      height: size.height * 0.55,
      child: ListView.builder(
          itemCount: messages.length,
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
                        child: Image(
                          image: AssetImage(message['message'].linkImage),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        message['message'].messenger,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              getImage();
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.0004),
      child: Center(
        child: Column(
          children: <Widget>[
            _headComment(size),
            _bodyMessage(size),
          ],
        ),
      ),
    );
  }
}
