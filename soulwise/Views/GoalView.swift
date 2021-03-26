//
//  GoalView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 18.03.2021.
//

import SwiftUI
import Combine

enum Goals {
    case stress
    case curiosity
    case communicate
    case sleeping
    case anxiety
    
    var title: String {
        switch self {
        case .stress: return "Stress Relief"
        case .curiosity: return "Curiosity"
        case .communicate: return "Communicate"
        case .sleeping: return "Sleeping\nSoundly"
        case .anxiety: return "Managing\nAnxiety"
        }
    }
    
    var image: String {
        switch self {
        case .stress: return "stress.icon"
        case .curiosity: return "curiosity.icon"
        case .communicate: return "communicate.icon"
        case .sleeping: return "sleepy.icon"
        case .anxiety: return "anxiety.icon"
        }
    }
}

struct GoalView: View {
    var goal: Goals
    @ObservedObject var model: GoalsModel
    @State var cancellable: AnyCancellable?
    
    @State var isSelected: Bool = false
    
    private var background: some View {
        Circle()
            .foregroundColor(Color(hex: isSelected ? "#FEA516" : "#EFF3F5"))
            .frame(width: 95, height: 95, alignment: .center)
    }
    private var image: some View {
        Image(goal.image)
            .renderingMode(.template)
            .foregroundColor(.init(hex: isSelected ? "#FFFFFF" : "#000000"))
    }
    private var title: some View {
        Text(goal.title)
            .foregroundColor(.init(hex: isSelected ? "#000000" : "#75828C"))
            .font(.system(size: 15, weight: .semibold))
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }

    var body: some View {
        VStack {
            ZStack {
                background
                image
            }
            title
        }
        .onAppear {
            cancellable = model.$goals.sink { goals in
                isSelected = goals.contains(goal)
            }
        }
        .onTapGesture {
            model.goals.contains(goal) ? model.goals.removeAll {$0.image == goal.image} : model.goals.append(goal)
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(goal: .anxiety, model: GoalsModel())
    }
}
