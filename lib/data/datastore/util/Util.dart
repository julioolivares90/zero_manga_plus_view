String getUrlFromImage(String imageUrl){
  if (imageUrl.isEmpty){
    return "";
  }
  var url = imageUrl.split("//");

  if(url.length > 0){
    return "https://${url[1]}";
  }
  return imageUrl;

}