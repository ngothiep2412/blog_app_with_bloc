import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_assets.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/enums/navigation_type.dart';
import 'package:blog_app/presentation/router/router_imports.gr.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:blog_app/presentation/screens/general/categories/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

part 'add_posts.dart';
part 'add_posts_view_model.dart';
