
import 'package:flutter/material.dart';
import 'package:maxedoutstats/view/filter_and_search_screen.dart/filter_search_screen.dart';

sizeWidth(BuildContext context) => MediaQuery.of(context).size.width;
sizeHeight(BuildContext context) => MediaQuery.of(context).size.height;
class AppStrings {
  static const loginwithemail = "LOGIN WITH EMAIL";
  static const filterSearch = "FILTER & SEARCH";
  static const loginwithFacebook = "LOGIN WITH FACEBOOK";
  static const loginwithGoogle = "LOGIN WITH GOOGLE";
  static const loginwithApple = "LOGIN WITH APPLE";
  static const program1 = "PROGRAM 1";
  static const start = "start";
  static const calculate = "calculate";
  static const buynow = "BUY NOW";
  static const verification = "Verification";
  static const complete = "Complete";
  static const existingPassword = "Existing Password";
  static const newPassword = "New Password";
  static const confirmNewPassword = "Confirm New Password";
  static const donthaveanaccount  = "Don't have an account? ";
  static const signuphere = "Signup here";
  static const addCard = "Add Card";
  static const agreement = "AGREEMENT";
    static const String CAMERA = 'Camera';
    static const String GALLERY = 'Gallery';
  static const ihavereadandagreedwith = "I have read and agreed with";
  static const termsConditions = "Terms & Conditions";
  static const privacyPolicy = "Privacy Policy";
  static const reject = "REJECT";
  static const coaching = "Coaching";
  static const accept = "ACCEPT";
  static const emailAddress = "Email Address";
  static const password = "Password";
  static const forgotPassword = "Forgot Password?";
  static const login = "Login";
  static const signuptoday = "Signup today";
  static const hintEmailaddress = "john.smith@domain.com";
  static const username = "Username";
  static const confirmPassword = "Confirm Password";
  static const phone = "Phone";
  static const currentWeight = "Current Weight (kg)";
  static const desiredWeight = "Desired Weight (kg)";
  static const age = "Age";
  static const hintweight = "75kg";
  static const hintage = "18";
  static const create = "Create";
  static const send = "Send";
  static const hintOptdescription = "We have sent you an email containing VERIFICATION CODE and instructions. please follow the instructions to verify your email address";
  static const dontreceivecode  = "Don't receive code?";
  static const resend = "Resend";
  static const reset = "Reset";
  static const resetPassword = "Reset Password";
  static const johnSmith = "John Smith";
  static const cHANGE = "CHANGE";
  //static const confirmNewPassword = "Confirm New Password";
  static const volumeTracker = "Volume Tracker";
  static const programs = "Programs";
  static const day1programs = "DAY 01 PROGRAM";
  static const home = "Home";
  static const createNewAccount = "Create New Account";
  static const calendar = "Calendar";

  static const profile = "Profile";
  static const whwSubtitle = "Fusce at nisi eget dolor rhoncus facilisis. Mauris ante nisl, consectetur et luctus et, porta ut dolor. Curabitur ultricies ultrices nulla. Morbi blandit nec est vitae dictum. Etiam vel consectetur diam. Maecenas vitae egestas dolor. Fusce tempor magna at tortor aliquet finibus. Sed eu nunc sit ";
  static const userProgress = "User Progress";
  static const goals = "Goals";
  static const addressHintText = "123, Los Angeles, California.";
  static const phonehint = "+0 123 456 7890";
  static const nofWorkouts = "No. of Workouts";
  static const loremIpsumText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  static const addGoal = "Add Goal";
  static const biography = "Biography";
  static const address = "Address";
  static const saveChanges = "Save Changes";

  static const category = "Category";
  static const expectedCost = "Expected Cost";
  static const actualCost = "Actual Cost";
  static const difference = "Difference";
  static const competitionlist = "Competition list";
  static const upcomingCompetition = "Upcoming Competition";
  static const Headovermeals = "Head over meals";
  static const t30Days = "30 Days";
  static const newExercise = "New Exercise";
  static const exercise  = "Exercise ";
  static const competition = "Competition";
  static const type = "Type";
  static const movement = "Movement";
  static const grip = "Grip";
  static const Resistance = "Resistance";
  static const upperBody = "Upper Body";
  static const lowerBody = "Lower Body";
  static const bar = "Bar";
  static const continues = "Continue";
  static const progress = "Progress";
  static const competitionName = "Competition Name";
  static const date = "Date";
  static const time = "Time";
  static const add = "Add";
  static const workout = "Workout";
  static const fistExcercise = "1st Excercise";
  static const noofSets = "No. of Sets";
  static const noofReps = "No. of Reps";
  static const weight = "Weight (kg)";
  static const maxRep = "Max Rep";
  static const supersets = "Super sets";
  static const firstSet = "1st Set";
  static const secondSet = "2nd Set";
  static const thirdSet = "3rd Set";
  static const daily = "Daily";
  static const weekly = "Weekly";
  static const monthly = "Monthly";
  static const chartView = "Chart View";
  static const area = "Area";
  static const all = "All";
  static const chest = "Chest";
  static const details = "Details";
  static const settings = "Settings";
  static const pushNotification = "Push Notification";
  static const cardDetails = "Card Details";
  static const buyPremium = "Buy Premium";
  static const termsandConditions = "Terms & Conditions";
  static const privacypolicy = "Privacy policy";
  static const logout = "Logout";
  static const subscribetopro = "Subscribe to pro";
  static const yearlyPro = "Yearly Pro";
  static const fourty8Year = "48.00/ year";
  static const back = "Back";
  static const biceps = "Biceps";
  static const triceps = "Triceps";
  static const addGoals = "Add Goals";
  static const creditCard = "Credit Card";
  static const stripe = "Stripe";
  static const paypal = "Paypal";
  static const addNew = "Add New";
  static const goalsCategories = "Goals Categories";
  static const selectformthegiven = "Select form the given";
  static const numbersofReps = "Numbers of Reps";
  static const numbersofSets = "Numbers of Sets";
  static const shoulders = "Shoulders";
  static const cardhinttext = "123 456 789 568";
  static const expireDate = "Expire Date";
  static const cVV = "CVV";
  static const saveCard = "Save Card";
    static const  hintPassword = "********";
    static const String hintphoneNo = "+0 123 456 7890";
  static const adfreeinterface = "ad-free interface";
   static const String hintDesiredWeight = "65 KG";
  static const advancedanalytics = "Advanced analytics";
  static const unlimitedprojects = "Unlimited projects";
  static const allmusicandsoundeffect = "All music and sound effect";
  static const planFutureWorkout = "Plan Future Workout";
  static const restoreyourpurchase = "Restore your purchase";
  static const subscriptionsbilled = "Subscriptions billed as one time payments. Recurring billing Cancel anytime.";
  static const getPremiumandadvance = "Get Premium and advance program and Start Tracking";
  static const loremIpsumtext = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt ut labore et dolore magna";
  //Validation Strings
  static const emailValidator = "Please enter a valid email";
  static const otpValidator = "Please fill all Fields";
  static const currentWeightValidator = "Please fill current weight";
  static const desiredWeightValidator = "Please fill desired weight";
  static const enterSomeText = "Please enter some text";
  static const enterageValidateText = "Please enter age";
  static const enterAddressText = "Please enter Address";
  static const enterUserNameText = "Please enter Username";
  static const notMatchValidator = "Not Match";
  static const phoneNumberValidator =
      "Please Enter Phone Number (At Least 10 digits)";
  static const passChangeSuccessful = "Password Changed Successfully..";

  static const passwordvalidator =
      "Password must contain an uppercase, lowercase, numeric digit and special character";
  }