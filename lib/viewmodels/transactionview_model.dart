import 'dart:convert';
import 'package:eduNitas/constant/constant.dart';
import 'package:eduNitas/model/Campus/PhotoModel.dart';
import 'package:eduNitas/model/transaction/transacationDonasiMode.dart';
import 'package:eduNitas/model/transaction/transactionModel.dart';
import 'package:eduNitas/model/transaction/transactionModel2.dart';
import 'package:http/http.dart' as http;

class Transactionview_model {
  Future<List> getransaction(String keycode) async {
    try {
      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "transaction2"), body: {
        'keycode': keycode.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = transaction2ModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status transaction error");
        print("error status transaction" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }

   Future<List> getransactionHistory(String keycode) async {
    try {
      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "transactionhistory"), body: {
        'keycode': keycode.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = transaction2ModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status transaction error");
        print("error status transaction" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }


   Future<List> transaction_donasi(String keycode) async {
    try {
      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "transaction_donasi"), body: {
        'keycode': keycode.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = transactionDonasiModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status transaction error");
        print("error status transaction" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }

  Future<List> transaction_donasi_history(String keycode) async {
    try {
      final hasil =
          await http.post(Uri.parse(ConstanUrl().baseUrl + "transaction_donasi_history"), body: {
        'keycode': keycode.toString(),
        //380933623c56c82e75cca70187a4415730ca7ea8
      });

      // print("ceeah${keycode}");
      if (hasil.statusCode == 200) {
        final data = transactionDonasiModelFromJson(hasil.body);
        return data;
      } else {
        print("data error status transaction error");
        print("error status transaction" + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch transaction $e");
      return null;
    }
  }
}
