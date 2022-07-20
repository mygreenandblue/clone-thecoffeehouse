import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demoproject/shared/models/users_model.dart';
import 'package:demoproject/shared/constant/app_color.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/widgets/wave_effect.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  final List<User>? users;
  User? user;
  Profile({Key? key, this.users, this.user}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  Color colorButton = AppColor.textFieldColor;
  String date = "";
  DateTime selectedDate = DateTime.now();
  File? imageFile;

  bool? _isFieldName;
  bool? _isFieldPhone;
  bool? _isFieldMail;

  int _charLength = 0;
  bool _statusName = false;
  bool _statusPhone = false;
  bool _statusMail = false;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerMail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _clearAllName() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerName.clear();
      _statusName = false;
      _isFieldName = false;
      colorButton = AppColor.textFieldColor;
    });
  }

  _clearAllMail() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerMail.clear();
      _statusMail = false;
      _isFieldMail = false;
      colorButton = AppColor.textFieldColor;
    });
  }

  _clearAllPhone() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerPhone.clear();
      _statusPhone = false;
      _isFieldPhone = false;
      colorButton = AppColor.textFieldColor;
    });
  }

  _onChangedTextName(String value) {
    bool isFieldValid = value.trim().isNotEmpty;
    if (isFieldValid != _isFieldName) {
      setState(() => _isFieldName = isFieldValid);
    }
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _statusName = true;
      });
    } else {
      setState(() {
        _statusName = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  _onChangedTextMail(String value) {
    bool isFieldValid = value.trim().isNotEmpty;
    if (isFieldValid != _isFieldMail) {
      setState(() => _isFieldMail = isFieldValid);
    }
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _statusMail = true;
      });
    } else {
      setState(() {
        _statusMail = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  _onChangedTextPhone(String value) {
    bool isFieldValid = value.trim().isNotEmpty;
    if (isFieldValid != _isFieldPhone) {
      setState(() => _isFieldPhone = isFieldValid);
    }
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _statusPhone = true;
      });
    } else {
      setState(() {
        _statusPhone = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  void _disableButton() {
    if (_isFieldName == null ||
        _isFieldPhone == null ||
        _isFieldMail == null ||
        !_isFieldMail! ||
        !_isFieldName! ||
        !_isFieldPhone!) {
      setState(() {
        colorButton = AppColor.textFieldColor;
      });
    } else {
      setState(() {
        colorButton = AppColor.primary;
      });
    }
  }

  @override
  void initState() {
    if (widget.user != null) {
      _controllerName.text = widget.user!.name!;
      _controllerMail.text = widget.user!.mail!;
      _controllerPhone.text = widget.user!.phone_number!;
    }

    super.initState();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPhone.dispose();
    _controllerMail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: AppColor.topSpace,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: AppColor.primary,
              child: ClipPath(
                clipper: CustomClipPath(),
                child: _buildTopSpace(),
              ),
            ),
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppColor.primary,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 90),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        _buildTextFieldName(),
                        _buildTextFieldPhoneNumber(),
                        _buildTextFieldEmail(),
                        _buildDateOfBirth(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildButtonSave(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTopSpace() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: imageFile == null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Center(
                  child: Stack(children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: AppColor.primary,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: Icon(
                      Icons.person,
                      size: 120,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                _buildEditEvent()
              ])),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Center(
                  child: Stack(children: [buildImage(), _buildEditEvent()])),
            ),
    );
  }

  Widget buildImage() {
    return CircleAvatar(
      radius: 75,
      backgroundColor: AppColor.topSpace,
      child: CircleAvatar(
        backgroundImage: FileImage(imageFile!),
        radius: 70,
      ),
    );
  }

  Widget buildEditIcon() => buildCircle(
      all: 8,
      child: const Icon(
        CupertinoIcons.camera,
        color: Colors.black,
        size: 20,
      ));

  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: AppColor.topSpace,
        child: child,
      ));

  Widget _buildEditEvent() {
    return Positioned(
      right: 4,
      top: 100,
      child: GestureDetector(
          onTap: (() => showCupertinoDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return CupertinoAlertDialog(
                    title: const Text('Thay đổi ảnh đại diện'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          _getFromCamera();
                          Navigator.of(context, rootNavigator: true)
                              .pop("Discard");
                        },
                        child: const Text('Chụp ảnh mới'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          _getFromGallery();
                          Navigator.of(context, rootNavigator: true)
                              .pop("Discard");
                        },
                        child: const Text('Chọn ảnh từ thư viện'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        isDefaultAction: false,
                        isDestructiveAction: false,
                        child: const Text('Hủy bỏ'),
                      )
                    ],
                  );
                },
              )),
          child: buildEditIcon()),
    );
  }

  Widget _buildTextFieldName() {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.textFieldColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.person,
              size: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: TextFormField(
                      // autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]'))
                      ],
                      controller: _controllerName,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        border: InputBorder.none,
                      ),
                      onSaved: (value) => widget.user?.name = value,
                      onChanged: (value) {
                        _onChangedTextName(value);
                        _disableButton();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _statusName,
              child: IconButton(
                onPressed: _clearAllName,
                icon: const Icon(Icons.clear),
                iconSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }

  Widget _buildTextFieldPhoneNumber() {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.textFieldColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.person,
              size: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: TextFormField(
                      maxLength: 15,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]'))
                      ],
                      controller: _controllerPhone,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Phone number',
                        border: InputBorder.none,
                      ),
                      onSaved: (value) => widget.user?.phone_number = value,
                      onChanged: (value) {
                        _onChangedTextPhone(value);
                        _disableButton();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _statusPhone,
              child: IconButton(
                onPressed: _clearAllPhone,
                icon: const Icon(Icons.clear),
                iconSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }

  Widget _buildTextFieldEmail() {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.textFieldColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.mail,
              size: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: TextFormField(
                      maxLength: 15,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              maxLength}) =>
                          null,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]'))
                      ],
                      controller: _controllerMail,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                      onSaved: (value) => widget.user?.mail = value,
                      onChanged: (value) {
                        _onChangedTextMail(value);
                        _disableButton();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _statusMail,
              child: IconButton(
                onPressed: _clearAllMail,
                icon: const Icon(Icons.clear),
                iconSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }

  Widget _buildDateOfBirth() {
    return GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.textFieldColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
            ],
          ),
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  Widget _buildButtonSave() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: colorButton,
      child: MaterialButton(
        onPressed: () {
          if (_isFieldName == null ||
              _isFieldPhone == null ||
              !_isFieldName! ||
              !_isFieldPhone!) {
            // ignore: deprecated_member_use
            _scaffoldState.currentState!.showSnackBar(const SnackBar(
              content: Text("Please fill all field"),
            ));
          }
        },
        child: const Text(
          "Save",
          style: TextStyle(
              fontSize: 28.0, color: Colors.white, fontFamily: "FredokaOne"),
        ),
      ),
    );
  }
}
