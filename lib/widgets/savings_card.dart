import 'package:flutter/material.dart';


class SavingsCard extends StatelessWidget {


  final String goal;

  final double saved;

  final double target;



  const SavingsCard({

    super.key,

    required this.goal,

    required this.saved,

    required this.target,

  });




  @override
  Widget build(BuildContext context) {


    double progress = saved / target;



    return Container(


      padding:const EdgeInsets.all(20),



      decoration:BoxDecoration(


        color:Colors.white,


        borderRadius:BorderRadius.circular(20),



        boxShadow:const [

          BoxShadow(

            color:Colors.black12,

            blurRadius:8,

            offset:Offset(0,4),

          ),

        ],


      ),





      child:Column(



        crossAxisAlignment:CrossAxisAlignment.start,



        children:[



          Row(



            children:[



              Container(


                padding:const EdgeInsets.all(10),


                decoration:BoxDecoration(


                  color:Colors.green.shade100,


                  borderRadius:BorderRadius.circular(12),


                ),



                child:const Icon(


                  Icons.savings,


                  color:Color(0xFF2E7D32),


                ),


              ),




              const SizedBox(width:12),





              Text(


                goal,


                style:const TextStyle(


                  fontSize:18,


                  fontWeight:FontWeight.bold,


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


            color:Colors.orange,


          ),




          const SizedBox(height:12),




          Text(


            "Saved GH₵ ${saved.toStringAsFixed(2)} / GH₵ ${target.toStringAsFixed(2)}",


            style:const TextStyle(

              fontSize:15,

            ),


          ),




        ],


      ),



    );


  }


}