import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} .";
      item["descricao"] = "Descrição ${i} Aprendendo tudo sobre listagem.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            Map<String, dynamic> item = _itens[indice];
            print("Item ${item["titulo"]}");

            // Abaixo a listagem para exibir
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (contex) {
                    return AlertDialog(
                      title: Text(" Dialog Exemplo"),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                      content: Text(
                        "Você clicou no Item : ${item["titulo"]},",
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            print("Selecionado o Botão Sim.");
                            Navigator.pop(context);
                          },
                          child: Text("Sim"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print("Selecionado o Botão Não.");
                            Navigator.pop(context);
                          },
                          child: Text("Não"),
                        )
                      ],
                    );
                  },
                );
              },
              title: Text(_itens[indice]["titulo"]),
              contentPadding: EdgeInsets.all(10),
              subtitle: Text(_itens[indice]["descricao"]),
            );
          },
        ),
      ),
    );
  }
}
