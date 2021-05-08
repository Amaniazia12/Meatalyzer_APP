class SliderModel{
  String imagePath ;
  String title ;
  String desc ;
  
  SliderModel({this.imagePath,this.title,this.desc});
  void setImageAssertPath(String getImagepath)
  {
    imagePath = getImagepath;
  }
  void setTitle(String getTitle)
  {
    title = getTitle;
  }
  void setDoc(String getDoc)
  {
    desc = getDoc;
  }
  String getImageAssertPath(){
   return imagePath;
  }
  String getTitle(){
    return title;
  }
  String getDosc(){
    return desc;
  }
}
List<SliderModel> getSliders(){
   List<SliderModel> slides = new List<SliderModel>();
   SliderModel sliderModel = new SliderModel();
   //1
   sliderModel.setImageAssertPath("assets/images/meat1.jpg");
   sliderModel.setTitle("Welcome to Meatalyzer");
   sliderModel.setDoc("");
   slides.add(sliderModel);
   //2
   sliderModel = new SliderModel();
   sliderModel.setImageAssertPath("assets/images/meat2.jpg");
   sliderModel.setTitle("Description");
   sliderModel.setDoc("Meatalyzer provides the user with the ability to photograph a piece of meat and know who this animal is and is edible or not, and which part the animal");
   slides.add(sliderModel);
   //3
   sliderModel = new SliderModel();
   sliderModel.setImageAssertPath("assets/images/img10.png");
   sliderModel.setTitle("How to use the app");
   sliderModel.setDoc("At first take aphoto of  a piece of meat  and then click on the button below then wait for the result");
   slides.add(sliderModel);
   //4
   sliderModel = new SliderModel();
   sliderModel.setImageAssertPath("assets/images/img10.png");
   sliderModel.setTitle("Lets get start");
   sliderModel.setDoc("");
   slides.add(sliderModel);
   return slides;
}