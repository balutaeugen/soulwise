//
//  CredentialsView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 18.03.2021.
//

import SwiftUI

struct CredentialsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPresentingGoals = false
    @State private var text: String = ""
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image("back.icon")
        }
    }
    
    private var credentialsInfo: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Lets get started!")
                .foregroundColor(.init(hex: "#3E4953"))
                .font(.system(size: 30, weight: .semibold))
            Text("Create an account to better\nmanage people in your team")
                .foregroundColor(.init(hex: "#CDCDCD"))
                .font(.system(size: 15, weight: .semibold))
                .multilineTextAlignment(.leading)
        }
    }
    
    private var signUpForm: some View {
        VStack(spacing: 20) {
            ZStack {
                Text("Username")
                TextField("Username", text: $text)
            }
            .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16))
            .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 55)
            .background(Color(hex: "#F6F8F9"))
            .cornerRadius(10)
            
            ZStack {
                Text("Username")
                TextField("Username", text: $text)
            }
            .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16))
            .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 55)
            .background(Color(hex: "#F6F8F9"))
            .cornerRadius(10)
            
            ZStack {
                Text("Username")
                TextField("Username", text: $text)
            }
            .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16))
            .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 55)
            .background(Color(hex: "#F6F8F9"))
            .cornerRadius(10)
        }
    }
    
    private var linksInfo: some View {
        VStack(spacing: 0) {
            Text("By continuing you agree to our")
                .foregroundColor(.init(hex: "#B3BAC3"))
                .font(.system(size: 15, weight: .semibold))
            HStack(spacing: 5) {
                Button(action: {}) {
                    Text("Terms and Conditions")
                        .foregroundColor(.black)
                        .underline()
                        .font(.system(size: 15, weight: .semibold))
                }
                Text("and")
                    .foregroundColor(.init(hex: "#B3BAC3"))
                    .font(.system(size: 15, weight: .semibold))
                Button(action: {}) {
                    Text("Privacy Policy")
                        .foregroundColor(.black)
                        .underline()
                        .font(.system(size: 15, weight: .semibold))
                }
            }
        }
    }
    
    private var signUpButton: some View {
        Button("Sign Up") {
            isPresentingGoals.toggle()
        }
        .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 50)
        .background(Color(hex: "#FEA516"))
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.black)
        .cornerRadius(10)
        .compatibleFullScreen(isPresented: $isPresentingGoals) {
            GoalsView(showSheetView: $isPresentingGoals)
        }
    }
    
    private var googleButton: some View {
        Button(action: {
            isPresentingGoals.toggle()
        }) {
            HStack(spacing: 13) {
                Image("google.icon")
                Text("Continue with Google")
            }
        }
        .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 50)
        
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.black)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#F0F0F0"), lineWidth: 2))
        .compatibleFullScreen(isPresented: $isPresentingGoals) {
            GoalsView(showSheetView: $isPresentingGoals)
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                credentialsInfo
                VStack {
                    Spacer()
                        .frame(minHeight: 20, idealHeight: 52, maxHeight: .infinity)
                    signUpForm
                    Spacer()
                        .frame(minHeight: 20, idealHeight: 66, maxHeight: .infinity)
                    linksInfo
                    Spacer()
                        .frame(height: 20)
                    VStack(spacing: 15) {
                        signUpButton
                        Text("or")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.init(hex: "#CDCDCD"))
                        googleButton
                    }
                    Spacer()
                        .frame(height: 27)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView()
    }
}


extension View {
    func compatibleFullScreen<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.modifier(FullScreenModifier(isPresented: isPresented, builder: content))
    }
}

struct FullScreenModifier<V: View>: ViewModifier {
    let isPresented: Binding<Bool>
    let builder: () -> V

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content.fullScreenCover(isPresented: isPresented, content: builder)
        } else {
            content.sheet(isPresented: isPresented, content: builder)
        }
    }
}
