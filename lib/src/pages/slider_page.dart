import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  static final pageName = 'slider';

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 35.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            //_chekBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la hamburguesa',
      divisions: 1000,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
      
    );

  }
  /*Widget _chekBox() {

    //return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor as bool;
        });
      },
    );

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck, 
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor as bool;
        });
      }
    );
  }*/


  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://mcdonalds.es/api/cms/images/mcdonalds-es/cafe8f34-cf29-4a4b-b862-b80fd19bf2da_1080x943_GME-Cheesy-Buffalo-doble-NUEVO.png?auto=compress,format'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck, 
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );
  }

  


}