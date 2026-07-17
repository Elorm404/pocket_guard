import 'package:flutter/material.dart';

import '../services/finance_service.dart';
import '../services/database_service.dart';

import '../models/transaction_model.dart';

import '../widgets/balance_card.dart';
import '../widgets/budget_card.dart';
import '../widgets/savings_card.dart';
import '../widgets/transaction_tile.dart';

import 'transaction_screen.dart';



class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();

}



class _HomeScreenState extends State<HomeScreen> {


  final FinanceService financeService = FinanceService();

  final DatabaseService databaseService = DatabaseService();


  double balance = 0;


  List<TransactionModel> transactions = [];




  @override
  void initState(){

    super.initState();

    loadData();

  }





  void loadData() async {


    double newBalance =
        await financeService.getBalance();



    List<TransactionModel> data =
        await databaseService.getTransactions();



    setState((){

      balance = newBalance;

      transactions = data;

    });


  }





  String getGreeting(){


    int hour = DateTime.now().hour;


    if(hour < 12){

      return "☀️ Good Morning";

    }


    if(hour < 17){

      return "🌤 Good Afternoon";

    }


    return "🌙 Good Evening";


  }






  @override
  Widget build(BuildContext context){


    return Scaffold(



      appBar: AppBar(

        title: const Text(

          "PocketGuard",

        ),

      ),




      body: SingleChildScrollView(


        child: Padding(


          padding: const EdgeInsets.all(16),



          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,



            children: [



              Text(

                getGreeting(),

                style: const TextStyle(

                  fontSize:18,

                  color:Colors.grey,

                ),

              ),




              const SizedBox(height:5),




              const Text(

                "Welcome Back 👋",

                style: TextStyle(

                  fontSize:30,

                  fontWeight:FontWeight.bold,

                ),

              ),




              const SizedBox(height:25),




              BalanceCard(

                balance:balance,

              ),




              const SizedBox(height:25),




              const Text(

                "Quick Actions",

                style:TextStyle(

                  fontSize:20,

                  fontWeight:FontWeight.bold,

                ),

              ),




              const SizedBox(height:15),




              Row(


                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,


                children: [



                  quickAction(

                    Icons.arrow_downward,

                    "Income",

                  ),



                  quickAction(

                    Icons.arrow_upward,

                    "Expense",

                  ),



                  quickAction(

                    Icons.pie_chart,

                    "Budget",

                  ),



                  quickAction(

                    Icons.savings,

                    "Savings",

                  ),



                ],


              ),




              const SizedBox(height:25),




              const BudgetCard(

                category:"Food Budget",

                spent:150,

                limit:500,

              ),




              const SizedBox(height:20),




              const SavingsCard(

                goal:"Laptop Savings",

                saved:500,

                target:2000,

              ),




              const SizedBox(height:25),




              SizedBox(


                width:double.infinity,



                child:ElevatedButton.icon(



                  onPressed:(){



                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder:(context)=>
                        const TransactionScreen(),

                      ),

                    ).then((value){

                      loadData();

                    });


                  },



                  icon:const Icon(Icons.add),



                  label:const Text(

                    "Add Transaction",

                  ),


                ),

              ),





              const SizedBox(height:25),




              const Text(

                "Recent Transactions",

                style:TextStyle(

                  fontSize:22,

                  fontWeight:FontWeight.bold,

                ),

              ),




              const SizedBox(height:10),





              transactions.isEmpty


              ? const Text(

                  "No transactions yet",

                )



              : Column(


                  children: transactions.map((item){


                    return TransactionTile(

                      transaction:item,

                    );


                  }).toList(),


                ),



            ],


          ),


        ),


      ),



    );


  }






  Widget quickAction(

      IconData icon,

      String title,

      ){


    return Column(


      children: [



        Container(


          height:55,

          width:55,


          decoration:BoxDecoration(


            color:const Color(0xFF2E7D32),

            borderRadius:BorderRadius.circular(18),


          ),



          child:Icon(

            icon,

            color:Colors.white,

          ),


        ),




        const SizedBox(height:8),




        Text(

          title,

          style:const TextStyle(

            fontSize:12,

          ),

        ),



      ],


    );


  }


}