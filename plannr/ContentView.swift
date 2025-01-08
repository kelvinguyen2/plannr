//
//  ContentView.swift
//  plannr
//
//  Created by Kelvin Nguyen on 1/6/25.
//

import SwiftUI

struct LoginSignupView: View {
    var body: some View {
        NavigationView { // Add NavigationView
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.white]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    Spacer()

                    // App Title
                    VStack {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)

                        Text("Welcome to")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.8))

                        Text("Plannr")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                    Text("Let's get started by creating an account or logging in!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.horizontal)

                    Spacer()

                    // Buttons
                    VStack(spacing: 20) {
                        // Log In Button -> Links to LoginView
                        NavigationLink(destination: LoginView()) {
                            Text("Log In")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                        }

                        // Sign Up Button (Placeholder)
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
                .padding()
            }
        }
    }
}


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // Title
                Text("Log in")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                // Email Address Field
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
                }

                // Password Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    HStack {
                        if isPasswordVisible {
                            TextField("Enter your password", text: $password)
                                .autocapitalization(.none)
                        } else {
                            SecureField("Enter your password", text: $password)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }

                // Forgot Password
                Button(action: {
                    // Add your forgot password logic here
                }) {
                    Text("Forgot Password?")
                        .font(.caption)
                        .underline()
                        .foregroundColor(.white.opacity(0.8))
                }

                Spacer()

                // Continue Button
                Button(action: {
                    // Add your login action here
                    print("Logging in with email: \(email)")
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                }
                .padding(.horizontal, 40)

                Spacer()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignupView: View {
    @State private var email = ""
    @State private var isPrivacyChecked = false
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.white]),
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
                Text("What's your email address?")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)

                Text("We’ll need your email address to send you updates and help you access your account anytime.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
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
                }
                .padding(.horizontal, 40)

                // Privacy Checkbox
                HStack {
                    Button(action: {
                        isPrivacyChecked.toggle()
                    }) {
                        Image(systemName: isPrivacyChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(isPrivacyChecked ? Color.blue : Color.white)
                            .font(.title2)
                    }

                    Text("By signing up, you agree to the Terms and Privacy Policy.")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 40)

                // Continue Button
                Button(action: {
                    // Add your sign-up logic here
                    if isValidEmail(email) {
                        print("Signing up with email: \(email)")
                    } else {
                        errorMessage = "Please enter a valid email address."
                    }
                }) {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                }
                .padding(.horizontal, 40)
                .disabled(!isPrivacyChecked) // Disable if checkbox is not checked
                .opacity(isPrivacyChecked ? 1.0 : 0.5) // Dim if disabled

                // Error Message
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }

                Spacer()
            }
        }
    }

    // Email Validation Logic
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
