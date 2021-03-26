//
//  CategoryView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import SwiftUI

enum Categories: String, CaseIterable {
    case calm
    case anxious
    case mindful
    case health
}

struct GeneralCategoryView: View {
    let category: Categories
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .frame(width: 60.resizeWidth, height: 60.resizeWidth)
                        .foregroundColor(isSelected ? Color(hex: "#FFF7EB") : .clear)
                        .overlay(
                                Circle()
                                    .stroke(isSelected ? Color.clear : Color(hex: "#EAEEF1"), lineWidth: 1)
                            )
                }
                
                Text(category.rawValue.capitalized)
                    .foregroundColor(.init(hex: "#78848E"))
                    .font(.system(size: 15, weight: .medium))
            }
        }
    }
}

struct GeneralCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralCategoryView(category: .calm)
    }
}
