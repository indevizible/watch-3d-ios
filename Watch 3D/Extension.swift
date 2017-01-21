//
//  Extension.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/14/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit
import SceneKit

struct Constants {
    struct designs {
        struct colors {
            
            static let disableAlpha = CGFloat(0.333)
            
            static let black = UIColor(colorLiteralRed: 33/255, green: 33/255, blue: 33/255, alpha: 1)
            
            static let spaceGray = UIColor(colorLiteralRed: 74/255, green: 74/255, blue: 74/255, alpha: 1)
            
            static let spaceGrayFaded = UIColor(colorLiteralRed: 74/255, green: 74/255, blue: 74/255, alpha: 0.333)
            
            static let white = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            
            static let whiteMuted = UIColor(colorLiteralRed: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            
            static let defaultMutedValue: CGFloat = 2/3
            
            struct palletes {
                
                //mark: Band Colors
                
                static let bandYellow =         UIColor(colorLiteralRed: 243/255,
                                                        green:           201/255,
                                                        blue:            65/255,
                                                        alpha:           1)
                static let bandRed =            UIColor(colorLiteralRed: 199/255,
                                                        green:           43/255,
                                                        blue:            54/255,
                                                        alpha:           1)
                static let bandPinkSand =       UIColor(colorLiteralRed: 223/255,
                                                        green:           199/255,
                                                        blue:            199/255,
                                                        alpha:           1)
                static let bandWhite =          UIColor(colorLiteralRed: 238/255,
                                                        green:           237/255,
                                                        blue:            242/255,
                                                        alpha:           1)
                static let bandConcrete =       UIColor(colorLiteralRed: 156/255,
                                                        green:           155/255,
                                                        blue:            153/255,
                                                        alpha:           1)
                static let bandCocoa =          UIColor(colorLiteralRed: 76/255,
                                                        green:           67/255,
                                                        blue:            68/255,
                                                        alpha:           1)
                static let bandMidnightBlue =   UIColor(colorLiteralRed: 58/255,
                                                        green:           61/255,
                                                        blue:            80/255,
                                                        alpha:           1)
                static let bandOceanBlue =      UIColor(colorLiteralRed: 53/255,
                                                        green:           77/255,
                                                        blue:            111/255,
                                                        alpha:           1)
                static let bandTurquoise =      UIColor(colorLiteralRed: 196/255,
                                                        green:           217/255,
                                                        blue:            220/255,
                                                        alpha:           1)
                static let bandBlack =          UIColor(colorLiteralRed: 39/255,
                                                        green:           39/255,
                                                        blue:            39/255,
                                                        alpha:           1)
                
                //mark: Case Colors
                
                static let caseStainlessSteel =             UIColor(colorLiteralRed: 214/255,
                                                                    green:           215/255,
                                                                    blue:            216/255,
                                                                    alpha:           1)
                
                static let caseStainlessSteelSpaceBlack =   UIColor(colorLiteralRed: 53/255,
                                                                    green:           54/255,
                                                                    blue:            58/255,
                                                                    alpha:           1)
                
                
                
                static let caseAluminumSilver =             UIColor(colorLiteralRed: 214/255,
                                                                    green:           215/255,
                                                                    blue:            216/255,
                                                                    alpha:           1)
                
                static let caseAluminumSpaceGray  =         UIColor(colorLiteralRed: 53/255,
                                                                    green:           54/255,
                                                                    blue:            58/255,
                                                                    alpha:           1)
                
                static let caseAluminumGold  =              UIColor(colorLiteralRed: 229/255,
                                                                    green:           205/255,
                                                                    blue:            180/255,
                                                                    alpha:           1)
                
                static let caseAluminumRoseGold  =          UIColor(colorLiteralRed: 233/255,
                                                                    green:           190/255,
                                                                    blue:            184/255,
                                                                    alpha:           1)
                
                }
                
                //mark: Color Function
                
                static func colorBlend(left: UIColor, right: UIColor, weight: CGFloat) -> UIColor {
                    var leftRGBA = Array(repeating: CGFloat(0.0), count: 4)
                    var rightRGBA = Array(repeating: CGFloat(0.0), count: 4)
                    
                    left.getRed(&leftRGBA[0], green: &leftRGBA[1], blue: &leftRGBA[2], alpha: &leftRGBA[3])
                    right.getRed(&rightRGBA[0], green: &rightRGBA[1], blue: &rightRGBA[2], alpha: &rightRGBA[3])
                    
                    let invertWeight = 1 - weight
                    
                    return UIColor(
                        red: (leftRGBA[0] * invertWeight + rightRGBA[0] * weight) / 1,
                        green: (leftRGBA[1] * invertWeight + rightRGBA[1] * weight) / 1,
                        blue: (leftRGBA[2] * invertWeight + rightRGBA[2] * weight) / 1,
                        alpha: (leftRGBA[3] * invertWeight + rightRGBA[3] * weight) / 1
                    )
                }
                
                static func colorDarken(basedColor: UIColor, value: CGFloat = defaultMutedValue) -> UIColor {
                    return colorBlend(left: basedColor, right: UIColor.black, weight: value)
                }
                
                static func colorBrighten(basedColor: UIColor, value: CGFloat = defaultMutedValue) -> UIColor {
                    return colorBlend(left: basedColor, right: UIColor.white, weight: value)
                }


            
            
        }
        
