import 'package:chat_box/utils/app_images.dart';

class ContactModel {
  final String image;
  final String name;
  final String? desc;
  bool isSelect;
  int? index;

  ContactModel(
      {required this.image,
      required this.name,
      this.index,
      this.desc,
      this.isSelect = false});
}

List<ContactModel> demoContact = [
  ContactModel(
      index: 0,
      image: AppImages.img1,
      isSelect: false,
      name: 'Smile vavadiya',
      desc: 'Flutter Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img,
      isSelect: false,
      name: 'Tushar sheldiya',
      desc: 'Flutter Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img1,
      isSelect: false,
      name: 'Yash mangukiya',
      desc: 'React Developer'),
  ContactModel(
      index: 0,
      isSelect: false,
      image: AppImages.img,
      name: 'Chintan vavadiya',
      desc: 'Kangen Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img1,
      isSelect: false,
      name: 'Ronaldo kristiano',
      desc: 'Football Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img,
      isSelect: false,
      name: 'Smit vavadiya',
      desc: 'Flutter Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img1,
      isSelect: false,
      name: 'jenish shabhadiya',
      desc: 'garage Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img,
      isSelect: false,
      name: 'Smile vavadiya',
      desc: 'Flutter Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img1,
      isSelect: false,
      name: 'Smile vavadiya',
      desc: 'Flutter Developer'),
  ContactModel(
      index: 0,
      image: AppImages.img,
      isSelect: false,
      name: 'Smile vavadiya',
      desc: 'Flutter Developer'),
];
