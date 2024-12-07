//
//  CircleView.swift
//  Bezier
//
//  Created by Jaide Zardin on 05/12/24.
//

import SwiftUI

struct BezierPointView: View {
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundStyle(.primary)
            .background {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondary)
            }
    }
}
