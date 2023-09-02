import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/core/Enum/enum.dart';
import 'package:najeeb_academy/core/error/failures.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoad()) {
    on<GetNumberOfViewsEvent>(_getNumberOfViews);
    on<SetNumberOfViewsEvent>(_setNumberOfViews);
  }

  FutureOr<void> _getNumberOfViews(GetNumberOfViewsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoad());
    final response = await DI.getNumberOfViewsRepository(event);
    response.fold(
            (l) => emit(GetNumberOfViewsState(requestState: RequestState.error,failure: l)),
            (r) => emit(GetNumberOfViewsState(requestState: RequestState.loaded,numberOfViews: r)));

  }

  FutureOr<void> _setNumberOfViews(SetNumberOfViewsEvent event, Emitter<HomeState> emit) async {
    final response = await DI.setNumberOfViewsRepository(event);
  }
}