        struct animations {
            
            static let defaultPrimaryDuration = 0.5
            static let defaultSecondaryDuration = 0.75
            static let defaultTertiaryDuration = 0.25
            static let defaultPrimaryTransitionDuration = 0.25
            static let defaultSecondaryTransitionDuration = 0.125
            
            
            static let defaultCAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 0, 0.5, 0, 1)
            
            static let breathAnimationDuration = 2.5
            
            static let breathAnimationCAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 0.33, 0, 0.66, 1)
            
            
            
            static func defaultPrimaryAnimate(
                animations: @escaping () -> Void,
                animated: Bool = true,
                completion: ((Bool) -> Void)? = nil) {
                UIView.animate(withDuration: animated ? defaultPrimaryDuration : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .allowUserInteraction, animations: animations, completion: completion)
            }
            
            static func defaultSecondaryAnimate(
                animations: @escaping () -> Void,
                animated: Bool = true,
                completion: ((Bool) -> Void)? = nil) {
                UIView.animate(withDuration: animated ? defaultSecondaryDuration : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .allowUserInteraction, animations: animations, completion: completion)
            }
            
            static func defaultTertiaryAnimate(
                animations: @escaping () -> Void,
                animated: Bool = true,
                completion: ((Bool) -> Void)? = nil) {
                UIView.animate(withDuration: animated ? defaultPrimaryDuration : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .allowUserInteraction, animations: animations, completion: completion)
            }
            
            static func defaultPrimaryTransition(with: UIView, animations: @escaping () -> Void, animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
                UIView.transition(with: with, duration: animated ? defaultPrimaryTransitionDuration : 0, options: [.transitionCrossDissolve, .allowUserInteraction], animations: animations, completion: completion)
            }
            
            static func defaultSecondaryTransition(with: UIView, animations: @escaping () -> Void, animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
                UIView.transition(with: with, duration: animated ? defaultSecondaryTransitionDuration : 0, options: [.transitionCrossDissolve, .allowUserInteraction], animations: animations, completion: completion)
            }
            
            static func animateCALayerBorder(layer: CALayer,
                                             borderColor: UIColor, borderWidth: CGFloat, animated: Bool) {
                
                let borderColorAnimation:CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
                borderColorAnimation.fromValue = layer.borderColor
                borderColorAnimation.toValue = borderColor.cgColor
                layer.borderColor = borderColorAnimation.toValue as! CGColor?
                
                
                let borderWidthAnimation:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
                borderWidthAnimation.fromValue = layer.borderWidth
                borderWidthAnimation.toValue = borderWidth
                layer.borderWidth = borderWidthAnimation.toValue as! CGFloat
                
                
                let animationGroup:CAAnimationGroup = CAAnimationGroup()
                
                
                animationGroup.duration = animated ? defaultPrimaryDuration : 0
                animationGroup.animations = [borderColorAnimation, borderWidthAnimation]
                animationGroup.timingFunction = defaultCAMediaTimingFunction
                animationGroup.isRemovedOnCompletion = false
                
                layer.add(animationGroup, forKey: "borderAnimation")
                
            }
            
