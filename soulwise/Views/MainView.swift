//
//  MainView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import SwiftUI

struct MainView: View {
    @Binding var showSheetView: Bool

    private var title: some View {
        Text("For you")
            .foregroundColor(.init(hex: "#3E4953"))
            .font(.system(size: 20, weight: .semibold))
    }
    
    private var profileView: some View {
        ZStack {
            Button(action: {
                
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 44, height: 44)
                        .foregroundColor(.init(hex: "#FDC844"))
                    Image("test.image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                        .cornerRadius(22)
                }
            })
            
            HStack {
                Spacer()
                VStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.init(hex: "#FDC844"))
                        .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3)
                            )
                    Spacer()
                }
            }
        }
    }
    
    private var testCategory: some View {
        ZStack {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .frame(width: 60.resizeWidth, height: 60.resizeWidth)
                        .foregroundColor(.init(hex: "#FFF7EB"))
                }
                
                Text("Calm")
                    .foregroundColor(.init(hex: "#78848E"))
                    .font(.system(size: 15, weight: .medium))
            }
        }
    }
    
    private var categories: some View {
        HStack(spacing: 25) {
            ForEach(Categories.allCases, id: \.self) { category in
                GeneralCategoryView(category: category)
            }
        }
    }
    
    private var header: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color(hex: "#EFF3F5")
            HStack {
                Spacer()
                Image("meditation.illustration")
            }
            .padding(.horizontal, 25)
            VStack(alignment: .leading) {
                Text("Ready to start\nmediation")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.init(hex: "#3E4953"))
                Spacer().frame(height: 10)
                Text("Regain your inner\npeace")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.init(hex: "#B6BEC5"))
                Spacer().frame(height: 20)
                HStack(spacing: 7) {
                    Button(action: {
                        
                    }, label: {
                        Image("play.icon")
                            .frame(width: 29, height: 29)
                    })
                    Text("5 min")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.init(hex: "#3E4953"))
                }
            }
            // .padding(.vertical, 25.resizeHeight)
            .padding(.horizontal, 25.resizeWidth)
        }
        .frame(width: 315.resizeWidth, height: 180)
        .cornerRadius(20)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(height: 16)
                    categories
                    ScrollView {
                        VStack {
                            Spacer()
                                .frame(height: 50.resizeHeight)
                            header
                            ForEach(0..<3) { _ in
                                Spacer()
                                    .frame(height: 50.resizeHeight)
                                CategorySuperview()
                            }
                        }
                    }
                }
            }
            .navigationBarItems(leading: title,
                                trailing: profileView)
            .navigationBarTitle("", displayMode: .inline)
        }
        .onAppear {
            UINavigationBar.appearance().barTintColor = .clear
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
            UserDefaults.standard.set(true, forKey: "logged")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(showSheetView: .constant(true))
        // .previewDevice("iPhone 8")
    }
}
