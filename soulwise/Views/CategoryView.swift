//
//  CategoryView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        ZStack {
            Color(hex: "#F1F3F5").edgesIgnoringSafeArea(.all)
                .cornerRadius(20)
            
            VStack {
                Spacer().frame(height: 20)
                Image("")
                    .frame(width: 112.resizeWidth, height: 95.resizeHeight)
                Spacer()
                Text("Emotional\nIntelligence")
                    .foregroundColor(.init(hex: "#3E4953"))
                    .font(.system(size: 15, weight: .semibold))
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .frame(width: 152, height: 180.resizeHeight)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
