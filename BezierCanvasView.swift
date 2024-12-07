//
//  BezierCanvasView.swift
//  Bezier
//
//  Created by Jaide Zardin on 05/12/24.
//

import SwiftUI

struct BezierCanvasView: View {
    
    @ObservedObject var bezierVM: BezierViewModel
    @Binding var showControlPolygon: Bool
    
    var body: some View {
        
        Canvas { context, size in
            
            var path = Path()
            guard let firstPoint = bezierVM.controlPoints.first else { return }
            
            path.move(to: firstPoint)
            
            for t in stride(from: 0.0, to: 1.0, by: 0.01) {
                let point = bezierVM.bezierFunc(controlPoints: bezierVM.controlPoints, t: CGFloat(t))
                path.addLine(to: point)
            }
            
            if showControlPolygon {
                var controlPolygonPath = Path()
                for i in 0..<bezierVM.controlPoints.count {
                    let point = bezierVM.controlPoints[i]
                    controlPolygonPath.move(to: point)
                    if i < bezierVM.controlPoints.count - 1 {
                        let nextPoint = bezierVM.controlPoints[i + 1]
                        controlPolygonPath.addLine(to: nextPoint)
                    }
                }
                
                let dashedStyle = StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: 10,
                        dash: [10, 5],
                        dashPhase: 0
                    )
                    
                context.stroke(controlPolygonPath, with: .color(.secondary), style: dashedStyle)
            }
            
            
            context.stroke(path, with: .color(.red), lineWidth: 4)
            
        }
        .onTapGesture { location in
            bezierVM.addPoint(location)
        }
        
    }
}
