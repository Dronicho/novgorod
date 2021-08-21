// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../gradient_border.dart';
// import '../image_loader.dart';

// class MultiUploadField<B extends BlocBase<S>, S> extends StatefulWidget {
//   const MultiUploadField(
//       {Key? key,
//       this.buildWhen,
//       required this.title,
//       required this.onChanged,
//       required this.valueGetter})
//       : super(key: key);

//   final BlocBuilderCondition<S>? buildWhen;
//   final InitValueGetter<S, List<SendingAttachment>?> valueGetter;
//   final String title;
//   final StateValueChanged<S, List<SendingAttachment>> onChanged;

//   @override
//   _MultiUploadFieldState createState() => _MultiUploadFieldState<B, S>();
// }

// class _MultiUploadFieldState<B extends BlocBase<S>, S>
//     extends State<MultiUploadField<B, S>> {
//   List<SendingAttachment> _files = [];

//   bool get loaded => _files.every((element) => element.uploaded);

//   void _loadFiles(S state) {
//     ImageLoader.of(context)!.uploadFiles((url, file) {
//       print(url);
//       print(file);
//       if (url == null) {
//         setState(() {
//           _files.add(SendingAttachment(file: File(file.path!)));
//         });
//       }
//       if (url != null) {
//         setState(() {
//           _files = _files.map((e) {
//             if (e.file.path == file.path!) {
//               return SendingAttachment(
//                   file: File(e.file.path), url: url, uploaded: true);
//             }
//             return e;
//           }).toList();
//         });
//         if (_files.every((element) => element.uploaded)) {
//           widget.onChanged(state, _files);
//         }
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _files = widget.valueGetter(context.read<B>().state) ?? [];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     BlocWidgetBuilder<S> builder;

//     if (_files.isNotEmpty) {
//       builder = (context, state) => GradientBorderContainer(
//             strokeWidth: 1,
//             radius: 8,
//             child: Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Wrap(
//                   children: _files
//                       .map((e) => Chip(
//                             deleteIcon: Icon(Icons.close),
//                             onDeleted: () {
//                               setState(() {
//                                 _files = _files
//                                     .where((f) => f.file.path != e.file.path)
//                                     .toList();
//                                 widget.onChanged(
//                                     context.read<B>().state, _files);
//                               });
//                             },
//                             label: Text(e.file.path.split('/').last),
//                           ))
//                       .toList(),
//                 ),
//               ),
//             ),
//           );
//     }
//     if (_files.isEmpty) {
//       builder = (context, state) => GradientBorderContainer(
//           strokeWidth: 1,
//           radius: 8,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(widget.title, style: TextStyle(fontSize: 16)),
//                 Text('нажмите, чтобы выбрать файлы')
//               ],
//             ),
//           ),
//           onPressed: () {
//             _loadFiles(state);
//           });
//     } else if (!loaded) {
//       builder = (context, state) => GradientBorderContainer(
//             strokeWidth: 1,
//             radius: 8,
//             child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width - 45,
//                   child: LinearProgressIndicator(
//                     value: _files.fold<int>(
//                             0,
//                             (previousValue, element) =>
//                                 previousValue + (element.uploaded ? 1 : 0)) /
//                         _files.length,
//                   ),
//                 )),
//           );
//     } else {
//       builder = (context, state) => GradientBorderContainer(
//             strokeWidth: 1,
//             radius: 8,
//             child: Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Wrap(
//                   children: _files
//                       .map((e) => Chip(
//                             deleteIcon: Icon(Icons.close),
//                             onDeleted: () {
//                               setState(() {
//                                 _files = _files
//                                     .where((f) => f.file.path != e.file.path)
//                                     .toList();
//                                 widget.onChanged(state, _files);
//                               });
//                             },
//                             label: Text(e.file.path.split('/').last),
//                           ))
//                       .toList(),
//                 ),
//               ),
//             ),
//           );
//     }

//     return BlocBuilder<B, S>(
//       builder: builder,
//       buildWhen: widget.buildWhen ?? (previous, current) => widget.valueGetter(previous) != widget.valueGetter(current),
//     );
//   }
// }
