// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'e-Shadananda';

  @override
  String get appNameDescription => 'The name of the application.';

  @override
  String get madeBy =>
      'Made with ❤️ Miss Mongol scholarship fund-2018 by Student Union ❤️';

  @override
  String get madeByDescription => 'Credits for the app creator.';

  @override
  String get greeting => 'Welcome To Shadananda';

  @override
  String get loginMessage =>
      'Enter your credentials you get from Shadananda mail and enjoy countless books';

  @override
  String get loginMessageDescription =>
      'Message displayed on the login screen prompting the user to enter their credentials.';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailLabelDescription => 'Label for the email input field.';

  @override
  String get emailPlaceholder => 'Enter your email';

  @override
  String get emailPlaceholderDescription =>
      'Placeholder text for the email input field.';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordLabelDescription => 'Label for the password input field.';

  @override
  String get passwordPlaceholder => 'Enter your password';

  @override
  String get passwordPlaceholderDescription =>
      'Placeholder text for the password input field.';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get forgotPasswordDescription =>
      'Label for the forgot password button.';

  @override
  String get loginButton => 'Login';

  @override
  String get loginButtonDescription => 'Label for the login button.';

  @override
  String get errorTitle => 'Uh oh! Something went wrong';

  @override
  String get errorTitleDescription =>
      'Title of the error message shown on login failure.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get tryAgainDescription =>
      'Label for the retry button in error messages.';

  @override
  String get emailRequired => 'Valid Email is required';

  @override
  String get emailRequiredDescription =>
      'Message displayed when email is missing or invalid.';

  @override
  String get emailRequiredDescriptionLong => 'Please enter your email';

  @override
  String get emailRequiredDescriptionLongDescription =>
      'Detailed explanation for the email required error.';

  @override
  String get passwordEmptyError => 'Please enter your password';

  @override
  String get passwordEmptyErrorDescription =>
      'Error message shown when password field is empty.';

  @override
  String get passwordLengthError => 'Password must be at least 6 characters';

  @override
  String get passwordLengthErrorDescription =>
      'Error message shown when the password is too short.';

  @override
  String get passwordResetTitle => 'Password Reset Email Sent';

  @override
  String get passwordResetTitleDescription =>
      'Message shown when a password reset email is successfully sent.';

  @override
  String get passwordResetDescription =>
      'Please check your email for further instructions';

  @override
  String get passwordResetDescriptionDescription =>
      'Detailed description of what to do after a password reset email is sent.';

  @override
  String get homeNavigationBar => 'Home';

  @override
  String get libraryNavigationBar => 'Library';

  @override
  String get groupNavigationBar => 'Groups';

  @override
  String get postHeaderMessage => 'What\'s on your mind?';

  @override
  String get addPost => 'Add Post';

  @override
  String get cancel => 'Cancel';

  @override
  String get post => 'Post';

  @override
  String get title => 'Title';

  @override
  String get titlePlaceholder => 'Write a Title for post here';

  @override
  String get content => 'Content';

  @override
  String get contentPlaceholder => 'Write the content of the post here';

  @override
  String get thumbnail => 'Thumbnail';

  @override
  String get selectThumbnail => 'Select Thumbnail';

  @override
  String get changeThumbnail => 'Change Thumbnail';

  @override
  String get recommendedSize => 'Recommended size: 1200x1200px';

  @override
  String get validTitle => 'Title cannot be empty';

  @override
  String get validContent => 'Content cannot be empty';

  @override
  String get postSuccess => 'Post has been posted successfully';

  @override
  String get loading => 'Loading...';

  @override
  String get forgotPasswordHeader => 'Don\'t worry we got covered';

  @override
  String get encouringMessageForForgotPassword =>
      'Just enter email and you will receive a mail to reset your password';

  @override
  String get libraryHallTitle => 'TU Online Library';

  @override
  String get libraryHallDescription =>
      'Access digital books and personal library';

  @override
  String get onlineBookStoreTitle => 'Online Book Store';

  @override
  String get onlineBookStoreDescription =>
      'Browse and download digital books from our extensive collection.';

  @override
  String personalLibraryTitle(String userName) {
    return '$userName\'s Personal Library';
  }

  @override
  String get personalLibraryDescription =>
      'Read your downloaded books from here';

  @override
  String get onlineBookStoreQuote =>
      'In the digital realm, every book is a gateway to infinite worlds waiting to be explored.';

  @override
  String get offlineBookStoreQuote =>
      'Within these pages, stories breathe, characters whisper, and imagination knows no bounds.';

  @override
  String get profileDrawer => 'Profile';

  @override
  String get adminDrawer => 'Admin';

  @override
  String get settingDrawer => 'Settings';

  @override
  String get logoutDrawer => 'Logout';

  @override
  String get aboutDrawer => 'About';

  @override
  String get feedbackDrawer => 'Feedback';

  @override
  String get teacherDrawer => 'Teacher';

  @override
  String get studentUnionDrawer => 'Students Union';

  @override
  String get settingsAppBarTitle => 'Settings';

  @override
  String get applicationSettingsCardTitle => 'Application Settings';

  @override
  String get darkModeTitle => 'Dark Mode';

  @override
  String get darkModeSubtitle => 'Toggle between light and dark themes';

  @override
  String get languagePreferencesCardTitle => 'Language Preferences';

  @override
  String get accountCardTitle => 'Account';

  @override
  String get logoutTitle => 'Logout';

  @override
  String get logoutSubtitle => 'Sign out of your account';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacySubtitle => 'Manage your privacy settings';

  @override
  String get logoutDialogTitle => 'Logout';

  @override
  String get logoutDialogDescription => 'Are you sure you want to log out?';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get logoutButton => 'Logout';

  @override
  String get aboutAppBarTitle => 'About Lernza';

  @override
  String get aboutCardTitle => 'About Lernza';

  @override
  String get aboutCardDescription =>
      'Lernza is a comprehensive educational platform designed to empower students and teachers. Our mission is to provide a one-stop solution for all educational needs, offering a diverse range of resources including books, videos, notes, and interactive learning tools.';

  @override
  String get appDetailsCardTitle => 'App Details';

  @override
  String get versionLabel => 'Version';

  @override
  String get websiteLabel => 'Website';

  @override
  String get websiteValue => 'deepeshkalura.xyz';

  @override
  String get websiteLaunchErrorTitle => 'Error Could not launch';

  @override
  String get websiteLaunchErrorDescription => 'Unable to open the website';

  @override
  String get profileScreenTitle => 'Student Profile';

  @override
  String get profileEditScreenTitle => 'Edit Student Screen';

  @override
  String get personalDetailsCardTitle => 'Personal Details';

  @override
  String get familyDetailsCardTitle => 'Family Details';

  @override
  String get courseDetailsCardTitle => 'Course Details';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get phoneLabel => 'Phone';

  @override
  String get addressLabel => 'Address';

  @override
  String get fatherNameLabel => 'Father\'s Name';

  @override
  String get motherNameLabel => 'Mother\'s Name';

  @override
  String get courseNameLabel => 'Course Name';

  @override
  String get batchLabel => 'Batch';

  @override
  String get saveChangesButtonText => 'Save Changes';

  @override
  String get placeholderNotAvailable => 'N/A';

  @override
  String get groupsCardTitile => 'Groups';

  @override
  String get aboutShadanandaTitle => 'About Shadananda';

  @override
  String get aboutShadanandaIntroductionTitle => 'Introduction';

  @override
  String get aboutShadanandaIntroductionContent =>
      'Shadananda Multiple Campus was established in 2067 BS in Dingla, Bhojpur, affiliated with Tribhuvan University.\n\nIt is named after education reformer Balaguru Shadananda, who established Nepal\'s first community-run school. From this inspiration, we created an online library to support students and the community.';

  @override
  String get aboutShadanandaObjectiveTitle => 'Objective';

  @override
  String get aboutShadanandaObjectiveContent =>
      'The main objective is to provide quality higher education to residents of remote and northern areas of Bhojpur district, with special focus on women, Dalits, indigenous people, and marginalized groups.';

  @override
  String get aboutShadanandaFacultiesTitle => 'Academic Faculties';

  @override
  String get aboutShadanandaEducationFaculty => 'Education';

  @override
  String get aboutShadanandaEducationSubject1 => 'English';

  @override
  String get aboutShadanandaEducationSubject2 => 'Nepali';

  @override
  String get aboutShadanandaEducationSubject3 => 'Economics';

  @override
  String get aboutShadanandaEducationSubject4 => 'Health';

  @override
  String get aboutShadanandaEducationSubject5 => 'Population Studies';

  @override
  String get aboutShadanandaManagementFaculty => 'Management';

  @override
  String get aboutShadanandaManagementCourses => 'Bachelor Level Courses';

  @override
  String get aboutShadanandaServicesTitle => 'Our Services';

  @override
  String get aboutShadanandaService1 =>
      'Quality Education with focus on student academic excellence';

  @override
  String get aboutShadanandaService2 =>
      'Annual and Internal Examination System';

  @override
  String get aboutShadanandaService3 =>
      'Well-equipped Computer Lab with basic computer education';

  @override
  String get aboutShadanandaService4 => 'Library and E-Library Services';

  @override
  String get aboutShadanandaService5 =>
      'Free higher education for eligible first-year students';

  @override
  String get studentUnionTitle => 'Student Union';

  @override
  String get studentUnionCouncilTitle => 'Student Union Election 2079';

  @override
  String get studentUnionPresidentName => 'Girija Karki';

  @override
  String get studentUnionPresidentPosition => 'Student Union President';

  @override
  String get studentUnionPresidentDescription =>
      'Girija Karki, a visionary student of ANPA-5, leads as the president of the student union for 2081. He inspires change through dedication and active participation in college initiatives.';

  @override
  String get studentUnionTableHeaderSn => 'S.N';

  @override
  String get studentUnionTableHeaderName => 'Name';

  @override
  String get studentUnionTableHeaderPosition => 'Position';

  @override
  String get studentUnionTableHeaderRollNo => 'Roll No.';

  @override
  String get teacherScreenTitle => 'Campus Faculty';

  @override
  String get teacherChiefName => 'Nagendra Basnet';

  @override
  String get teacherChiefPosition => 'Campus Chief';

  @override
  String get teacherChiefDescription =>
      'Mr. Nagendra Basnet serves as the Campus Chief, leading our institution with dedication and vision towards academic excellence.';

  @override
  String get createPostTitle => 'Create Post';

  @override
  String get createPostTitleDescription =>
      'Title displayed in the post editor screen';

  @override
  String get postTitleLabel => 'Post Title';

  @override
  String get postTitleLabelDescription =>
      'Label for the post title input field';

  @override
  String get postTitleHint => 'Enter an engaging title';

  @override
  String get postTitleHintDescription =>
      'Hint text for the post title input field';

  @override
  String get postTitleError => 'Please enter a title';

  @override
  String get postTitleErrorDescription =>
      'Error message when post title is empty';

  @override
  String get postContentLabel => 'Post Content';

  @override
  String get postContentLabelDescription =>
      'Label for the post content input field';

  @override
  String get postContentHint => 'Share your thoughts...';

  @override
  String get postContentHintDescription =>
      'Hint text for the post content input field';

  @override
  String get postContentError => 'Please enter post content';

  @override
  String get postContentErrorDescription =>
      'Error message when post content is empty';

  @override
  String get pickImageButton => 'Pick Image';

  @override
  String get pickImageButtonDescription => 'Label for the image picker button';

  @override
  String get changeImageButton => 'Change Image';

  @override
  String get changeImageButtonDescription =>
      'Label for changing the selected image';

  @override
  String get submitPostButton => 'Submit Post';

  @override
  String get submitPostButtonDescription => 'Label for the submit post button';

  @override
  String get resetButton => 'Reset';

  @override
  String get resetButtonDescription => 'Label for the reset form button';
}
