
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/view/screens/register/widgets/custom_button.dart';
import 'package:test_app/view/screens/register/widgets/custom_text_field.dart';
import 'package:test_app/view/screens/register/widgets/select_image.dart';
import 'package:test_app/view/widgets/loading_alert_widget.dart';



class RegisterView extends StatefulWidget {
  static const routeName = 'register-view';

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final _formKey = GlobalKey<FormState>();


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String _selectedImage;


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }


  void _onSelectedImage(File pickedImage){
     _selectedImage = base64Encode(pickedImage.readAsBytesSync());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Consumer(
              builder: (context, watch, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize:  MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              "Register",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                            SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      hintText: "name",
                                      controller: _nameController,
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(height: 12),
                                    CustomTextField(
                                      hintText: "phone",
                                      controller: _phoneController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 12),
                                    CustomTextField(
                                      hintText: "email",
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(height: 12),
                                    CustomTextField(
                                      hintText: "password",
                                      controller: _passwordController,
                                      keyboardType: TextInputType.visiblePassword,
                                    ),
                                    SizedBox(height: 32),
                                    ImageInput(_onSelectedImage),
                                    SizedBox(height: 32),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),

                    SafeArea(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 30,horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                buttonText: "Register",
                                onTap: () {
                                  context.read(authViewModelProvider).register(name: _nameController.text,  phone:_phoneController.text, email:_emailController.text, password:_passwordController.text, image:_selectedImage, context:context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          LoadingAndAlertWidget(),
        ],
      )
    );
  }
}
