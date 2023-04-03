import "package:flutter/material.dart";
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key, this.isInLogin = false}) : super(key: key);
  final bool isInLogin;
  @override
  Widget build(BuildContext context) {
    double sp = 8.0;
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              getTextHeader('تمهيد:'),
              getText1(
                  "توضح هذه الصفحة بنود سياسة خصوصية تطبيق 'نجيب' وكيفية تعاملها مع بيانات المستخدمين. مجرد استخدامك للتطبيق وخدماته يعتبر موافقة منك على بنود هذه السياسة، فلذلك يرجى قراءة واستيعاب ما تحويه السياسة قبل الاستخدام."),
              getTextHeader("الخدمة المقدمة :"),
              getText1(
                  "يقدم نجيب خدمة دورات مدفوعة متنوعة يتم الاشتراك بها مقابل مبلغ محدد ويتم وضع المحاضرات بشكل يومي وفقا لبرنامج اسبوعي محدد لكل طالب بحسب المواد المشترك بها ويتم إرسال إشعارات للطالب عند الضرورة"),
              getTextHeader("جمع المعلومات واستخدامها:"),
              getText1(
                  "لم نقم بتصميم هذا التطبيق من أجل تجميع بياناتك الشخصية وإنما سيتم فقط استخدام البيانات المقدمة من قبلك بمعرفتك ومحض ارادتك ، قد نطلب منك تزويدنا ببعض المعلومات الشخصية بما في ذلك على سبيل المثال : رقم الجوال ، رقم الهاتف الارضي، رقم ولي الامر , المدينة , الاسم الثلاثي. وسيتم الاحتفاظ بهذه المعلومات على جهازك وعلى مساحة التخزين في الخادم ولن يتم جمعها او استخدامها او الإطلاع عليها بأي طريقة"),
              SizedBox(height: sp),
              getText1(
                  "نستخدم هذه المعلومات بغية حرصنا على استمرار الخدمة ومعالجة المشاكل الطارئة ومتابعة العملية التعليمية مع ولي الأمر ومعكم"),
              getTextHeader("ملفات تعريف الارتباط:"),
              getText1(
                  "'نجيب' يستخدم مثل هذه الملفات فقط من أجل السماح لكم باستخدام التطبيق بدون طلب معلومات الدخول في كل مرة"),
              getTextHeader("تسجيل البيانات:"),
              getText1(
                  "نرغب بإبلاغك أنه عند استخدامك للتطبيق يتم تسجيل المعلومات المطلوبة بخصوص متابعتك للدروس الموجودة فقط"),
              getTextHeader("أمان وسرية المعلومات:"),
              getText1(
                  "نحن نقدر ثقتك لتزويدنا بمعلوماتك الشخصية، ولذلك نحن نسعى جاهدين لحمايتها والحفاظ عليها من سوء الاستخدام والفقد."),
              SizedBox(height: sp),
              getText1(
                  "ولن يتم إفشاء هذه المعلومات إلا إذا كان ذلك مطلوبا بموجب القانون أو لغرض الدفاع او حماية حقوق الملكية الخاصة بهذا الموقع أو الجهات المستفيدة منه"),
              SizedBox(height: sp),
              getText1(
                  "وبرغم التزامنا بحماية معلوماتكم ومتابعة التحديثات وسد الثغرات بشكل مستمر إلا أنه لايمكن ضمان ذلك بصورة كاملة "),
              getTextHeader("معلومات الدخول :"),
              getText1(
                  "نحن كتطبيق نجيب ملتزمون بتقديم معلومات الدخول برسالة نصية إلى رقم جوال الطالب وذلك بعد تسديد قيمة القسط عبر إحدى وسائل الدفع لذلك تقع مسؤولية الوصول إلى الرسالة والتحقق من الرقم على عاتق المستخدم وكذلك مسؤولية السداد إلى الرقم الصحيح لحسابنا على عاتق المستخدم"),
              SizedBox(height: sp),
              getText1(
                  "  تطبيق نجيب يلتزم بالاستمرار بتقديم خدمته إلا في حال الظروف القاهرة الخارجة عن إرادته ويلتزم باتخاذ الإجراءات التي من شأنها تقليل هذا الاحتمال إلى حد كبير "),
              SizedBox(height: sp),
              getText1("لا يمكن استخدام نفس معلومات الدخول لأكثر من جهاز"),
              getTextHeader("حماية الملكية"),
              getText1("حماية الملكية"),
              getTextHeader("إجراء تعديلات على سياسة الخصوصية:"),
              getText1(
                  "قد نقوم بتعديل بنود سياسة الخصوصية من وقت لآخر، لذلك نرجو مراجعتك لهذه الصفحة بشكل دوري تحسبا لأي تغيير قد يطرأ عليها. التغييرات الجديدة سيتم تفعيلها فوريا بعد اضافتها في هذه الصفحة."),
              getTextHeader("تواصل معنا:"),
              getText1(
                  "نرحب بتلقي كافة الملاحظات والاستفسارات والاقتراحات المتعلقة بسياسة خصوصية 'نجيب' على البريد الإلكتروني"),
              getTextHeader("najeeb@najeeb-nb.sy"),
              SizedBox(height: sp),
              
            ],
          ),
        ),
      );
  }

  Padding getText1(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 14,
          height: 1.2,
          color: Colors.black,
        ),
      ),
    );
  }

  Padding getTextHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 2,
            color: Colors.black),
      ),
    );
  }
}
