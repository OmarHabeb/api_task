import 'package:api_task/model/products_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());
  List<Products> products = [];
  List<String> c = [];
  static GetDataCubit get(context) => BlocProvider.of(context);

  res() async {
    try {
      var response = await Dio().get("https://fakestoreapi.com/products");
      if (response.statusCode == 200) {
        print("done");
        var data = response.data as List;
        for (var index in data) {
          products.add(Products.fromJson(index));
        }
        emit(get_done());
      }
    } catch (e) {
      print(e);
    }
  }

  res2() async {
    try {
      var response =
          await Dio().get("https://fakestoreapi.com/products/categories");
      if (response.statusCode == 200) {
        print("done");
        var data = response.data;
        for (var index in data) {
          c.add(index);
        }
        emit(get_done2());
      }
    } catch (e) {
      print(e);
    }
  }


}
