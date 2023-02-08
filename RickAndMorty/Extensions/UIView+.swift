//
//  UIView+.swift
//  RickAndMorty
//
//  Created by Gabriel de Castro Chaves on 28/01/23.
//

import UIKit

extension UIView {
    
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2.0)
        rotateAnimation.duration = duration

        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func rotate() {
            let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            
            rotation.toValue =  CGAffineTransform(rotationAngle: convertDegreesRadians(degrees: 60)) //NSNumber(value: 50 / (180.0 * CGFloat.pi))
            rotation.duration = 2
            rotation.isCumulative = true
            rotation.repeatCount = Float.greatestFiniteMagnitude
            self.layer.add(rotation, forKey: "rotationAnimation")
        }
    
    func convertDegreesRadians(degrees: CGFloat) -> CGFloat {
        return degrees / 180.0 * CGFloat.pi
    }
    
    func rotateView() {
        
    }
}
