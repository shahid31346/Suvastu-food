import 'package:flutter/material.dart';

/////
bool loggedIn = false;

var kdarkOrange = Color(0xFFa31300);
var kPrimary = Color(0xFF03645D);
var kSecondaryMain = Color(0xFFF86B6B);
var kBgColor = Color(0xFFFFFFFF);
var kthirdColor = Color(0xFF33424d);
var khomeTitle = TextStyle(
    color: Colors.black87.withOpacity(0.7),
    fontWeight: FontWeight.bold,
    fontSize: 15.5,
    letterSpacing: 0.25);
var kSecondaryColor = Color(0xFFFCC8C9);
// const kBgColor = Color(0xFFF7F9F9);
var kAppBackgroundColor = Color(0xFFF1F1F1);
const kGrey = Color(0xFF808080);
const kAppGreyColor = Color(0xFF808080);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFD10016);
const kGreyColor = Color(0xFFC1C1C1);
const kWhite = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF101010);
const kBlack54 = Colors.black54;
const kBlack45 = Colors.black45;

const kSecondaryBtn = Color(0xFFE0E0E0);
const kInputBorderColor = Color(0xFFBDBDBD);

// Blue Color
const kInfoColor = Color(0xFF3080ED);
const kInfoLightColor = Color(0xFFE5F4FF);
// Green Color
const kSuccessColor = Color(0xFF3C934D);
const kSuccessLightColor = Color(0xFFE2FFEE);
// Orange Color
const kWarningColor = Color(0xFFF2994A);
const kWarningLightColor = Color(0xFFFFF6E5);
// Red Color
const kDangerColor = Color(0xFFEB5757);

///
const BlueOpacity = Color(0xFFE5F8FF);
const textColor = Color(0xFF333333);
const profileBg = Color(0xFF808080);

//////
var grey100 = Colors.grey[100];

const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF2D6974), Color(0xFF68B39F)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const drawerkPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF066162)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;

//padding section
const kAllPadding16 = EdgeInsets.all(16.0);
const kPadding = 16;
const defaultSpacing = 16.0;

const kSlidingUpPanelSpacing =
    EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0);

const kBorderRadius = BorderRadius.all(Radius.circular(8.0));
const kBorderRadius10 = BorderRadius.all(Radius.circular(10.0));

// *** Text Styling

//Header Center Title Style
var headerTitle = TextStyle(
    fontWeight: FontWeight.w500, color: kSecondaryColor, fontSize: 16.0);
var kTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w500);

//auth
var kAuthTitle = TextStyle(
    color: Colors.black.withOpacity(0.9),
    fontSize: 30,
    letterSpacing: 0.3,
    fontWeight: FontWeight.bold);

const kSubTitle = TextStyle(color: Color(0xFF828282));

const k17bold = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
const k16bold = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
const k16500 = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
const k15500 = TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500);
const k14500 = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);
const k13500 = TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500);
const k12500 = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500);

const kTextFieldTitle = TextStyle(color: Colors.black54, fontSize: 14);
const kTextPrimaryButton = TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 0.3,
  fontSize: 16,
);

//label style like change password textfield
const kLabelStyle = TextStyle(color: Colors.black, fontSize: 18);
const knormalText =
    TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400);

//black
const kBlack = TextStyle(
  color: kBlackColor,
);
const kBlack14 = TextStyle(
  color: kBlackColor,
  fontSize: 14,
);
const kBlack15 = TextStyle(
  color: kBlackColor,
  fontSize: 15,
);
const kBlack16 = TextStyle(
  color: kBlackColor,
  fontSize: 16,
);

//white
const kWhite14 = TextStyle(
  color: kWhite,
  fontSize: 14,
);
const kWhite15 = TextStyle(
  color: kWhite,
  fontSize: 15,
);
const kWhite16 = TextStyle(
  color: kWhite,
  fontSize: 16,
);
const kWhiteBold = TextStyle(color: kWhite, fontWeight: FontWeight.bold);

//grey
const kGrey14 = TextStyle(
  color: kAppGreyColor,
  fontSize: 14,
);
const kGrey15 = TextStyle(
  color: kAppGreyColor,
  fontSize: 15,
);
const kGrey16 = TextStyle(
  color: kAppGreyColor,
  fontSize: 16,
);
const kGrey15500 = TextStyle(
  color: Color.fromRGBO(158, 158, 158, 1),
  fontSize: 15,
  fontWeight: FontWeight.w500,
);
const kGreyBold = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

