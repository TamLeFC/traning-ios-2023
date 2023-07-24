//
//  ThreePointGradientView.swift
//  TrainingProject
//
//  Created by Mobile Dev on 24/07/2023.
//

import UIKit

class ThreePointGradientView: UIView {
    
    private let startColor: UIColor
    private let middleColor: UIColor
    private let endColor: UIColor
    
    init(startColor: UIColor, middleColor: UIColor, endColor: UIColor) {
        self.startColor = startColor
        self.middleColor = middleColor
        self.endColor = endColor
        
        super.init(frame: .zero)
        
        // Disable autoresizing mask translation
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let colors = [startColor.cgColor, middleColor.cgColor, endColor.cgColor]
        let locations: [CGFloat] = [0.0, 0.8, 1.0]
        
        if let gradient = CGGradient(colorsSpace: nil, colors: colors as CFArray, locations: locations) {
            let startPoint = CGPoint(x: rect.midX, y: rect.minY)
            let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
            
            context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        }
    }
}
