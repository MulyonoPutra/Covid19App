import 'package:covid19/core/navigation/path_router.dart';

List<CategorieModel> getCategories() {
  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Hospital Reference";
  categorieModel.route = PathRouter.hospitalReference;
  categorieModel.imageAssetUrl =
      "https://img.jakpost.net/c/2020/06/18/2020_06_18_98017_1592417119._large.jpg";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Vaccine Data";
  categorieModel.route = PathRouter.totalDeath;
  categorieModel.imageAssetUrl =
      "https://s.france24.com/media/display/f5f5d498-8a2b-11ea-8e3a-005056bff430/w:1280/p:4x3/290420-vaccin-covid-oxford-m.JPG";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Global Data";
  categorieModel.route = PathRouter.totalRecover;
  categorieModel.imageAssetUrl =
      "https://army.wiser.my/wp-content/uploads/2020/03/4GSNKJPTVNEO3FOPFDPZ3DTWSM.jpg";
  myCategories.add(categorieModel);

  return myCategories;
}

class CategorieModel {
  String imageAssetUrl;
  String categorieName;
  String route;
}
