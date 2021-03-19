//
//  CredentialView.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 19.03.2021.
//

import SwiftUI

enum CredentialType: String, CaseIterable {
    case username
    case email
    case password
}

struct CredentialView: View {
    let type: CredentialType
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(type.rawValue.capitalized)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.init(hex: "#B3BAC3"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .center))
                Spacer()
                    .frame(height: 17)
            }
            VStack {
                Spacer()
                    .frame(height: 17)
                TextField("", text: $text)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.init(hex: "#46515B"))
            }
        }
        .padding(EdgeInsets(top: 13, leading: 16, bottom: 13, trailing: 16))
        .frame(width: UIScreen.main.bounds.width - (30 * 2), height: 55)
        .background(Color(hex: "#F6F8F9"))
        .cornerRadius(10)
    }
}

struct CredentialView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialView(type: .username)
    }
}
