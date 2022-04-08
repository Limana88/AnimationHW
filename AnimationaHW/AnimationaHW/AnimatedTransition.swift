//
//  AnimatedTransition.swift
//  AnimationaHW
//
//  Created by Милана Махсотова on 07.04.2022.
//

import Foundation
import UIKit

class AnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let firstViewController: UIViewController
    let secondViewController: UIViewController
    
    init(firstViewController: UIViewController, secondViewController: UIViewController) {
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let view = secondViewController.view else {
            transitionContext.completeTransition(false)
            return
        }
        
        guard let firstViewController = firstViewController as? StartViewController else {
            transitionContext.completeTransition(false)
            return
        }
        
        view.alpha = 0
        container.addSubview(view)
        
        UIView.animateKeyframes(withDuration: 0.9, delay: 0, options: .calculationModeLinear) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.5) {
                firstViewController.customUIView.transform = CGAffineTransform(scaleX: firstViewController.view.center.x, y: firstViewController.view.center.y)
                view.alpha =  1
            }
        } completion: { _ in
            transitionContext.completeTransition(true)
            firstViewController.customUIView.transform = .identity
        }
        
        return

    }
    
}
