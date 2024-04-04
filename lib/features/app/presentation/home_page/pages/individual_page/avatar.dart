import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/bloc/upload_picture/bloc/upload_picture_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadPictureBloc, UploadPictureState>(
      listener: (context, state) {
        if (state is UploadPictureSuccess) {
          setState(() {
            context.read<GetUserDataBloc>().state.myUser!.picture =
                state.userImage;
          });
        }
      },
      child: SizedBox(
        child: Stack(children: [
          BlocBuilder<GetUserDataBloc, GetUserDataState>(
            builder: (context, state) {
              if (state.status == GetUserStatus.success) {
                final map = state.myUser!;
                return map.picture == ''
                    ? GestureDetector(
                        onTap: () async {
                          ImagePicker picker = ImagePicker();
                          final XFile? imageFile = await picker.pickImage(
                              imageQuality: 50, source: ImageSource.gallery);
                          if (imageFile != null) {
                            context.read<UploadPictureBloc>().add(UploadPicture(
                                imageFile.path,
                                context
                                    .read<GetUserDataBloc>()
                                    .state
                                    .myUser!
                                    .userId));

                            // CroppedFile? cropped = await ImageCropper()
                            //     .cropImage(
                            //         sourcePath: imageFile.path,
                            //         uiSettings: [
                            //           AndroidUiSettings(
                            //               toolbarTitle: 'cropped'),
                            //           IOSUiSettings(title: 'cropped')
                            //         ],
                            //         aspectRatio: const CropAspectRatio(
                            //             ratioX: 1, ratioY: 1));
                            // if (cropped != null) {
                            //   context.read<UploadPictureBloc>().add(
                            //       UploadPicture(
                            //           imageFile.path,
                            //           context
                            //               .read<GetUserDataBloc>()
                            //               .state
                            //               .myUser!
                            //               .userId));
                            // }
                          }
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: const ClipOval(
                              child: Image(
                                image: AssetImage('assets/images/human.jpg'),
                                fit: BoxFit.cover,
                              ),
                            )),
                      )
                    : Container(
                        height: 150,
                        width: 150,
                        child: const ClipOval(
                          child: Image(
                            image: AssetImage('assets/images/human.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ));
              } else if (state.status == GetUserStatus.loading) {
                return Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: const ClipOval(child: CircularProgressIndicator()));
              }
              return Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const ClipOval(child: CircularProgressIndicator()));
            },
          ),
        ]),
      ),
    );
  }
}
