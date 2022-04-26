import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
class ViewState with _$ViewState {
  const factory ViewState.initial() = Initial;
  const factory ViewState.loading() = Loading;
  const factory ViewState.error(
      {required String title, required String context}) = Error;
  const factory ViewState.loaded([dynamic data]) = Loaded;
}
