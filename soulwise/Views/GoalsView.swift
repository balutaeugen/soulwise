//
//  GoalsView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 18.03.2021.
//

import SwiftUI

struct GoalsView: View {
    @Binding var showSheetView: Bool
    
    private var goalsInfo: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("What brings you to\nmediation?")
                .foregroundColor(.init(hex: "#3E4953"))
                .font(.system(size: 30, weight: .semibold))
                .multilineTextAlignment(.leading)
            Text("Pick your top goal")
                .foregroundColor(.init(hex: "#CDCDCD"))
                .font(.system(size: 15, weight: .semibold))
        }
    }
    
    private var goalsGrid: some View {
        ZStack {
            VStack(spacing: 32) {
                HStack(spacing: 15) {
                    GoalView(image: Image("stress.icon"), title: Text("Stress Relief"))
                    GoalView(image: Image("curiosity.icon"), title: Text("Curiosity"))
                    GoalView(image: Image("communicate.icon"), title: Text("Communicate"))
                }
                HStack(spacing: 15) {
                    GoalView(image: Image("sleepy.icon"), title: Text("Sleeping\nSoundly"))
                    GoalView(image: Image("anxiety.icon"), title: Text("Managing\nAnxiety"))
                }
            }
        }
    }
    
    private var nextButton: some View {
        Button("Next") {
            
        }
        .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 50)
        .background(Color(hex: "#FEA516"))
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.black)
        .cornerRadius(10)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
//                    Spacer()
//                        .frame(minHeight: 20, idealHeight: 70, maxHeight: .infinity)
                    goalsInfo
//                    Spacer()
//                        .frame(minHeight: 20, idealHeight: 70, maxHeight: .infinity)
                    goalsGrid
                    Spacer()
                        .frame(minHeight: 20, idealHeight: 142, maxHeight: .infinity)
                        //.frame(height: 142)
                    nextButton
                    Spacer()
                        .frame(height: 27)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//            .previewDevice("iPhone 8")
    }
}
