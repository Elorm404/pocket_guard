import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {

  final String category;
  final double spent;
  final double limit;


  const BudgetCard({

    super.key,

    required this.category,

    required this.spent,

    required this.limit,

  });



  @override
  Widget build(BuildContext context) {


    double progress = spent / limit;


    return Container(

      padding: const EdgeInsets.all(20),


      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),


        boxShadow: const [

          BoxShadow(

            color: Colors.black12,

            blurRadius: 8,

            offset: Offset(0,4),

          ),

        ],

      ),



      child: Column(


        crossAxisAlignment: CrossAxisAlignment.start,


        children: [



          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,


            children: [


              Row(

                children: const [

                  Icon(

                    Icons.account_balance_wallet,

                    color: Color(0xFF2E7D32),

                  ),

                  SizedBox(width:10),

                ],

              ),



              Text(

                category,

                style: const TextStyle(

                  fontSize:18,

                  fontWeight:FontWeight.bold,

                ),

              ),



              Text(

                "GH₵ ${limit.toStringAsFixed(0)}",

                style: const TextStyle(

                  color:Colors.grey,

                ),

              ),

            ],

          ),




          const SizedBox(height:20),




          LinearProgressIndicator(


            value:progress.clamp(0,1),


            minHeight:10,


            borderRadius:BorderRadius.circular(10),


            backgroundColor:Colors.grey.shade200,


            color:const Color(0xFF2E7D32),


          ),





          const SizedBox(height:12),





          Text(

            "Spent: GH₵ ${spent.toStringAsFixed(2)}",

            style:const TextStyle(

              fontSize:15,

            ),

          ),



        ],


      ),

    );


  }

}