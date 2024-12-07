//
//  BezierViewModel.swift
//  Bezier
//
//  Created by Jaide Zardin on 05/12/24.
//

import Foundation
import CoreGraphics

class BezierViewModel: ObservableObject {
    
    func bezierFunc(controlPoints: [CGPoint], t: CGFloat) -> CGPoint {
        guard controlPoints.isEmpty == false else { return .zero }
        
        
        let n = controlPoints.count - 1
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 0...n {
            let binomialCoefficient = CGFloat(binomial(n, i))
            let expression = binomialCoefficient * pow(t, CGFloat(i)) * pow(1 - t, CGFloat(n - i))
            
            x += expression * controlPoints[i].x
            y += expression * controlPoints[i].y
            
        }
        
        return CGPoint(x: x, y: y)
    }
    
    private func factorial(_ n: Int) -> Int {
        
        if n == 0 || n == 1 {
            return 1
        }
        
        return n * factorial(n - 1)
        
    }
    
    private func binomial(_ n: Int, _ k: Int) -> Int {
        
        let numerator = factorial(n)
        let denominator = factorial(k) * factorial(n - k)
        
        return numerator / denominator
        
    }
    
    @Published public var controlPoints: [CGPoint] = []
    
    public func addPoint(_ point: CGPoint) {
        controlPoints.append(point)
    }
    
}
