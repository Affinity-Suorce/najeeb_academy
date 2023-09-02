const baseUrl = "http://stage.najeeb-edu.sy/api/";
const loginUrl = "${baseUrl}login";
const userInfoUrl = "${baseUrl}user";
const registerUrl = "${baseUrl}register";
const allCoursesUrl = "${baseUrl}my_classes";
const myCoursesUrl = "${baseUrl}my_class";
const guestCoursesUrl = "${baseUrl}my_public_classes";
const myNotificationsAllUrl = "${baseUrl}my_notifications_all";
const myNotificationsUnseenUrl = "${baseUrl}my_notifications_unseen";
const myNotificationsUrl = "${baseUrl}my_notifications";
const myPaymentsUrl = "${baseUrl}my_payments";
const myClassesOrderCreateUrl = "${baseUrl}class_order_create";
const eventsUrl = "${baseUrl}time_table";
const getNumberOfViews = "${baseUrl}getTodayAttendences";
const setNumberOfViews = "${baseUrl}setAttendence";
String videoUrl(String id) {
  return "${baseUrl}lecture/$id";
}
