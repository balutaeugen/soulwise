//
//  GoalsView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 18.03.2021.
//

import SwiftUI
import Combine

struct GoalsView: View {
    @Binding var showSheetView: Bool
    @ObservedObject var viewModel = GoalsModel()
    @State var isPresentingMain = false
    @State var cancellable: AnyCancellable?
    @State var elementsSelected: Bool = false

    private var goalsInfo: some View {
        Group {
            Text("What brings you to\nmediation?")
                .foregroundColor(.init(hex: "#3E4953"))
                .font(.system(size: 30, weight: .semibold))
                .multilineTextAlignment(.leading)
            Spacer()
                .frame(height: 15)
            Text("Pick your top goal")
                .foregroundColor(.init(hex: "#CDCDCD"))
                .font(.system(size: 15, weight: .semibold))
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var goalsGrid: some View {
        ZStack {
            VStack(spacing: 32) {
                HStack(spacing: 15) {
                    GoalView(goal: .stress, model: viewModel)
                    GoalView(goal: .curiosity, model: viewModel)
                    GoalView(goal: .communicate, model: viewModel)
                }
                HStack(spacing: 15) {
                    GoalView(goal: .sleeping, model: viewModel)
                    GoalView(goal: .anxiety, model: viewModel)
                }
            }
        }
    }

    private var nextButton: some View {
        Button(action: {
            isPresentingMain = true
        }, label: {
            HStack(spacing: 13) {
                Text("Next")
            }
            /*
             Frame is given to HStack to fix clicability issue
             */
            .frame(width: 315.resizeWidth, height: 50.resizeHeight)
        })
        .background(Color(hex: "#FEA516"))
        .font(.system(size: 15, weight: .semibold))
        .foregroundColor(.black)
        .cornerRadius(10)
        .compatibleFullScreen(isPresented: $isPresentingMain) {
            MainView(showSheetView: $isPresentingMain)
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Spacer()
                        .frame(height: 45.resizeHeight)
                    goalsInfo
                    Spacer()
                        .frame(height: 45.resizeHeight)
                    goalsGrid
                    Spacer()
                }
                
                VStack {
                    if elementsSelected {
                        Spacer()
                        nextButton
                        Spacer()
                            .frame(height: 27)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            cancellable = viewModel.$goals.sink { goals in
                elementsSelected = !goals.isEmpty
            }
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView(showSheetView: Binding<Bool>.init(get: {
            return true
        }, set: { _ in

        }))
        // .previewDevice("iPhone 8")
    }
}
