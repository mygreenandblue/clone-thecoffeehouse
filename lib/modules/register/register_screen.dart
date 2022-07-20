import 'package:demoproject/shared/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/constant/app_color.dart';
import 'package:flutter/services.dart';
import '../../shared/widgets/wave_effect.dart';

// ignore: must_be_immutable
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

// ignore: must_be_immutable
class Register extends StatefulWidget {
  final List<User>? users;
  User? user;
  Register({Key? key, this.user, this.users}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  Color colorButton = AppColor.textFieldColor;
  bool _obscureText = true;

  bool? _isFieldAccount;
  bool? _isFieldPassword;
  bool? _isFieldName;
  bool? _isFieldPhone;
  bool? _isFieldConfirmPassword;

  int _charLength = 0;
  bool _statusPassword = false;
  bool _statusAccount = false;
  bool _statusConfirmPassword = false;
  bool _statusName = false;
  bool _statusPhone = false;

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  _clearAllAccount() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerAccount.clear();
      _statusAccount = false;
      _isFieldAccount = false;
      colorButton = AppColor.textFieldColor;
    });
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

  _clearAllPhone() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerPhone.clear();
      _statusPhone = false;
      _isFieldPhone = false;
      colorButton = AppColor.textFieldColor;
    });
  }

  _clearAllConfirmPassword() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerConfirmPassword.clear();
      _statusConfirmPassword = false;
      _isFieldConfirmPassword = false;
      colorButton = AppColor.textFieldColor;
    });
  }

  _clearAllPassword() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerPassword.clear();
      _statusPassword = false;
      _isFieldPassword = false;
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

  _onChangedTextAccount(String value) {
    bool isFieldValid = value.trim().isNotEmpty;
    if (isFieldValid != _isFieldAccount) {
      setState(() => _isFieldAccount = isFieldValid);
    }
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _statusAccount = true;
      });
    } else {
      setState(() {
        _statusAccount = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  _onChangedTextPassword(String value) {
    bool isFieldValid = value.trim().isNotEmpty;
    if (isFieldValid != _isFieldPassword) {
      setState(() => _isFieldPassword = isFieldValid);
    }
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _statusPassword = true;
      });
    } else {
      setState(() {
        _statusPassword = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  _onChangedTextConfirm(String value) {
    bool isFieldValid = value.trim().isNotEmpty;
    if (isFieldValid != _isFieldConfirmPassword) {
      setState(() => _isFieldConfirmPassword = isFieldValid);
    }
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _statusConfirmPassword = true;
      });
    } else {
      setState(() {
        _statusConfirmPassword = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  void _disableButton() {
    if (_isFieldAccount == null ||
        _isFieldPassword == null ||
        _isFieldConfirmPassword == null ||
        _isFieldName == null ||
        _isFieldPhone == null ||
        !_isFieldAccount! ||
        !_isFieldPassword! ||
        !_isFieldConfirmPassword! ||
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    if (widget.user != null) {
      _controllerAccount.text = widget.user!.account!;
      _controllerPassword.text = widget.user!.password!;
      _controllerName.text = widget.user!.name!;
      _controllerConfirmPassword.text = widget.user!.password!;
      _controllerPhone.text = widget.user!.phone_number!;
    }

    super.initState();
  }

  @override
  void dispose() {
    _controllerAccount.dispose();
    _controllerPassword.dispose();
    _controllerName.dispose();
    _controllerPhone.dispose();
    _controllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: AppColor.topSpace,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: <Widget>[
            _getScrollLabelBody(),
            _getOverlayWidget(),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                leading: IconButton(
                  alignment: Alignment.topLeft,
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: AppColor.topSpace
                    .withOpacity(0), //You can make this transparent
                elevation: 0.0, //No shadow
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getScrollLabelBody() {
    return SingleChildScrollView(
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
              height: 450,
              color: AppColor.primary,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            color: AppColor.topSpace,
          ),
        ],
      ),
    );
  }

  Widget _getOverlayWidget() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 512,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              _buildTextFieldName(),
              _buildTextFieldPhoneNumber(),
              _buildTextFieldAccount(),
              _buildTextFieldPassword(),
              _buildTextFieldConfirmPassword(),
              _buildButtonRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSpace() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: AppColor.topSpace,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 35,
                  color: AppColor.primary,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontFamily: "/FredokaOne"),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Sign up into your account",
              style: TextStyle(
                  fontSize: 22.0,
                  color: AppColor.textFieldColor,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontFamily: "/FredokaOne"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldPassword() {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.textFieldColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.lock,
              size: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]'))
                  ],
                  controller: _controllerPassword,
                  obscuringCharacter: '*',
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: " Password",
                    border: InputBorder.none,
                  ),
                  onSaved: (value) => widget.user?.password = value,
                  obscureText: _obscureText,
                  onChanged: (value) {
                    _onChangedTextPassword(value);
                    _disableButton();
                  },
                ),
              ),
            ),
            Visibility(
                visible: _statusPassword,
                child: IconButton(
                  onPressed: _clearAllPassword,
                  icon: const Icon(Icons.clear),
                  iconSize: 20,
                  color: Colors.black,
                )),
            Visibility(
              visible: _statusPassword,
              child: IconButton(
                onPressed: _toggle,
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                color: AppColor.sideBarColor,
              ),
            ),
          ],
        ));
  }

  Widget _buildTextFieldAccount() {
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
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                child: TextFormField(
                  // autofocus: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]'))
                  ],
                  controller: _controllerAccount,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Account',
                    border: InputBorder.none,
                  ),
                  onSaved: (value) => widget.user?.account = value,
                  onChanged: (value) {
                    _onChangedTextAccount(value);
                    _disableButton();
                  },
                ),
              ),
            ),
            Visibility(
              visible: _statusAccount,
              child: IconButton(
                onPressed: _clearAllAccount,
                icon: const Icon(Icons.clear),
                iconSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ));
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
              child: Container(
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
              child: Container(
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

  Widget _buildTextFieldConfirmPassword() {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.textFieldColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.lock,
              size: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]'))
                  ],
                  controller: _controllerConfirmPassword,
                  obscuringCharacter: '*',
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: " Confirm password",
                    border: InputBorder.none,
                  ),
                  onSaved: (value) => widget.user?.password = value,
                  obscureText: _obscureText,
                  onChanged: (value) {
                    _onChangedTextConfirm(value);
                    _disableButton();
                  },
                ),
              ),
            ),
            Visibility(
                visible: _statusConfirmPassword,
                child: IconButton(
                  onPressed: _clearAllConfirmPassword,
                  icon: const Icon(Icons.clear),
                  iconSize: 20,
                  color: Colors.black,
                )),
            Visibility(
              visible: _statusConfirmPassword,
              child: IconButton(
                onPressed: _toggle,
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                color: AppColor.sideBarColor,
              ),
            ),
          ],
        ));
  }

  Widget _buildButtonRegister() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colorButton,
      ),
      child: MaterialButton(
        onPressed: () {
          if (_isFieldAccount == null ||
              _isFieldPassword == null ||
              _isFieldConfirmPassword == null ||
              _isFieldName == null ||
              _isFieldPhone == null ||
              !_isFieldAccount! ||
              !_isFieldPassword! ||
              !_isFieldConfirmPassword! ||
              !_isFieldName! ||
              !_isFieldPhone!) {
            // ignore: deprecated_member_use
            _scaffoldState.currentState!.showSnackBar(const SnackBar(
              content: Text("Please fill all field"),
            ));
          }
        },
        child: const Text(
          "Register",
          style: TextStyle(
              fontSize: 28.0, color: Colors.white, fontFamily: "FredokaOne"),
        ),
      ),
    );
  }
}
