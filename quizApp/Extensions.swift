//
//  Extensions.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.red)
    }
}
