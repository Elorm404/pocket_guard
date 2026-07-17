import '../models/transaction_model.dart';
import 'database_service.dart';


class FinanceService {


  final DatabaseService databaseService = DatabaseService();



  Future<double> getBalance() async {


    List<TransactionModel> transactions =
        await databaseService.getTransactions();



    double balance = 0;



    for(var transaction in transactions){


      if(transaction.type == "Income"){

        balance += transaction.amount;

      }

      else{

        balance -= transaction.amount;

      }


    }


    return balance;


  }



}