import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

const double _kMinFlingVelocity = 700.0;
const double _kMinFlingVelocityDelta = 400.0;
const double _kFlingVelocityScale = 1.0 / 300.0;
const double _kDismissThreshold = 0.4;

class ImagePage extends StatefulWidget {
  final String id;
  final ImageProvider image;
  final double height;
  const ImagePage(
      {Key? key, required this.height, required this.image, required this.id})
      : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _moveController;
  late Animation<Offset> _moveAnimation;
  late Animation<double> _opacityAnimation;
  late PhotoViewController _photoViewController;
  late PhotoViewScaleState _scaleState = PhotoViewScaleState.initial;

  double _dragExtent = 0.0;
  // ignore: unused_field
  bool _dragUnderway = false;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    _photoViewController = PhotoViewController();
    _moveController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this)
          ..addStatusListener(_handleDismissStatusChanged);
    _updateMoveAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    _moveController.dispose();
    _photoViewController.dispose();
  }

  double get _overallDragAxisExtent {
    final Size size = context.size!;
    return size.height;
  }

  @override
  Widget build(BuildContext context) {
    print(_opacityAnimation.value);
    return GestureDetector(
      onVerticalDragStart: _handleDragStart,
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      key: Key('image_' + widget.id),
      child: Stack(
        children: [
          FadeTransition(
            opacity: _opacityAnimation,
            child: Container(
              color: Colors.black,
            ),
          ),
          SlideTransition(
            position: _moveAnimation,
            child: Center(
                child: PhotoViewGestureDetectorScope(
              axis: Axis.vertical,
              child: PhotoView(
                backgroundDecoration: BoxDecoration(color: Colors.transparent),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 5,
                scaleStateChangedCallback: (value) {
                  _scaleState = value;
                },
                heroAttributes: PhotoViewHeroAttributes(tag: widget.id),
                imageProvider: widget.image,
              ),
            )),
          ),
        ],
      ),
    );
  }

  RectTween createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  bool get _canDrag => _scaleState == PhotoViewScaleState.initial;

  void _handleDragStart(DragStartDetails details) {
    _dragUnderway = true;
    if (_moveController.isAnimating) {
      _dragExtent =
          _moveController.value * _overallDragAxisExtent * _dragExtent.sign;
      _moveController.stop();
    } else {
      _dragExtent = 0.0;
      _moveController.value = 0.0;
    }
    setState(() {
      _updateMoveAnimation();
    });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_moveController.isAnimating) {
      return;
    }

    final delta = details.primaryDelta!;
    final oldDragExtent = _dragExtent;
    if (_dragExtent + delta > 0) {
      _dragExtent += delta;
    }
    if (oldDragExtent.sign != _dragExtent.sign) {
      if (_canDrag) {
        setState(() {
          _updateMoveAnimation();
          opacity = _dragExtent / _overallDragAxisExtent;
        });
      }
    }
    if (!_moveController.isAnimating) {
      _moveController.value = _dragExtent.abs() / _overallDragAxisExtent;
    }
  }

  _FlingGestureKind _describeFlingGesture(Velocity velocity) {
    if (_dragExtent == 0.0) {
      return _FlingGestureKind.none;
    }
    final vx = velocity.pixelsPerSecond.dx;
    final vy = velocity.pixelsPerSecond.dy;
    DismissDirection flingDirection;
    if (vy.abs() - vx.abs() < _kMinFlingVelocityDelta ||
        vy.abs() < _kMinFlingVelocity) {
      return _FlingGestureKind.none;
    }
    assert(vy != 0.0);
    flingDirection = _extentToDirection(vy);
    if (flingDirection == _dismissDirection) {
      return _FlingGestureKind.forward;
    }
    return _FlingGestureKind.reverse;
  }

  DismissDirection _extentToDirection(double extent) {
    if (extent == 0.0) {
      return DismissDirection.none;
    }
    return extent > 0 ? DismissDirection.down : DismissDirection.up;
  }

  DismissDirection get _dismissDirection => _extentToDirection(_dragExtent);

  void _handleDragEnd(DragEndDetails details) {
    if (_moveController.isAnimating &&
        _scaleState != PhotoViewScaleState.initial) {
      return;
    }
    _dragUnderway = false;
    final flingVelocity = details.velocity.pixelsPerSecond.dy;
    switch (_describeFlingGesture(details.velocity)) {
      case _FlingGestureKind.forward:
        assert(_dragExtent != 0.0);
        assert(!_moveController.isDismissed);
        if ((_kDismissThreshold) >= 1.0) {
          if (_canDrag) {
            _moveController.reverse();
          }
          break;
        }
        _dragExtent = flingVelocity.sign;
        if (_canDrag) {
          _moveController.fling(
              velocity: flingVelocity.abs() * _kFlingVelocityScale);
          Navigator.of(context).pop();
        }

        break;
      case _FlingGestureKind.reverse:
        assert(_dragExtent != 0.0);
        assert(!_moveController.isDismissed);
        _dragExtent = flingVelocity.sign;
        if (_canDrag) {
          _moveController.fling(
              velocity: -flingVelocity.abs() * _kFlingVelocityScale);
        }

        break;
      case _FlingGestureKind.none:
        if (!_moveController.isDismissed) {
          if (_canDrag) {
            if (_moveController.value > (_kDismissThreshold)) {
              Navigator.of(context).pop();
            } else {
              _moveController.reverse();
            }
          }
        }
        break;
    }
  }

  void _handleDismissStatusChanged(AnimationStatus status) {}

  void _updateMoveAnimation() {
    final end = _dragExtent.sign;
    if (_scaleState == PhotoViewScaleState.initial)
      _opacityAnimation = _moveController
          .drive(Tween<double>(begin: 1, end: _dragExtent / widget.height * 2));
    _moveAnimation = _moveController.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: Offset(0.0, end),
      ),
    );
  }
}

enum _FlingGestureKind { none, forward, reverse }

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({required this.page})
      : super(
          opaque: false,
          reverseTransitionDuration: Duration(milliseconds: 100),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