// Sliding up panel radius
const kTopLeftRightRadius = BorderRadius.only(
    topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0));

// input border (underlined)
const kErrorBorder =
    UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red));

var kUnderlinedBorder =
    UnderlineInputBorder(borderSide: BorderSide(width: 1, color: kPrimary));

// BoxShadow
final kBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.05),
    blurRadius: 8,
    offset: const Offset(0, 2),
    spreadRadius: 1);

// bottom sheet shape
const kBottomSheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30)));

// appbar leading icon
const kleadingIcon = Icon(
  Icons.arrow_back_ios,
  size: 20,
  color: Colors.black38,
);

const Color kPurple200 = Color(0xFFFF9F01);
const Color kPurple500 = Color(0xFFFF9F01);
const Color kPurple700 = Color(0xFFFF8119);
const Color kLight = Color(0xFFE39758);
const Color kTeal200 = Color(0xFFFF8119);
const Color kTeal700 = Color(0xFFFF8119);
const Color kBlack1 = Color(0x33000000);
const Color kTextColor = Color(0xFFFF8119);
const Color kTextBlackColor = Color(0xFF353A47);
const Color kBlue = Color(0xFF0743DF);
const Color kLightBlue = Color(0xFF4F77E1);
const Color kOrange = Color(0xFFFF5722);
const Color kYellow = Color(0xFFFFEB3B);
const Color kRed = Color(0xFFFF8119);
const Color kPurple = Color(0xFF673AB7);
const Color kGreen = Color(0xFF4CAF50);
const Color kGray = Color(0xFFBDBEC1);
const Color kGray1 = Color(0xFFEDEDEF);
const Color kBlue1 = Color(0xFF337AB7);
const Color kBackgroundColor = Color(0xFFF6F9FA);
const Color kUnselectedMenuText = Color(0xFF454242);
const Color kSelectedMenuText = Color(0xFFFF8119);
const double defaultPadding = 16;
const accentColor = Color(0xFFcddafd);

// //////////////
// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';

// // clolors that we use in our app
const titleColor = Color(0xFF010F07);
// const primaryColor = Color(0xFFffc8dd);
// const accentColor = Color(0xFFcddafd);
// const bodyTextColor = Color(0xFF868686);
// const inputColor = Color(0xFFFBFBFB);

// const double defaultPadding = 16;
const Duration kDefaultDuration = Duration(milliseconds: 250);

// const TextStyle kButtonTextStyle = TextStyle(
//   color: Colors.white,
//   fontSize: 14,
//   fontWeight: FontWeight.bold,
// );

// const EdgeInsets kTextFieldPadding = EdgeInsets.symmetric(
//   horizontal: defaultPadding,
//   vertical: defaultPadding,
// );

// // Text Field Decoration
// const OutlineInputBorder kDefaultOutlineInputBorder = OutlineInputBorder(
//   borderRadius: BorderRadius.all(Radius.circular(6)),
//   borderSide: BorderSide(
//     color: Color(0xFFF3F2F2),
//   ),
// );

// const InputDecoration otpInputDecoration = InputDecoration(
//   contentPadding: EdgeInsets.zero,
//   counterText: "",
//   errorStyle: TextStyle(height: 0),
// );

// const kErrorBorderSide = BorderSide(color: kSecondaryMain, width: 1);

// // Validator
// final passwordValidator = MultiValidator([
//   RequiredValidator(errorText: 'Password is required'),
//   MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
//   PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
//       errorText: 'Passwords must have at least one special character')
// ]);

// final emailValidator = MultiValidator([
//   RequiredValidator(errorText: 'Email is required'),
//   EmailValidator(errorText: 'Enter a valid email address')
// ]);

// final requiredValidator =
//     RequiredValidator(errorText: 'This field is required');
// final matchValidator = MatchValidator(errorText: 'passwords do not match');

// final phoneNumberValidator = MinLengthValidator(10,
//     errorText: 'Phone Number must be at least 10 digits long');

// // Common Text
// final Center kOrText = Center(
//     child: Text("Or", style: TextStyle(color: titleColor.withOpacity(0.7))));
