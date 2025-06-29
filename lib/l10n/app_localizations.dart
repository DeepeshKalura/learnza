import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ne.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ne')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'e-Shadananda'**
  String get appName;

  /// No description provided for @appNameDescription.
  ///
  /// In en, this message translates to:
  /// **'The name of the application.'**
  String get appNameDescription;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ Miss Mongol scholarship fund-2018 by Student Union ❤️'**
  String get madeBy;

  /// No description provided for @madeByDescription.
  ///
  /// In en, this message translates to:
  /// **'Credits for the app creator.'**
  String get madeByDescription;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Welcome To Shadananda'**
  String get greeting;

  /// No description provided for @loginMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials you get from Shadananda mail and enjoy countless books'**
  String get loginMessage;

  /// No description provided for @loginMessageDescription.
  ///
  /// In en, this message translates to:
  /// **'Message displayed on the login screen prompting the user to enter their credentials.'**
  String get loginMessageDescription;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the email input field.'**
  String get emailLabelDescription;

  /// No description provided for @emailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailPlaceholder;

  /// No description provided for @emailPlaceholderDescription.
  ///
  /// In en, this message translates to:
  /// **'Placeholder text for the email input field.'**
  String get emailPlaceholderDescription;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the password input field.'**
  String get passwordLabelDescription;

  /// No description provided for @passwordPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordPlaceholder;

  /// No description provided for @passwordPlaceholderDescription.
  ///
  /// In en, this message translates to:
  /// **'Placeholder text for the password input field.'**
  String get passwordPlaceholderDescription;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the forgot password button.'**
  String get forgotPasswordDescription;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @loginButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the login button.'**
  String get loginButtonDescription;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Uh oh! Something went wrong'**
  String get errorTitle;

  /// No description provided for @errorTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'Title of the error message shown on login failure.'**
  String get errorTitleDescription;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @tryAgainDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the retry button in error messages.'**
  String get tryAgainDescription;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Valid Email is required'**
  String get emailRequired;

  /// No description provided for @emailRequiredDescription.
  ///
  /// In en, this message translates to:
  /// **'Message displayed when email is missing or invalid.'**
  String get emailRequiredDescription;

  /// No description provided for @emailRequiredDescriptionLong.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailRequiredDescriptionLong;

  /// No description provided for @emailRequiredDescriptionLongDescription.
  ///
  /// In en, this message translates to:
  /// **'Detailed explanation for the email required error.'**
  String get emailRequiredDescriptionLongDescription;

  /// No description provided for @passwordEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get passwordEmptyError;

  /// No description provided for @passwordEmptyErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Error message shown when password field is empty.'**
  String get passwordEmptyErrorDescription;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordLengthError;

  /// No description provided for @passwordLengthErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Error message shown when the password is too short.'**
  String get passwordLengthErrorDescription;

  /// No description provided for @passwordResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Reset Email Sent'**
  String get passwordResetTitle;

  /// No description provided for @passwordResetTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'Message shown when a password reset email is successfully sent.'**
  String get passwordResetTitleDescription;

  /// No description provided for @passwordResetDescription.
  ///
  /// In en, this message translates to:
  /// **'Please check your email for further instructions'**
  String get passwordResetDescription;

  /// No description provided for @passwordResetDescriptionDescription.
  ///
  /// In en, this message translates to:
  /// **'Detailed description of what to do after a password reset email is sent.'**
  String get passwordResetDescriptionDescription;

  /// No description provided for @homeNavigationBar.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNavigationBar;

  /// No description provided for @libraryNavigationBar.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get libraryNavigationBar;

  /// No description provided for @groupNavigationBar.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groupNavigationBar;

  /// No description provided for @postHeaderMessage.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get postHeaderMessage;

  /// No description provided for @addPost.
  ///
  /// In en, this message translates to:
  /// **'Add Post'**
  String get addPost;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @titlePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Write a Title for post here'**
  String get titlePlaceholder;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @contentPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Write the content of the post here'**
  String get contentPlaceholder;

  /// No description provided for @thumbnail.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail'**
  String get thumbnail;

  /// No description provided for @selectThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Select Thumbnail'**
  String get selectThumbnail;

  /// No description provided for @changeThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Change Thumbnail'**
  String get changeThumbnail;

  /// No description provided for @recommendedSize.
  ///
  /// In en, this message translates to:
  /// **'Recommended size: 1200x1200px'**
  String get recommendedSize;

  /// No description provided for @validTitle.
  ///
  /// In en, this message translates to:
  /// **'Title cannot be empty'**
  String get validTitle;

  /// No description provided for @validContent.
  ///
  /// In en, this message translates to:
  /// **'Content cannot be empty'**
  String get validContent;

  /// No description provided for @postSuccess.
  ///
  /// In en, this message translates to:
  /// **'Post has been posted successfully'**
  String get postSuccess;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @forgotPasswordHeader.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry we got covered'**
  String get forgotPasswordHeader;

  /// No description provided for @encouringMessageForForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Just enter email and you will receive a mail to reset your password'**
  String get encouringMessageForForgotPassword;

  /// No description provided for @libraryHallTitle.
  ///
  /// In en, this message translates to:
  /// **'TU Online Library'**
  String get libraryHallTitle;

  /// No description provided for @libraryHallDescription.
  ///
  /// In en, this message translates to:
  /// **'Access digital books and personal library'**
  String get libraryHallDescription;

  /// No description provided for @onlineBookStoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Online Book Store'**
  String get onlineBookStoreTitle;

  /// No description provided for @onlineBookStoreDescription.
  ///
  /// In en, this message translates to:
  /// **'Browse and download digital books from our extensive collection.'**
  String get onlineBookStoreDescription;

  /// No description provided for @personalLibraryTitle.
  ///
  /// In en, this message translates to:
  /// **'{userName}\'s Personal Library'**
  String personalLibraryTitle(String userName);

  /// No description provided for @personalLibraryDescription.
  ///
  /// In en, this message translates to:
  /// **'Read your downloaded books from here'**
  String get personalLibraryDescription;

  /// No description provided for @onlineBookStoreQuote.
  ///
  /// In en, this message translates to:
  /// **'In the digital realm, every book is a gateway to infinite worlds waiting to be explored.'**
  String get onlineBookStoreQuote;

  /// No description provided for @offlineBookStoreQuote.
  ///
  /// In en, this message translates to:
  /// **'Within these pages, stories breathe, characters whisper, and imagination knows no bounds.'**
  String get offlineBookStoreQuote;

  /// No description provided for @profileDrawer.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileDrawer;

  /// No description provided for @adminDrawer.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminDrawer;

  /// No description provided for @settingDrawer.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingDrawer;

  /// No description provided for @logoutDrawer.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutDrawer;

  /// No description provided for @aboutDrawer.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutDrawer;

  /// No description provided for @feedbackDrawer.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedbackDrawer;

  /// No description provided for @teacherDrawer.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacherDrawer;

  /// No description provided for @studentUnionDrawer.
  ///
  /// In en, this message translates to:
  /// **'Students Union'**
  String get studentUnionDrawer;

  /// No description provided for @settingsAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsAppBarTitle;

  /// No description provided for @applicationSettingsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get applicationSettingsCardTitle;

  /// No description provided for @darkModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkModeTitle;

  /// No description provided for @darkModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Toggle between light and dark themes'**
  String get darkModeSubtitle;

  /// No description provided for @languagePreferencesCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Language Preferences'**
  String get languagePreferencesCardTitle;

  /// No description provided for @accountCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountCardTitle;

  /// No description provided for @logoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutTitle;

  /// No description provided for @logoutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out of your account'**
  String get logoutSubtitle;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyTitle;

  /// No description provided for @privacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your privacy settings'**
  String get privacySubtitle;

  /// No description provided for @logoutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutDialogTitle;

  /// No description provided for @logoutDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutDialogDescription;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @aboutAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'About Lernza'**
  String get aboutAppBarTitle;

  /// No description provided for @aboutCardTitle.
  ///
  /// In en, this message translates to:
  /// **'About Lernza'**
  String get aboutCardTitle;

  /// No description provided for @aboutCardDescription.
  ///
  /// In en, this message translates to:
  /// **'Lernza is a comprehensive educational platform designed to empower students and teachers. Our mission is to provide a one-stop solution for all educational needs, offering a diverse range of resources including books, videos, notes, and interactive learning tools.'**
  String get aboutCardDescription;

  /// No description provided for @appDetailsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'App Details'**
  String get appDetailsCardTitle;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionLabel;

  /// No description provided for @websiteLabel.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get websiteLabel;

  /// No description provided for @websiteValue.
  ///
  /// In en, this message translates to:
  /// **'deepeshkalura.xyz'**
  String get websiteValue;

  /// No description provided for @websiteLaunchErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error Could not launch'**
  String get websiteLaunchErrorTitle;

  /// No description provided for @websiteLaunchErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Unable to open the website'**
  String get websiteLaunchErrorDescription;

  /// No description provided for @profileScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Student Profile'**
  String get profileScreenTitle;

  /// No description provided for @profileEditScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Student Screen'**
  String get profileEditScreenTitle;

  /// No description provided for @personalDetailsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetailsCardTitle;

  /// No description provided for @familyDetailsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Family Details'**
  String get familyDetailsCardTitle;

  /// No description provided for @courseDetailsCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Course Details'**
  String get courseDetailsCardTitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneLabel;

  /// No description provided for @addressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressLabel;

  /// No description provided for @fatherNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Father\'s Name'**
  String get fatherNameLabel;

  /// No description provided for @motherNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Name'**
  String get motherNameLabel;

  /// No description provided for @courseNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Course Name'**
  String get courseNameLabel;

  /// No description provided for @batchLabel.
  ///
  /// In en, this message translates to:
  /// **'Batch'**
  String get batchLabel;

  /// No description provided for @saveChangesButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesButtonText;

  /// No description provided for @placeholderNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get placeholderNotAvailable;

  /// No description provided for @groupsCardTitile.
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get groupsCardTitile;

  /// No description provided for @aboutShadanandaTitle.
  ///
  /// In en, this message translates to:
  /// **'About Shadananda'**
  String get aboutShadanandaTitle;

  /// No description provided for @aboutShadanandaIntroductionTitle.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get aboutShadanandaIntroductionTitle;

  /// No description provided for @aboutShadanandaIntroductionContent.
  ///
  /// In en, this message translates to:
  /// **'Shadananda Multiple Campus was established in 2067 BS in Dingla, Bhojpur, affiliated with Tribhuvan University.\n\nIt is named after education reformer Balaguru Shadananda, who established Nepal\'s first community-run school. From this inspiration, we created an online library to support students and the community.'**
  String get aboutShadanandaIntroductionContent;

  /// No description provided for @aboutShadanandaObjectiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Objective'**
  String get aboutShadanandaObjectiveTitle;

  /// No description provided for @aboutShadanandaObjectiveContent.
  ///
  /// In en, this message translates to:
  /// **'The main objective is to provide quality higher education to residents of remote and northern areas of Bhojpur district, with special focus on women, Dalits, indigenous people, and marginalized groups.'**
  String get aboutShadanandaObjectiveContent;

  /// No description provided for @aboutShadanandaFacultiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Academic Faculties'**
  String get aboutShadanandaFacultiesTitle;

  /// No description provided for @aboutShadanandaEducationFaculty.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get aboutShadanandaEducationFaculty;

  /// No description provided for @aboutShadanandaEducationSubject1.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get aboutShadanandaEducationSubject1;

  /// No description provided for @aboutShadanandaEducationSubject2.
  ///
  /// In en, this message translates to:
  /// **'Nepali'**
  String get aboutShadanandaEducationSubject2;

  /// No description provided for @aboutShadanandaEducationSubject3.
  ///
  /// In en, this message translates to:
  /// **'Economics'**
  String get aboutShadanandaEducationSubject3;

  /// No description provided for @aboutShadanandaEducationSubject4.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get aboutShadanandaEducationSubject4;

  /// No description provided for @aboutShadanandaEducationSubject5.
  ///
  /// In en, this message translates to:
  /// **'Population Studies'**
  String get aboutShadanandaEducationSubject5;

  /// No description provided for @aboutShadanandaManagementFaculty.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get aboutShadanandaManagementFaculty;

  /// No description provided for @aboutShadanandaManagementCourses.
  ///
  /// In en, this message translates to:
  /// **'Bachelor Level Courses'**
  String get aboutShadanandaManagementCourses;

  /// No description provided for @aboutShadanandaServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get aboutShadanandaServicesTitle;

  /// No description provided for @aboutShadanandaService1.
  ///
  /// In en, this message translates to:
  /// **'Quality Education with focus on student academic excellence'**
  String get aboutShadanandaService1;

  /// No description provided for @aboutShadanandaService2.
  ///
  /// In en, this message translates to:
  /// **'Annual and Internal Examination System'**
  String get aboutShadanandaService2;

  /// No description provided for @aboutShadanandaService3.
  ///
  /// In en, this message translates to:
  /// **'Well-equipped Computer Lab with basic computer education'**
  String get aboutShadanandaService3;

  /// No description provided for @aboutShadanandaService4.
  ///
  /// In en, this message translates to:
  /// **'Library and E-Library Services'**
  String get aboutShadanandaService4;

  /// No description provided for @aboutShadanandaService5.
  ///
  /// In en, this message translates to:
  /// **'Free higher education for eligible first-year students'**
  String get aboutShadanandaService5;

  /// No description provided for @studentUnionTitle.
  ///
  /// In en, this message translates to:
  /// **'Student Union'**
  String get studentUnionTitle;

  /// No description provided for @studentUnionCouncilTitle.
  ///
  /// In en, this message translates to:
  /// **'Student Union Election 2079'**
  String get studentUnionCouncilTitle;

  /// No description provided for @studentUnionPresidentName.
  ///
  /// In en, this message translates to:
  /// **'Girija Karki'**
  String get studentUnionPresidentName;

  /// No description provided for @studentUnionPresidentPosition.
  ///
  /// In en, this message translates to:
  /// **'Student Union President'**
  String get studentUnionPresidentPosition;

  /// No description provided for @studentUnionPresidentDescription.
  ///
  /// In en, this message translates to:
  /// **'Girija Karki, a visionary student of ANPA-5, leads as the president of the student union for 2081. He inspires change through dedication and active participation in college initiatives.'**
  String get studentUnionPresidentDescription;

  /// No description provided for @studentUnionTableHeaderSn.
  ///
  /// In en, this message translates to:
  /// **'S.N'**
  String get studentUnionTableHeaderSn;

  /// No description provided for @studentUnionTableHeaderName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get studentUnionTableHeaderName;

  /// No description provided for @studentUnionTableHeaderPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get studentUnionTableHeaderPosition;

  /// No description provided for @studentUnionTableHeaderRollNo.
  ///
  /// In en, this message translates to:
  /// **'Roll No.'**
  String get studentUnionTableHeaderRollNo;

  /// No description provided for @teacherScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Campus Faculty'**
  String get teacherScreenTitle;

  /// No description provided for @teacherChiefName.
  ///
  /// In en, this message translates to:
  /// **'Nagendra Basnet'**
  String get teacherChiefName;

  /// No description provided for @teacherChiefPosition.
  ///
  /// In en, this message translates to:
  /// **'Campus Chief'**
  String get teacherChiefPosition;

  /// No description provided for @teacherChiefDescription.
  ///
  /// In en, this message translates to:
  /// **'Mr. Nagendra Basnet serves as the Campus Chief, leading our institution with dedication and vision towards academic excellence.'**
  String get teacherChiefDescription;

  /// No description provided for @createPostTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Post'**
  String get createPostTitle;

  /// No description provided for @createPostTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'Title displayed in the post editor screen'**
  String get createPostTitleDescription;

  /// No description provided for @postTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Post Title'**
  String get postTitleLabel;

  /// No description provided for @postTitleLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the post title input field'**
  String get postTitleLabelDescription;

  /// No description provided for @postTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Enter an engaging title'**
  String get postTitleHint;

  /// No description provided for @postTitleHintDescription.
  ///
  /// In en, this message translates to:
  /// **'Hint text for the post title input field'**
  String get postTitleHintDescription;

  /// No description provided for @postTitleError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get postTitleError;

  /// No description provided for @postTitleErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Error message when post title is empty'**
  String get postTitleErrorDescription;

  /// No description provided for @postContentLabel.
  ///
  /// In en, this message translates to:
  /// **'Post Content'**
  String get postContentLabel;

  /// No description provided for @postContentLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the post content input field'**
  String get postContentLabelDescription;

  /// No description provided for @postContentHint.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts...'**
  String get postContentHint;

  /// No description provided for @postContentHintDescription.
  ///
  /// In en, this message translates to:
  /// **'Hint text for the post content input field'**
  String get postContentHintDescription;

  /// No description provided for @postContentError.
  ///
  /// In en, this message translates to:
  /// **'Please enter post content'**
  String get postContentError;

  /// No description provided for @postContentErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'Error message when post content is empty'**
  String get postContentErrorDescription;

  /// No description provided for @pickImageButton.
  ///
  /// In en, this message translates to:
  /// **'Pick Image'**
  String get pickImageButton;

  /// No description provided for @pickImageButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the image picker button'**
  String get pickImageButtonDescription;

  /// No description provided for @changeImageButton.
  ///
  /// In en, this message translates to:
  /// **'Change Image'**
  String get changeImageButton;

  /// No description provided for @changeImageButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for changing the selected image'**
  String get changeImageButtonDescription;

  /// No description provided for @submitPostButton.
  ///
  /// In en, this message translates to:
  /// **'Submit Post'**
  String get submitPostButton;

  /// No description provided for @submitPostButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the submit post button'**
  String get submitPostButtonDescription;

  /// No description provided for @resetButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButton;

  /// No description provided for @resetButtonDescription.
  ///
  /// In en, this message translates to:
  /// **'Label for the reset form button'**
  String get resetButtonDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ne':
      return AppLocalizationsNe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
