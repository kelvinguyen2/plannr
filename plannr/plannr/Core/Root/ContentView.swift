import SwiftUI
struct LoginSignupView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.white]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                // Background Image
                Image("travelBackground") // Replace with your travel-themed background asset name
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    Spacer()
                    // App Logo
                    Image(systemName: "mappin.circle.fill") // Replace with your app-specific logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    // Welcome Title
                    Text("Welcome to Plannr!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                    // Description
                    Text("""
Let’s get started by creating your personalized itinerary. 
We’ll help you organize your trip and make it unforgettable.
""")
                        .font(.custom("HelveticaNeue-Bold", size:14))
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity) // Ensures the text doesn't overflow
                        .padding(.horizontal, 20) // Adds consistent padding from the edges
                    Spacer()
                    // Buttons
                    VStack(spacing: 20) {
                        NavigationLink(destination: LoginView()) {
                            Text("Log In")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                        NavigationLink(destination: SignupView()) {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20) // Ensures text and elements stay within safe margins
                .padding(.bottom, 40) // Adjusts spacing at the bottom for smaller screens
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.8)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                // Travel Theme Icon
                Image(systemName: "mappin.and.ellipse")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                // Title
                Text("Welcome to Plannr!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                // Description
                Text("""
Let’s get started by creating your personalized itinerary. We’ll help you organize your trip and make it unforgettable.
""")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer()
                // Email Input
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white.opacity(0.8))
                        TextField("Enter your email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                // Password Input
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.white.opacity(0.8))
                        if isPasswordVisible {
                            TextField("Enter your password", text: $password)
                                .foregroundColor(.white)
                        } else {
                            SecureField("Enter your password", text: $password)
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    .padding(10)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                // Log In Button
                Button(action: {
                    // Login logic
                }) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 40)
                Spacer()
            }
        }
    }
}
import SwiftUI

struct SignupView: View {
    @State private var fullName = "" // Full Name field
    @State private var email = "" // Email field
    @State private var isPrivacyChecked = false // Checkbox for Terms and Privacy Policy
    @State private var hasReviewedTerms = false // Trigger for reviewed Terms
    @State private var navigateToCreatePassword = false // Navigation to Create Password
    @State private var errorMessage: String? // Error message for validation

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.cyan.opacity(0.7)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // Title
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                // Description
                Text("Enter your details and agree to our terms to create your account.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                // Full Name Input Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Full Name")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    TextField("Enter your full name", text: $fullName)
                        .autocapitalization(.words)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)

                // Email Input Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email Address")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    TextField("Enter your email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.leading, 10)
                    }
                }
                .padding(.horizontal, 40)

                // Privacy Checkbox and Agreement Link
                HStack {
                    Button(action: {
                        isPrivacyChecked.toggle()
                    }) {
                        Image(systemName: isPrivacyChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(isPrivacyChecked ? Color.blue : Color.white)
                            .font(.title2)
                    }

                    NavigationLink(destination: AgreementPageView(hasReviewedTerms: $hasReviewedTerms)) {
                        Text("By signing up, you agree to the Terms and Privacy Policy.")
                            .underline()
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 40)

                // Continue Button
                Button(action: {
                    if validateInputs() {
                        navigateToCreatePassword = true
                    }
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isPrivacyChecked && hasReviewedTerms && validateInputs()
                                        ? Color.blue
                                        : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 40)
                .disabled(!isPrivacyChecked || !hasReviewedTerms || !validateInputs())

                // Navigation to Create Password
                NavigationLink(
                    destination: CreatePasswordView(email: email),
                    isActive: $navigateToCreatePassword,
                    label: { EmptyView() }
                )

                Spacer()
            }
        }
    }

    // Validation Function
    func validateInputs() -> Bool {
        // Check if full name is not empty
        if fullName.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Please enter your full name."
            return false
        }
        // Validate email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailPredicate.evaluate(with: email) {
            errorMessage = "Please enter a valid email address."
            return false
        }
        // Clear error if inputs are valid
        errorMessage = nil
        return true
    }
}

struct AgreementPageView: View {
    @Binding var hasReviewedTerms: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var hasScrolledToEnd = false
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.3), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                // Title
                Text("Terms and Conditions")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top, 20)
                // Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Plannr - Terms and Conditions")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("Effective Date: January 5th, 2025\nLast Updated: January 5th, 2025")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("""
Welcome to Plannr! These Terms and Conditions (“Terms”) constitute a legally binding agreement between you (“User,” “you,” or “your”) and Plannr (“we,” “us,” or “our”) regarding the use of our services (“Services”) through the Plannr mobile application (“App”). By accessing, downloading, or using the App, you agree to comply with these Terms. If you do not agree, you must cease using the App immediately.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("1. Acceptance of Terms")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• By clicking “I Agree” during registration or by continuing to use the App, you confirm that:
  - You have read and understood these Terms.
  - You agree to be bound by these Terms and our Privacy Policy [insert link].
