import 'package:flutter/material.dart';
import "dart:math";

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key, 
    }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<String> lst = ['Rock','Paper','Scissor'];
  final Random rnd = Random();
  String oponnent = '';
  
  String oponnentImage(){
    switch(oponnent){
      case 'Rock':
        return 'assets/rock.png';
      case 'Paper':
        return 'assets/paper.png';
      case 'Scissor':
        return 'assets/scissor.png';
    }
    return 'assets/logo.png';
  }

  pcchoice(){
    setState((){
      oponnent = lst[rnd.nextInt(lst.length)];
    }
   );
  }

  String player = '';
  
  void playerchoice(choice){
    pcchoice();
    setState((){
      player = choice;
      }         
    );
    result();
  }
  
  String resultado = 'Vamos jogar!';
  Color resultColor = Color.fromARGB(255, 28, 46, 212);
  int pts = 0;
  void result(){
    if(oponnent == player){
      setState((){
        resultado = 'Empate';
        resultColor = Color.fromARGB(255, 113, 54, 252);
      });  
    }
    
    //Derrotas
    if(oponnent == 'Rock' && player == 'Scissor'){
      setState((){
        resultado = 'Você perdeu!';
        resultColor = Color.fromARGB(255, 245, 31, 31);
      });
    }
    if(oponnent == 'Paper' && player == 'Rock'){
      setState((){
        resultado = 'Você perdeu!';
        resultColor = Color.fromARGB(255, 245, 31, 31);
      });
    }
    if(oponnent == 'Scissor' && player == 'Paper'){
      setState((){
        resultado = 'Você perdeu!';
        resultColor = Color.fromARGB(255, 245, 31, 31);
      });
    }
    
    //Vitórias
    if(oponnent == 'Scissor' && player == 'Rock'){
      setState((){
        resultado = 'Você Ganhou!';
        resultColor = Colors.green;
        pts += 10;
      });
    }
    if(oponnent == 'Rock' && player == 'Paper'){
      setState((){
        resultado = 'Você Ganhou!';
        resultColor = Colors.green;
        pts += 10;
      });
    }
    if(oponnent == 'Paper' && player == 'Scissor'){
      setState((){
        resultado = 'Você Ganhou!';
        resultColor = Colors.green;
        pts += 10;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Escolha do app', style: textStyleTemplate(null),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CircleAvatar(
                child: Image.asset(oponnentImage(),
                fit: BoxFit.fill, 
                alignment: Alignment.center,),
                radius: MediaQuery.of(context).size.height * 0.1,),
            ),
            Text(resultado, style: textStyleTemplate(resultColor),),
            Text('Pontuação: $pts',style:textStyleTemplate(Color.fromARGB(255, 28, 46, 212)),)
          ]  
        ) 
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
              FloatingActionButton(onPressed:() => playerchoice('Rock'), child: Image.asset('assets/rock.png'),),
              FloatingActionButton(onPressed:() => playerchoice('Paper'), child: Image.asset('assets/paper.png'),),
              FloatingActionButton(onPressed:() => playerchoice('Scissor'), child: Image.asset('assets/scissor.png'),),
              ]),
      ),
    );
  }
  TextStyle textStyleTemplate(Color? color){
    return TextStyle(
      color: color==null? Color.fromARGB(255, 28, 46, 212):color,
      fontSize: MediaQuery.of(context).size.width * 0.1

    );
  }
}