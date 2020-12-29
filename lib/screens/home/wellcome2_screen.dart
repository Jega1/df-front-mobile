import 'package:dog_face/appColors.dart';
import 'package:dog_face/models/user.dart';
import 'package:dog_face/screens/home/home_controller.dart';
import 'package:dog_face/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Wellcome2Screen extends StatefulWidget {
  @override
  _Wellcome2ScreenState createState() => _Wellcome2ScreenState();
}

class _Wellcome2ScreenState extends State<Wellcome2Screen> {
  UserModel userModel = UserModel();
  final requiredValidator =
      RequiredValidator(errorText: 'This field is required');
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(context);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        key: scaffoldKey,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(30),
                      bottomRight: const Radius.circular(30),
                    ),
                    gradient: LinearGradient(colors: [
                      //Color.fromRGBO(87, 114, 114, .9),
                      // Color.fromRGBO(91, 11, 53, .9),
                      //Color.fromRGBO(192, 19, 63, .9),
                      Color.fromRGBO(192, 19, 63, .9),
                      Color.fromRGBO(0, 0, 153, .9),
                    ])),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_logo(), buildContainer()],
            )
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'DOGFACE',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 25,
            color: white,
          ),
        )
        // Image.asset(
        //  // 'assets/images/logo.png',
        //   width:
        //   MediaQuery.of(context).size.width / 1.5,
        //   fit: BoxFit.fill, color: Colors.white,
        // ),
      ],
    );
  }

  Widget buildContainer() {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                          ),
                        )
                      ],
                    ),
                    _buildEmailRow(),
                    _buildPasswordRow(),
                    _buildForgetPasswordButton(),
                    _buildLoginButton(),
                    _buildSingupBtn(),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // onChanged: (value){
          //   setState(() {
          //     email = value;
          //   });
          // },
          validator: requiredValidator,
          onSaved: (val) {
            userModel.email = val;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email, color: primaryColor),
              labelText: "E-mail"),
        ));
  }

  Widget _buildPasswordRow() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          // onChanged: (value){

          //   setState(() {
          //     password = value;
          //   });
          // },

          validator: requiredValidator,
          onSaved: (val) {
            userModel.password = val;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: primaryColor),
              labelText: "password"),
        ));
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [FlatButton(onPressed: () {}, child: Text('Forget password'))],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                authUser(userModel: userModel, context: context);
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: primaryColor,
                  letterSpacing: 1,
                  fontSize: MediaQuery.of(context).size.height / 40),
            ),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
        )
      ],
    );
  }

  Widget _builOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              '-OR-',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ))
      ],
    );
  }

  Widget _buildSingupBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: RichText(
                  text: TextSpan(children: [
                // TextSpan(text: "Vous n'avez pas de compte ?",
                // style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height/40
                // )),
                TextSpan(
                    text: 'Inscrivez - vous',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: MediaQuery.of(context).size.height / 35))
              ]))),
        )
      ],
    );
  }

/** 

  Widget _connect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [f
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: gMediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                   boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(17, 191, 255, .9),
                           // blurRadius: 10.0,
                           // offset: Offset(0, 10)
                           )
                      ],
                  color: Colors.white,
                ),
                child: FlatButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Welcome2Screen(),
                    //   ),
                    // );
                  },
                  child: Text('Se connecter', style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: "Arial",),),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Container(

                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      //  Color.fromRGBO(0,	92,	63, .9),
                      Color.fromRGBO(122,	12,	40, .9),
                     // Color.fromRGBO(	255,	99,	97,  .9),
                      Color.fromRGBO(	2,	24,	101,.9),
                    ])

                  ),
                  child:  Icon(Icons.fingerprint, size: 70, color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _forgetPassword(){
    return Container(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 2,

        child: new Text("Mot de passe oublié ?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black38,
                //color: DarkGrey,
                fontFamily: "Arial",
                fontSize: 20)));
  }

    Widget _register(){
    return Container(
      
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
                   gradient: LinearGradient(colors: [
              //  Color.fromRGBO(0,	92,	63, .9),
                      Color.fromRGBO(122,	12,	40, .9),
                     // Color.fromRGBO(	255,	99,	97,  .9),
                      Color.fromRGBO(	2,	24,	101,.9),
                    ])

                  ),

        child: new Text('Inscrivez - vous',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                //color: DarkGrey,
                fontFamily: "Arial",
                fontSize: 20)));
  }
  **/
}
