class TransactionModel {


  final String id;

  final double amount;

  final String title;

  final String type;

  final DateTime date;



  TransactionModel({

    required this.id,

    required this.amount,

    required this.title,

    required this.type,

    required this.date,

  });




  Map<String, dynamic> toMap(){


    return {

      'id': id,

      'amount': amount,

      'title': title,

      'type': type,

      'date': date.toIso8601String(),

    };


  }






  factory TransactionModel.fromMap(Map<String,dynamic> map){


    return TransactionModel(


      id: map['id'],


      amount: map['amount'],


      title: map['title'],


      type: map['type'],


      date: DateTime.parse(

        map['date'],

      ),


    );


  }



}