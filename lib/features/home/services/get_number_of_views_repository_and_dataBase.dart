
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/core/error/exceptions.dart';
import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/home/bloc/home_bloc.dart';

abstract class BaseDataSource<T,Parameter>{
  Future<T> call(Parameter parameter);
}

class GetNumberOfViewsDataSource extends BaseDataSource<int,GetNumberOfViewsEvent>{

  GetNumberOfViewsDataSource();

  @override
  Future<int> call(GetNumberOfViewsEvent parameter) async {
    try{
      final response = await Dio().get(getNumberOfViews,
          options: Options (
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType:ResponseType.json,
              headers: {"Authorization":"Bearer ${DI.userInfo.token}"}
          ));
      final data = response.data;
      if (response.statusCode == 200) {
        return data["data"][0];
      }
      throw getResponseMessage(data);
    }catch (e) {
      throw 'خطأ غير معروف';
    }
  }
}

class SetNumberOfViewsDataSource extends BaseDataSource<String,SetNumberOfViewsEvent>{

  SetNumberOfViewsDataSource();

  @override
  Future<String> call(SetNumberOfViewsEvent parameter) async {
    try{
      final response = await Dio().post("$setNumberOfViews/${parameter.numberOfVideoView}",
          options: Options (
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType:ResponseType.json,
              headers: {"Authorization":"Bearer ${DI.userInfo.token}"}
          ));
      final data = response.data;
      if (response.statusCode == 200) {
        return "Success";
      }
      throw getResponseMessage(data);
    }catch (e) {
      throw 'خطأ غير معروف';
    }
  }
}

abstract class BaseRepositoryGetNumberOfViews<T,Parameter>{
  Future<Either<Failure,T>> call(Parameter parameter);
}

abstract class BaseRepositorySetNumberOfViews<T,Parameter>{
  Future<Either<Failure,T>> call(Parameter parameter);
}

class GetNumberOfViewsRepository extends BaseRepositoryGetNumberOfViews<int,GetNumberOfViewsEvent>{
final BaseDataSource<int,GetNumberOfViewsEvent> baseDataSource;


GetNumberOfViewsRepository(this.baseDataSource);

  @override
  Future<Either<Failure,int>> call(GetNumberOfViewsEvent parameter) async {
    try {
      final result = await baseDataSource(parameter);
      return Right(result);
    } on HttpException catch (e) {
      return Left(HttpFailure(e.message));
    } on Exception {
      return Left(ServerFailure());
    }
  }

}

class SetNumberOfViewsRepository extends BaseRepositorySetNumberOfViews<String,SetNumberOfViewsEvent>{
  final BaseDataSource<String,SetNumberOfViewsEvent> baseDataSource;


  SetNumberOfViewsRepository(this.baseDataSource);

  @override
  Future<Either<Failure,String>> call(SetNumberOfViewsEvent parameter) async {
    try {
      final result = await baseDataSource(parameter);
      return Right(result);
    } on HttpException catch (e) {
      return Left(HttpFailure(e.message));
    } on Exception {
      return Left(ServerFailure());
    }
  }

}