const baseUrl = "http://najeeb-edu.sy/api/";
const loginUrl = "${baseUrl}login";
const userInfoUrl = "${baseUrl}user";
const registerUrl = "${baseUrl}register";
const allCoursesUrl = "${baseUrl}my_classes";
const myCoursesUrl = "${baseUrl}my_class";
const myNotificationsAllUrl = "${baseUrl}my_notifications_all";
const myNotificationsUnseenUrl = "${baseUrl}my_notifications_unseen";
const myNotificationsUrl = "${baseUrl}my_notifications";
const myPaymentsUrl = "${baseUrl}my_payments";
const myClassesOrderCreateUrl = "${baseUrl}student/ClassesOrderCreate";
const eventsUrl = "${baseUrl}time_table";
String videoUrl(String id) {
  return "${baseUrl}lecture/$id";
}
