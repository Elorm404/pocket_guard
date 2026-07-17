import 'package:flutter/material.dart';

import '../models/transaction_model.dart';



class TransactionTile extends StatelessWidget {


  final TransactionModel transaction;



  const TransactionTile({

    super.key,

    required this.transaction,

  });





  @override
  Widget build(BuildContext context) {


    bool isIncome = transaction.type == "Income";



    return Container(


      margin: const EdgeInsets.only(bottom:12),



      padding: const EdgeInsets.all(16),



      decoration: BoxDecoration(


        color: Colors.white,


        borderRadius: BorderRadius.circular(18),



        boxShadow: const [


          BoxShadow(


            color: Colors.black12,


            blurRadius: 6,


            offset: Offset(0,3),


          ),


        ],


      ),





      child: Row(



        children: [



          Container(


            height:50,


            width:50,



            decoration: BoxDecoration(


              color: isIncome

                  ? Colors.green.shade100

                  : Colors.red.shade100,



              borderRadius: BorderRadius.circular(15),


            ),




            child: Icon(



              isIncome

                  ? Icons.arrow_downward

                  : Icons.arrow_upward,



              color: isIncome

                  ? Colors.green

                  : Colors.red,



            ),



          ),




          const SizedBox(width:15),





          Expanded(


            child:Column(



              crossAxisAlignment: CrossAxisAlignment.start,



              children:[




                Text(



                  transaction.title,



                  style:const TextStyle(



                    fontSize:17,


                    fontWeight:FontWeight.bold,



                  ),



                ),





                const SizedBox(height:5),





                Text(



                  "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",



                  style:const TextStyle(



                    color:Colors.grey,


                    fontSize:13,



                  ),



                ),





              ],



            ),



          ),





          Text(



            "${isIncome ? '+' : '-'} GH₵ ${transaction.amount.toStringAsFixed(2)}",



            style:TextStyle(



              fontSize:16,


              fontWeight:FontWeight.bold,



              color:isIncome

                  ? Colors.green

                  : Colors.red,



            ),



          ),



        ],



      ),



    );


  }


}