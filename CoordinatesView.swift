//
//  CoordinatesView.swift
//  Bezier
//
//  Created by Jaide Zardin on 05/12/24.
//

import SwiftUI

struct CoordinatesView: View {
    
    @Binding var coordinates: [CGPoint]
    
    var body: some View {
        List {
            ForEach(0..<coordinates.count, id: \.self) { index in
                Text("Ponto de controle \(index): \(coordinates[index])")
            }
        }
    }
}
