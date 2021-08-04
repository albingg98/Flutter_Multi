import 'dart:async';

import 'package:flutter/material.dart';


class ListaPage extends StatefulWidget {
  static final pageName = 'list';

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);

  }

  void _agregar10() {

    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      
    });
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(
      duration, 
      respuestaHTTP
    );
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
    _scrollController.position.pixels + 100,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250)
    );

    _agregar10();
  }

  Widget _crearLoading() {
    
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }


}


