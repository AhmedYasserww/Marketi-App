import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/core/service_locator/service_locator.dart';
import 'package:marketi_app/features/profile/data/repos/profile_repo_imp.dart';
import 'package:marketi_app/features/profile/presentation/manager/profile_details_cubit.dart';
import 'package:marketi_app/features/profile/presentation/manager/upload_image_cubit/upload_image_cubit.dart';
import 'package:marketi_app/features/profile/presentation/views/widgets/profile_details_view_body.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  static const String routeName = 'profile_details_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
          ProfileDetailsCubit(getIt.get<ProfileRepoImp>())..getProfile(),
        ),
        BlocProvider(
          create: (_) => UploadImageCubit(getIt.get<ProfileRepoImp>()),

        ),
      ],
      child: const Scaffold(
        body: ProfileDetailsViewBody(),
      ),
    );
  }
}
