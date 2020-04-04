import 'package:app_teste/Models/OrdemServicos.Model.dart';
import 'package:app_teste/Services/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consulta Ordem Servico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<OrdemServicos>> futureOrdemServico;

  @override
  void initState(){
    super.initState();
    futureOrdemServico = fetchOrdemServico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consulta Ordem Servico'),),
      body: Container(
        child: FutureBuilder<List<OrdemServicos>>(
          future: futureOrdemServico,
          builder: (context, snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                        itemCount: snapshot.data.length,  
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                            key: Key(snapshot.data[index].codigo.toString()),
                            title: Text(snapshot.data[index].cliNome),
                            subtitle: Text(snapshot.data[index].ocorrencia),
                            leading: Icon(Icons.access_alarm),
                          );
                        }
                      );
            }
            // By default, show a loading spinner.
            return 
                Center(
                  child: 
                  CircularProgressIndicator()
                );
          },
        )
      )
    );
  }
}

