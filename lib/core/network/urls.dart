const baseUrl = "http://hallogen.insoftonline.de/api/";
const loginUrl = "${baseUrl}login";
const userInfoUrl = "${baseUrl}user";
const registerUrl = "${baseUrl}register";
const allCoursesUrl = "${baseUrl}my_classes";
const myCoursesUrl = "${baseUrl}my_class";
const myNotificationsAllUrl = "${baseUrl}my_notifications_all";
const myNotificationsUnseenUrl = "${baseUrl}my_notifications_unseen";
const myNotificationsUrl = "${baseUrl}my_notifications";
String videoUrl(String id) {
  return "${baseUrl}lecture/$id";
}