• If you are under 18 years of age, you must obtain parental or legal guardian consent before using the App.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("2. User Responsibilities")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Account Registration:
  - You agree to provide accurate, complete, and current information when creating an account.
  - You are responsible for maintaining the confidentiality of your account credentials.
• Prohibited Activities:
  - You agree not to use the App for unlawful purposes, to distribute harmful content, or to engage in behavior that violates these Terms or applicable laws.
  - Unauthorized access, reverse-engineering, or hacking of the App is strictly prohibited.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("3. Privacy and Data Collection")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Privacy Compliance:
  - Your use of the App is subject to our Privacy Policy [insert link], which outlines how we collect, use, and store your data.
• Consent to Data Sharing:
  - By using collaborative features (e.g., itinerary sharing), you consent to the sharing of data with designated participants.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("4. Services")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Nature of Services:
  - Plannr provides tools for itinerary creation, travel expense management, and recommendations. These are for informational purposes only.
  - Plannr is not a travel agency and does not guarantee the availability or quality of third-party services or locations.
• No Warranty:
  - The App and Services are provided on an “as-is” and “as-available” basis without warranties of any kind, either express or implied.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("5. Payment and Subscription")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Subscription Services:
  - Some features are available through subscription plans. By subscribing, you authorize Plannr to charge your payment method for recurring fees until cancellation.
• Refund Policy:
  - Refunds are issued only as required by applicable law.
• Free Trials:
  - Free trials may convert to paid subscriptions unless canceled before the trial ends.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("6. Limitations of Liability")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• General Disclaimer:
  - Plannr is not liable for any loss, damage, or injury resulting from reliance on the App, missed travel arrangements, or disruptions caused by third parties.
• Force Majeure:
  - Plannr is not responsible for delays or failures caused by events beyond its reasonable control, including natural disasters, internet outages, or government actions.
• Liability Cap:
  - To the fullest extent permitted by law, Plannr’s liability to you for any claims arising from your use of the App is limited to the amount you have paid (if any) in the last 12 months.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("7. Intellectual Property")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
All intellectual property rights in the App, including logos, designs, and software, are owned by Plannr. You may not copy, distribute, or reverse-engineer the App without prior written consent.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("8. Termination")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Plannr reserves the right to terminate or suspend your account at its sole discretion for violations of these Terms or misuse of the App.
• Upon termination, your access to the App will cease, but these Terms will survive termination to the extent necessary to enforce rights or obligations.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("9. Dispute Resolution")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
• Governing Law:
  - These Terms are governed by the laws of [Insert Jurisdiction].
• Arbitration:
  - Any disputes will be resolved through binding arbitration in [Insert City], under the rules of [Insert Arbitration Provider], except where prohibited by law.
• Class Action Waiver:
  - You agree to resolve disputes on an individual basis and waive your right to participate in a class action or representative proceeding.
""")
                            .font(.body)
                            .foregroundColor(.black)
                        Text("10. Contact Information")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
For questions or concerns regarding these Terms, please contact us:
• Email: support@plannr7@gmail.com
• Address: [Insert Company Address]
""")
                            .font(.body)
                            .foregroundColor(.black)
                        // Invisible Trigger to Detect End of Scroll
                        Color.clear
                            .frame(height: 1)
                            .onAppear {
                                hasScrolledToEnd = true
                            }
                    }
                    .padding()
                }
                // Accept Button
                Button(action: {
                    hasReviewedTerms = true
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Accept Terms")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(hasScrolledToEnd ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .disabled(!hasScrolledToEnd)
                .padding(.horizontal, 20)
            }
        }
    }
}
struct CreatePasswordView: View {
    let email: String
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var navigateToCompleteSignUp = false
    @State private var errorMessage: String?
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                Text("Create Password")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("Choose a secure password to protect your account.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                VStack(spacing: 15) {
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    SecureField("Confirm your password", text: $confirmPassword)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal, 40)
                }
                Button(action: validateAndProceed) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 40)
                NavigationLink(destination: CompleteSignUpView(email: email),
                               isActive: $navigateToCompleteSignUp,
                               label: { EmptyView() })
                Spacer()
            }
        }
    }
    func validateAndProceed() {
        if password.count < 12 {
            errorMessage = "Password must be at least 12 characters."
        } else if password != confirmPassword {
            errorMessage = "Passwords do not match."
        } else {
            navigateToCompleteSignUp = true
        }
    }
}
struct CompleteSignUpView: View {
    let email: String
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                Text("Complete Sign-Up")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("""
A confirmation email has been sent to \(email).
Please check your inbox and click the link to verify your account.
""")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer()
            }
        }
    }
}

