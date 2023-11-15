library views;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/configs/routes/routes.dart';
import 'package:todo_app/src/core/utils/db_utils.dart';
import 'package:todo_app/src/core/utils/snakbar_utils.dart';
import 'package:todo_app/src/presentations/widgets/widgets.dart';

import '../../data/models/models.dart';
import '../../domain/entities/entities.dart';
import '../values/values.dart';
import 'home/components/empty_todo_item.dart';
import 'home/components/home_item.dart';
import 'home/components/todo_item.dart';

//Home
part 'home/sections/home_section.dart';
part 'todo_create/sections/todo_create_section.dart';
