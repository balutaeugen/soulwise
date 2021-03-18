//
//  ContentView.swift
//  Shared
//
//  Created by Baluta Eugen on 17.03.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var isPushingCredentials = false
    
    private var illustration: some View {
        Image("login.illustration")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private var appInfo: some View {
        VStack(spacing: 13) {
            Text("Welcome to Soulwise")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .semibold))
            Text("Boost your life,\nEnhance the world")
                .foregroundColor(.init(hex: "#CDCDCD"))
                .font(.system(size: 18, weight: .semibold))
                .multilineTextAlignment(.center)
        }
    }
    
    private var startButton: some View {
        NavigationLink(
            destination: CredentialsView(),
            isActive: $isPushingCredentials){
            Button("Get Started") {
                isPushingCredentials = true
            }
            .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 50)
            .background(Color(hex: "#FEA516"))
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.black)
            .cornerRadius(10)
        }
        
    }
    
    private var signInInfo: some View {
        HStack(spacing: 5) {
            Text("Already have an account?")
                .foregroundColor(.init(hex: "#CDCDCD"))
            Button("Sign in") {
                
            }
            .foregroundColor(.init(hex: "#FEA516"))
        }
        .font(.system(size: 13, weight: .semibold))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    illustration
                    Spacer()
                        .frame(height: 35)
                    appInfo
                    Spacer()
                        .frame(height: 65)
                    startButton
                    Spacer()
                        .frame(height: 20)
                    signInInfo
                    Spacer()
                        .frame(height: 33)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone X")
        
        LoginView()
            .previewDevice("iPhone 8")
    }
}