            static func animateCALayerShadow(layer: CALayer,
                                             shadowColor: UIColor,
                                             shadowRadius: CGFloat,
                                             shadowOpacity:Float,
                                             animated: Bool) {
                
                let shadowColorAnimation:CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
                shadowColorAnimation.fromValue = layer.shadowColor
                shadowColorAnimation.toValue = shadowColor.cgColor
                layer.shadowColor = shadowColorAnimation.toValue as! CGColor?
                
                
                let shadowRadiusAnimation:CABasicAnimation = CABasicAnimation(keyPath: "shadowRadius")
                shadowRadiusAnimation.fromValue = layer.shadowRadius
                shadowRadiusAnimation.toValue = shadowRadius
                layer.shadowRadius = shadowRadiusAnimation.toValue as! CGFloat
                
                let shadowOpacityAnimation:CABasicAnimation = CABasicAnimation(keyPath: "shadowOpacity")
                shadowOpacityAnimation.fromValue = layer.shadowOpacity
                shadowOpacityAnimation.toValue = shadowOpacity
                layer.shadowOpacity = shadowOpacityAnimation.toValue as! Float
                
                let animationGroup:CAAnimationGroup = CAAnimationGroup()
                
                
                animationGroup.duration = animated ? defaultPrimaryDuration : 0
                animationGroup.animations = [shadowColorAnimation, shadowRadiusAnimation, shadowOpacityAnimation]
                animationGroup.timingFunction = defaultCAMediaTimingFunction
                animationGroup.isRemovedOnCompletion = false
                
                layer.add(animationGroup, forKey: "shadowAnimation")
                
                
            }
            
            static func animateCALayerShadowBreath(layer: CALayer,
                                                   shadowColor: UIColor,
                                                   fromShadowRadius: CGFloat = 1,
                                                   toShadowRadius: CGFloat = 6,
                                                   fromShadowOpacity:Float = 0.2,
                                                   toShadowOpacity:Float = 0.6) {
                
                let shadowColorAnimation:CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
                shadowColorAnimation.fromValue = layer.shadowColor
                shadowColorAnimation.toValue = shadowColor.cgColor
                
                
                let shadowRadiusAnimation:CABasicAnimation = CABasicAnimation(keyPath: "shadowRadius")
                shadowRadiusAnimation.fromValue = fromShadowRadius
                shadowRadiusAnimation.toValue = toShadowRadius
                
                let shadowOpacityAnimation:CABasicAnimation = CABasicAnimation(keyPath: "shadowOpacity")
                shadowOpacityAnimation.fromValue = fromShadowOpacity
                shadowOpacityAnimation.toValue = toShadowOpacity
                
                let animationGroup:CAAnimationGroup = CAAnimationGroup()
                
                
                animationGroup.duration = breathAnimationDuration
                animationGroup.animations = [shadowColorAnimation, shadowRadiusAnimation, shadowOpacityAnimation]
                animationGroup.autoreverses = true
                animationGroup.repeatCount = FLT_MAX
                animationGroup.timingFunction = breathAnimationCAMediaTimingFunction
                animationGroup.isRemovedOnCompletion = false
                
                layer.add(animationGroup, forKey: "shadowAnimation")
                
                
            }
            
            static func animateSceneKit(
                animations: @escaping () -> Void,
                animated: Bool = true,
                completion: ((Bool) -> Void)? = nil)
            {
                let easeOut = CAMediaTimingFunction(controlPoints: 0.0, 0.0, 0.0, 1)
                SCNTransaction.begin()
                SCNTransaction.animationDuration = defaultPrimaryDuration
                
                SCNTransaction.animationTimingFunction = easeOut
                
                animations()
                
                SCNTransaction.commit()
            }
        }
    }
}

extension UIView {
    func rounded() {
        let radiusValue = bounds.height / 2
        layer.cornerRadius = radiusValue
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
