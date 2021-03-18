//
//  GoalView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 18.03.2021.
//

import SwiftUI

struct GoalView: View {
    var image: Image
    var title: Text
    
    var body: some View {
        VStack() {
            ZStack {
                Circle()
                    .foregroundColor(Color(hex: "#EFF3F5"))
                    .frame(width: 95, height: 95, alignment: .center)
                image
            }
            title
                .foregroundColor(.init(hex: "#75828C"))
                .font(.system(size: 15, weight: .semibold))
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(image: Image("stress.icon"), title: Text("Abra\nasd"))
    }
}
