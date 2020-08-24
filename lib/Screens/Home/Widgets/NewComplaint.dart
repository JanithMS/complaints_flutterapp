import 'dart:io';

// import 'package:complaints_app/Screens/Home/Widgets/MyComplaints.dart';
import 'package:complaints_app/Models/ComplaintClass.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewComplaint extends StatefulWidget {
  final List<ComplaintsClass> complaintsClass;
  final Function refresh;
  NewComplaint({this.refresh, this.complaintsClass});
  @override
  _NewComplaintState createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  final nameHolder1 = TextEditingController();
  final nameHolder2 = TextEditingController();

  clearTextInput1() {
    nameHolder1.clear();
  }

  clearTextInput2() {
    nameHolder2.clear();
  }

  final picker = ImagePicker();
  File _image;
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _description;
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameHolder1,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the Title';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _title = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Title"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: nameHolder2,
                  maxLines: 4,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the Description';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: "Description"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _image == null
                    ? FlatButton.icon(
                        onPressed: () {
                          getImage();
                          setState(() {
                            _error = '';
                          });
                        },
                        label: Text('Add Image'),
                        icon: Icon(Icons.add_a_photo),
                      )
                    : GestureDetector(
                        onLongPress: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 300.0,
                              child: FittedBox(
                                  fit: BoxFit.fill, child: Image.file(_image)),
                            ),
                            Center(
                              child: Text(
                                'Long Press the Image to remove',
                                style: TextStyle(color: Colors.brown[200]),
                              ),
                            )
                          ],
                        ),
                      ),
                Center(
                  child: Text(
                    _error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Colors.pink,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (_image != null) {
                        widget.complaintsClass.add(ComplaintsClass(
                            title: _title,
                            description: _description,
                            image: _image));
                        widget.refresh();
                        setState(() {
                          _image = null;
                          clearTextInput1();
                          clearTextInput2();
                        });
                      } else {
                        setState(() {
                          _error = 'Add Image';
                        });
                      }
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )),
      )),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
