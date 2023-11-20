// import 'dart:io';
//
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:route_social_app/Features/home/presentation/cubit/search_state.dart';
// import 'package:stream_transform/stream_transform.dart';
//
// import '../../domain/entities/post.dart';
// import '../../domain/use_cases/get_users.dart';
//
//
//
// part 'search_event.dart';
//
// const _duration = const Duration(milliseconds: 1000);
//
// EventTransformer<Event> debounce<Event>(Duration duration) {
//   return (events, mapper) => events.debounce(duration).switchMap(mapper);
// }
//
// // EventTransformer<E> throttleDroppable<E>(Duration duration) {
// //   return (events, mapper) {
// //     return events.throttle(duration).switchMap(mapper);
// //   };
// // }
//
// class SearchBloc extends Bloc<SearchEvent, SearchState> {
//   SearchBloc( this._getUsersUseCase) : super(SearchStateEmpty()) {
//     on<TextChanged>(onTextChanged, transformer: debounce(_duration));
//   }
//
//   final GetUsersUseCase _getUsersUseCase;
//   List<Post> newPosts = [];
//
//   void onTextChanged(
//     TextChanged event,
//     Emitter<SearchState> emit,
//   ) async {
//     final searchTerm = event.text;
//
//     emit(SearchStateLoading());
//
//     try {
//       final response = _getUsersUseCase.call()?.then((value) => value?.fold((l) => null, (r) async {
//         await for (final posts in r) {
//           if (searchTerm.isEmpty) {
//             if (posts.isEmpty) {
//               emit(SearchStateEmpty());
//             } else {
//               newPosts = posts;
//               // DataLists.id = posts.length;
//               // print(DataLists.id);
//               emit(SearchStateSuccess(newPosts ?? []));
//             }
//           } else {
//             newPosts = posts.where((post) {
//               final name = post.name!.toLowerCase();
//               final input = searchTerm.toLowerCase();
//               return name.startsWith(input);
//             }).toList();
//             if (newPosts.isEmpty) {
//               emit(SearchStateEmpty());
//             } else {
//               emit(SearchStateSuccess(newPosts ?? []));
//             }
//           }
//         }
//       }));
//       // await for (final posts in response) {
//       //   if (searchTerm.isEmpty) {
//       //     if (posts.isEmpty) {
//       //       emit(SearchStateEmpty());
//       //     } else {
//       //       newPatients = patients;
//       //       DataLists.id = patients.length;
//       //       print(DataLists.id);
//       //       emit(SearchStateSuccess(newPatients ?? []));
//       //     }
//       //   } else {
//       //     newPatients = patients.where((patient) {
//       //       final name = patient.name!.toLowerCase();
//       //       final input = searchTerm.toLowerCase();
//       //       return name.startsWith(input);
//       //     }).toList();
//       //     if (newPatients.isEmpty) {
//       //       emit(SearchStateEmpty());
//       //     } else {
//       //       emit(SearchStateSuccess(newPatients ?? []));
//       //     }
//       //   }
//       // }
//       // patientRepository.getAllPatients().listen((patients) {
//       //
//       // });
//     } on SocketException catch (_) {
//       emit(SearchStateError('there is an error'));
//     } catch (_) {
//       emit(SearchStateError('there is an error'));
//     }
//   }
//
//   detailsMethod(int index) {
//     switch (newPatients?[index].diet) {
//       case 'average':
//         newPatients?[index].diet = 'average diet';
//         break;
//       case 'decrease':
//         newPatients?[index].diet = 'decrease diet';
//         break;
//       case 'increase':
//         newPatients?[index].diet = 'increase diet';
//     }
//     switch (newPatients?[index].sleep) {
//       case 'average':
//         newPatients?[index].sleep = 'average sleep';
//         break;
//       case 'decrease':
//         newPatients?[index].sleep = 'decrease sleep';
//         break;
//       case 'increase':
//         newPatients?[index].sleep = 'increase sleep';
//     }
//
//     switch (newPatients?[index].amount) {
//       case 'average':
//         newPatients?[index].amount = 'average amount';
//         break;
//       case 'decrease':
//         newPatients?[index].amount = 'decrease amount';
//         break;
//       case 'increase':
//         newPatients?[index].amount = 'increase amount';
//     }
//     switch (newPatients?[index].duration) {
//       case 'average':
//         newPatients?[index].duration = 'average duration';
//         break;
//       case 'decrease':
//         newPatients?[index].duration = 'decrease duration';
//         break;
//       case 'increase':
//         newPatients?[index].duration = 'increase duration';
//     }
//     switch (newPatients?[index].smoking) {
//       case 'heavy':
//         newPatients?[index].smoking = 'heavy smoking';
//         break;
//       case 'mild':
//         newPatients?[index].smoking = 'mild smoking';
//         break;
//       case 'increase':
//         newPatients?[index].smoking = 'increase smoking';
//     }
//     if (newPatients?[index].regular == 'yes') {
//       newPatients?[index].regular = 'regular';
//     }
//   }
//
//   Future<void> deletePatientFile(
//       BuildContext context, PatientModel patientModel) async {
//     try {
//       final response = patientRepository.deletePatient(patientModel);
//       response.then((patient) {
//         debugPrint('deleted Success');
//       });
//     } on SocketException catch (_) {}
//   }
// }
