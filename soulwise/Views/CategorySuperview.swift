//
//  CategorySuperview.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import SwiftUI

struct CategorySuperview: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            VStack(alignment: .leading) {
                Text("Emotional Wellness")
                    .foregroundColor(.init(hex: "#3E4953"))
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal, 30)
                Spacer()
                    .frame(height: 25.resizeHeight)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        Spacer().frame(width: 10.resizeWidth)
                        ForEach(0..<5) { _ in
                            CategoryView()
                        }
                        Spacer().frame(width: 10)
                    }
                }
            }
        }
    }
}

struct CategorySuperview_Previews: PreviewProvider {
    static var previews: some View {
        CategorySuperview()
    }
}
