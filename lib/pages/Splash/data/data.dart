class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImgAssetsPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImgAssetsPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlide() {
  // ignore: deprecated_member_use
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImgAssetsPath("assets/intro/bgOnboarding1.png");
  sliderModel.setTitle("Temukan\nKampus Ideal");
  sliderModel.setDesc(
      "eduNitas sudah bekerja sama dengan kampus-kampus Perguruan Tinggi Swasta (PTS) terbaik di seluruh wilayah Indonesia dengan berbagai pilihan Program Studi dan kelas yang kamu inginkan.");

  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImgAssetsPath("assets/intro/bgOnboarding2.png");
  sliderModel.setTitle("Fitur eduNitas");
  sliderModel.setDesc(
      "Bukan kampus saja! Kamu bisa mendapatkan akses fitur-fitur yang tersedia di eduNitas, mulai dari karir, agensi, donasi, dan promosi, temukan selengkapnya !");

  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImgAssetsPath("assets/intro/bgOnboarding3.png");
  sliderModel.setTitle("Daftar Sekarang\ndi eduNitas !");
  sliderModel.setDesc(
      "Kamu akan mendapatkan benefit yang sudah disediakan eduNitas mulai dari potongan harga biaya pendaftaran kuliah, beasiswa dan lain-lain.");

  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
