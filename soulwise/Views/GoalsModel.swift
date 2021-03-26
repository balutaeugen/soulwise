//
//  GoalsObject.swift
//  soulwise (iOS)
//
//  Created by Baluta Eugen on 26.03.2021.
//

import Foundation
import Combine

class GoalsModel: ObservableObject {
    @Published var goals: [Goals] = []
}
