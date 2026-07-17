import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/transaction_model.dart';
import '../services/database_service.dart';



class TransactionScreen extends StatefulWidget {

  const TransactionScreen({super.key});


  @override
  State<TransactionScreen> createState() => _TransactionScreenState();

}



class _TransactionScreenState extends State<TransactionScreen> {


  final amountController = TextEditingController();

  final titleController = TextEditingController();


  String type = "Expense";


  final DatabaseService databaseService = DatabaseService();




  void saveTransaction() async {


    if(amountController.text.isEmpty){

      return;

    }


    TransactionModel transaction = TransactionModel(

      id: const Uuid().v4(),

      amount: double.parse(amountController.text),

      title: titleController.text.isEmpty
          ? "Transaction"
          : titleController.text,

      type: type,

      date: DateTime.now(),

    );



    await databaseService.insertTransaction(transaction);



    Navigator.pop(context);


  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(

          "Add Transaction",

        ),

      ),



      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(


          children: [



            TextField(

              controller: amountController,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(

                labelText: "Amount",

                border: OutlineInputBorder(),

              ),

            ),




            const SizedBox(height:15),




            TextField(

              controller: titleController,

              decoration: const InputDecoration(

                labelText: "Description",

                border: OutlineInputBorder(),

              ),

            ),




            const SizedBox(height:15),




            DropdownButton<String>(


              value: type,


              items: const [


                DropdownMenuItem(

                  value:"Income",

                  child:Text("Income"),

                ),



                DropdownMenuItem(

                  value:"Expense",

                  child:Text("Expense"),

                ),


              ],



              onChanged:(value){


                setState((){

                  type=value!;

                });


              },


            ),




            const SizedBox(height:25),




            SizedBox(

              width: double.infinity,


              child: ElevatedButton(

                onPressed: saveTransaction,


                child: const Text(

                  "SAVE",

                ),

              ),

            )



          ],


        ),


      ),


    );


  }


}