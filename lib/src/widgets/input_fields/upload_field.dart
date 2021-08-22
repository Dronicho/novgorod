import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/widgets/input_fields/types.dart';
import 'package:test_map/src/widgets/shimmers/container.dart';

import '../gradient_border.dart';
import '../image_loader.dart';
import '../image_widget.dart';

class UploadField<B extends BlocBase<S>, S> extends StatefulWidget {
  UploadField(
      {Key? key,
      required this.valueGetter,
      required this.title,
      required this.onChanged,
      this.buildWhen})
      : super(key: key);

  final InitValueGetter<S, SendingAttachment?> valueGetter;
  final String title;
  final StateValueChanged<S, SendingAttachment?> onChanged;
  final BlocBuilderCondition<S>? buildWhen;

  @override
  _UploadFieldState createState() => _UploadFieldState<B, S>();
}

class _UploadFieldState<B extends BlocBase<S>, S>
    extends State<UploadField<B, S>> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return GradientBorderContainer(
        strokeWidth: 1,
        radius: 8,
        child: ContainerShimmer(),
      );
    }
    return BlocBuilder<B, S>(
      buildWhen: widget.buildWhen ??
          (previous, current) =>
              widget.valueGetter(previous) != widget.valueGetter(current),
      builder: (context, state) {
        final attachment = widget.valueGetter(state);
        print(attachment);
        if (attachment == null) {
          return GradientBorderContainer(
              strokeWidth: 1,
              radius: 8,
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                final data = await ImageLoader.of(context)!.uploadImage();
                final _attachment = SendingAttachment(
                    file: data.file!, url: data.url, uploaded: true);
                widget.onChanged(state, _attachment);
                setState(() {
                  _loading = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title, style: TextStyle(fontSize: 16)),
                    Text('нажмите, чтобы выбрать изображение')
                  ],
                ),
              ));
        }
        return GradientBorderContainer(
          strokeWidth: 1,
          radius: 8,
          child: Expanded(
              child: Hero(
            tag: 'form_image',
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(SizeRoute(
                            page: ImagePage(
                                height: MediaQuery.of(context).size.height,
                                image: MemoryImage(
                                    attachment.file.readAsBytesSync()),
                                id: 'form_image')));
                      },
                      child: Container(
                        height: 208,
                        width: double.maxFinite,
                        child: Image.memory(attachment.file.readAsBytesSync(),
                            gaplessPlayback: true, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      height: 30,
                      width: 30,
                      top: 16,
                      right: 16,
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 1,
                        highlightElevation: 0,
                        focusElevation: 0,
                        disabledElevation: 0,
                        hoverElevation: 0,
                        onPressed: () {
                          widget.onChanged(state, null);
                        },
                        fillColor: Colors.grey.withOpacity(1),
                        child: Center(
                          child:
                              Icon(Icons.close, size: 18, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          )),
        );
      },
    );
  }
}

class SendingAttachment {
  File file;
  bool uploaded;
  String url;

  SendingAttachment({required this.file, this.uploaded = false, this.url = ''});
}
