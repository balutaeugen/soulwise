//
//  CredentialsView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 18.03.2021.
//

import SwiftUI

struct CredentialsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var viewModel = CredentialsModel()
    @State private var isPresentingGoals = false
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("back.icon")
        })
    }
    
    private var credentialsInfo: some View {
        Group {
            Text("Lets get started!")
                .foregroundColor(.init(hex: "#3E4953"))
                .font(.system(size: 30, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 15)
            Text("Create an account to better\nmanage people in your team")
                .foregroundColor(.init(hex: "#CDCDCD"))
                .font(.system(size: 15, weight: .semibold))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 30)
    }
    
    private var signUpForm: some View {
        VStack(alignment: .leading, spacing: 20) {
            CredentialView(type: .username, data: $viewModel.username)
            CredentialView(type: .email, data: $viewModel.email)
            CredentialView(type: .password, data: $viewModel.password)
        }
    }
    
    private var linksInfo: some View {
        VStack(spacing: 0) {
            Text("By continuing you agree to our")
                .foregroundColor(.init(hex: "#B3BAC3"))
                .font(.system(size: 15, weight: .semibold))
            HStack(spacing: 5) {
                Button(action: {}, label: {
                    Text("Terms and Conditions")
                        .foregroundColor(.black)
                        .underline()
                        .font(.system(size: 15, weight: .semibold))
                })
                Text("and")
                    .foregroundColor(.init(hex: "#B3BAC3"))
                    .font(.system(size: 15, weight: .semibold))
                Button(action: {}, label: {
                    Text("Privacy Policy")
                        .foregroundColor(.black)
                        .underline()
                        .font(.system(size: 15, weight: .semibold))
                })
            }
        }
    }
    
    private var signUpButton: some View {
        Button(action: {
            viewModel.signUp {
                isPresentingGoals.toggle()
            }
        }, label: {
            HStack(spacing: 13) {
                Text("Sign Up")
            }
            /*
             Frame is given to HStack to fix clicability issue
             */
            .frame(width: 315.resizeWidth, height: 50.resizeHeight)
        })
        .frame(width: 315.resizeWidth, height: 50.resizeHeight)
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
        }, label: {
            HStack(spacing: 13) {
                Image("google.icon")
                Text("Continue with Google")
            }
            /*
             Frame is given to HStack to fix clicability issue
             */
            .frame(width: 315.resizeWidth, height: 50.resizeHeight)
        })
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
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                credentialsInfo
                Spacer()
                    .frame(height: 52.resizeHeight)
                VStack {
                    signUpForm
                    Spacer()
                        .frame(height: 66.resizeHeight)
                    linksInfo
                    Spacer()
                        .frame(height: 20.resizeHeight)
                    VStack(spacing: 15) {
                        signUpButton
                        Text("or")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.init(hex: "#CDCDCD"))
                        googleButton
                    }
                    Spacer()
                        .frame(height: 27.resizeHeight)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct CredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsView()
    }
}

extension View {
    func compatibleFullScreen<Content: View>(isPresented: Binding<Bool>,
                                             @ViewBuilder content: @escaping () -> Content) -> some View {
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
