import 'package:demoproject/shared/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/constant/app_color.dart';
import 'package:flutter/services.dart';
import '../../shared/widgets/wave_effect.dart';
import 'package:demoproject/modules/register/register_screen.dart';
import '../home/home_page.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  final List<User>? users;
  User? user;
  Login({Key? key, this.user, this.users}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Color colorButton = AppColor.textFieldColor;
  bool _obscureText = true;
  bool _isRemember = false;
  bool isColor = false;
  bool? _isFieldAccount;
  bool? _isFieldPassword;

  int _charLength = 0;
  bool _statusPassword = false;
  bool _statusAccount = false;
  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  _clearAllAccount() {
    setState(() {
      _formKey.currentState?.reset();
      _controllerAccount.clear();
      _statusAccount = false;
      _isFieldAccount = false;
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
        // colorButton = AppColor.primary;
      });
    } else {
      setState(() {
        _statusAccount = false;
        colorButton = AppColor.textFieldColor;
      });
    }
  }

  void _disableButton() {
    if (_isFieldAccount == null ||
        _isFieldPassword == null ||
        !_isFieldAccount! ||
        !_isFieldPassword!) {
      setState(() {
        colorButton = AppColor.textFieldColor;
      });
    } else {
      setState(() {
        colorButton = AppColor.primary;
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
        // colorButton = AppColor.primary;
      });
    } else {
      setState(() {
        _statusPassword = false;
        colorButton = AppColor.textFieldColor;
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
      _isFieldAccount = true;
      _controllerAccount.text = widget.user!.account.toString();
      _isFieldPassword = true;
      _controllerPassword.text = widget.user!.password.toString();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controllerAccount.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
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
                          _buildTextFieldAccount(),
                          _buildTextFieldPassword(),
                          _buildAccountSupport(),
                          _buildButtonLogin(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(bottom: 12),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                )
                              ],
                            ),
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
      ),
    );
  }

  Widget _buildTopSpace() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary.withOpacity(0.3),
                border: Border.all(
                    width: 3, color: AppColor.primary.withOpacity(0.2)),
              ),
              child: const Image(
                width: 60,
                height: 60,
                image: AssetImage('assets/images/Pickup2.png'),
              ),
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
              "Sign in to continue",
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

  Widget _buildTextFieldAccount() {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
                margin: const EdgeInsets.only(left: 8),
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

  Widget _buildAccountSupport() {
    return Row(children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Checkbox(
                  value: _isRemember,
                  checkColor: Colors.green,
                  activeColor: Colors.white,
                  side: BorderSide(color: AppColor.primary),
                  onChanged: (value) {
                    setState(() {
                      _isRemember = value!;
                    });
                  }),
              Text(
                "Remember account",
                style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Text(
            "Forget Password?",
            style: TextStyle(
                color: AppColor.primary,
                fontSize: 12.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ]);
  }

  Widget _buildButtonLogin() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colorButton,
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));

          // if (_isFieldAccount == null ||
          //     _isFieldPassword == null ||
          //     !_isFieldAccount! ||
          //     !_isFieldPassword!) {
          //   return;
          // }
          // String account = _controllerAccount.text;
          // String password = _controllerPassword.text;

          // User user = User(account: account, password: password);

          // if (user.account == users[1].account &&
          //     user.password == users[1].password) {
          //   print("successful!");
          // } else {
          //   if (user.account != users[1].account) {
          //     showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(12),
          //             ),
          //             title: const Text(
          //               'Tên người dùng không chính xác',
          //             ),
          //             content: const Text(
          //               'Có vẻ như tên người dùng bạn nhập không thuộc về tài khoản nào cả. Vui lòng kiểm tra tên người dùng và thử lại.',
          //             ),
          //             actions: [
          //               ElevatedButton(
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //                 child: const Text('OK'),
          //               ),
          //             ],
          //           );
          //         });
          //   }
          //   if (user.account == users[1].account &&
          //       user.password != users[1].password) {
          //     showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(12),
          //             ),
          //             title: const Text(
          //               'Sai mật khẩu',
          //             ),
          //             content: const Text(
          //               'Mật khẩu bạn vừa nhập chưa chính xác. Vui lòng thử lại.',
          //             ),
          //             actions: [
          //               ElevatedButton(
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //                 child: const Text('OK'),
          //               ),
          //             ],
          //           );
          //         });
          // }
          // }
        },
        child: const Text(
          "Login",
          style: TextStyle(
              fontSize: 28.0, color: Colors.white, fontFamily: "FredokaOne"),
        ),
      ),
    );
  }
}
