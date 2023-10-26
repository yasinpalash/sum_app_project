import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fieldOneTEcontroller = TextEditingController();
  final TextEditingController _fieldTwoTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(

            children: [
              Container(
                width: 200.0, // Set the width as needed
                height: 100.0, // Set the height as needed
                decoration: BoxDecoration(
                  //color: Color(0xFF285528), // Background color
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners (adjust the radius as needed)
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                  
                ),
                child: Center(
                  child: Text(
                    'Result is :$result',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),



              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: _fieldOneTEcontroller,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'Field 1',

                ),

                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter valid value';
                  }
                  return null;
                },
              ),
              Divider(),
              TextFormField(
                keyboardType: TextInputType.number,

                controller: _fieldTwoTEcontroller,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(hintText: 'Field 2'),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter valid value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                        double firstNumber=parseToDouble(_fieldOneTEcontroller.text.trim());
                        double sceondNumber=parseToDouble(_fieldTwoTEcontroller.text.trim());
                        result =add(firstNumber,sceondNumber);
                        setState(() {

                        });


                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                        double firstNumber=parseToDouble(_fieldOneTEcontroller.text.trim());
                        double sceondNumber=parseToDouble(_fieldTwoTEcontroller.text.trim());
                        result =sub(firstNumber,sceondNumber);
                        setState(() {

                        });


                      }
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Sub'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                        double firstNumber=parseToDouble(_fieldOneTEcontroller.text.trim());
                        double sceondNumber=parseToDouble(_fieldTwoTEcontroller.text.trim());
                        result =mul(firstNumber,sceondNumber);
                        setState(() {

                        });


                      }
                    },
                    icon: const Icon(Icons.star),
                    label: const Text('Mul'),
                  ),

                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(

                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                        double firstNumber=parseToDouble(_fieldOneTEcontroller.text.trim());
                        double sceondNumber=parseToDouble(_fieldTwoTEcontroller.text.trim());
                        result =div(firstNumber,sceondNumber);
                        setState(() {

                        });


                      }
                    },
                    child: const Text('/ Div'),

                  ),
                  ElevatedButton(
                    onPressed: () {

                      if(_formKey.currentState!.validate()){
                        double firstNumber=parseToDouble(_fieldOneTEcontroller.text.trim());
                        double sceondNumber=parseToDouble(_fieldTwoTEcontroller.text.trim());
                        result =mou(firstNumber,sceondNumber);
                        setState(() {

                        });


                      }
                    },
                    child: Text('% Mod'),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  double parseToDouble(String text){
    return double.tryParse(text)??0;
  }
  double add(double firstNum,double sceondNum){
    return firstNum+sceondNum;


  }

  double sub(double firstNum,double sceondNum){
    return firstNum-sceondNum;

  }
  double mul(double firstNum,sceondNum){
    return firstNum*sceondNum;
  }
  double div(double firstNum,sceondNum){
    return firstNum/sceondNum;
  }
  double mou(double firstNum,sceondNum){
    return firstNum%sceondNum;
  }
}
