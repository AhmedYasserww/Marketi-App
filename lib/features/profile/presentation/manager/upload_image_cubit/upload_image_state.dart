abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {
  final String imageUrl;
  UploadImageSuccess(this.imageUrl);
}

class UploadImageFailure extends UploadImageState {
  final String error;
  UploadImageFailure(this.error);
}
