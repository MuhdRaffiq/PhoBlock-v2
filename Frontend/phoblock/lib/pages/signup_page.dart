import 'package:flutter/material.dart';

const outlineInputBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(
    const Radius.circular(10.0),
  ),
);

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController(text: '');
  final _lastNameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _userNameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      // TODO: register account
      print('validated!');
      print(_firstNameController.text);
      print(_lastNameController.text);
      print(_emailController.text);
      print(_userNameController.text);
      print(_passwordController.text);
    }
  }

  _handleInputChange(aaa) {
    print(aaa);
  }

  _buildInput({label, controller, validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            fillColor: Color(0xffC4C4C4),
            filled: true,
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
          ),
          onChanged: (input) {
            _handleInputChange(label);
          },
          validator: validator,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var deviceSize = deviceData.size;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: deviceSize.width * (2 / 5),
            color: Colors.yellow,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                      child: Column(
                        children: [
                          Text(
                            'Join PhoBlock',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 42,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () => {},
                              child: Text(
                                'Join Through Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Color(0xff3276B7),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            child: Text(
                              'Or',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  child: _buildInput(
                                    label: 'First Name',
                                    controller: _firstNameController,
                                    validator: (value) {},
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                              ),
                              Expanded(
                                child: Container(
                                  child: _buildInput(
                                    label: 'Last Name',
                                    controller: _lastNameController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter last name';
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: _buildInput(
                              label: 'Email',
                              controller: _emailController,
                              validator: (value) {},
                            ),
                          ),
                          Container(
                            child: _buildInput(
                              label: 'Username',
                              controller: _userNameController,
                              validator: (value) {},
                            ),
                          ),
                          Container(
                            child: _buildInput(
                              label: 'Password',
                              controller: _passwordController,
                              validator: (value) {},
                            ),
                          ),
                          RaisedButton(
                            onPressed: _submit,
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Color(0xff213F3B),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
