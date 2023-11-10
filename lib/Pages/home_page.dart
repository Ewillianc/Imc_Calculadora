import 'package:flutter/material.dart';
import 'package:list_v2/model/imc.dart';
import 'package:list_v2/service/resultado.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imcExemplo;

  
  String? situacao;
  double? imc;
  double altura = 0.0;
  double peso = 0.0;
  String nome = "";
  var resultado = Situacao();
  var calcularImc = Imc();
  var lista = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Calculadora IMC"),
      ),
      body: SizedBox(
        //ScrollView usado para determinar tamanho da tela eliminando o erro de rolagem..
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context)
                    .size
                    .height), //mediaquery pega o tamanho da tela do aparilho
            //fim do ScrollView
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(30),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: Text(
                                imcExemplo == null
                                    ? "0.0"
                                    : imcExemplo.toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                            ),
                            Text(
                              situacao ?? "...",
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      peso = double.parse(value);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Peso: Kg",
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Expanded(
                                child: SizedBox(
                                  width: 100,
                                  height: 35,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      altura = double.parse(value);
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Altura 0.0",
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      TextButton(
                          onPressed: () {
                            imc = calcularImc.calcularIMC(peso, altura);
                            imcExemplo = imc!.toStringAsFixed(2);
                            situacao = resultado.situacao(imc);
                            setState(() {
                              lista.add(imcExemplo!);
                            });
                          },
                          child: const Text(
                            "Calcular",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          )),
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black26),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          itemCount: lista.length,
                          itemBuilder: (BuildContext bc, int index) {
                            var item = lista[index];
                            return SizedBox(
                              height: 25,
                              child: ListTile(
                                title: Text(item),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
