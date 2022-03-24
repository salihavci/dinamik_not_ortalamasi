import 'package:dinamik_not_ortalamasi/constants/app_constant.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  const OrtalamaHesaplaApp({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaApp> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constants.title,
            style: Constants.style,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Form
          //Liste
          // Container(
          //   child: Text('Form buraya gelecek'),
          //   color: Colors.red,
          // ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: _buildForm(),
                  color: Colors.purple,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Text('Form buraya gelecek'),
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Text('Liste buraya gelecek'),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(),
          Row(
            children: [
              //2 Dropdown
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
