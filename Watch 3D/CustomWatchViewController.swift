//
//  CustomWatchViewController.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/14/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit
import SceneKit

class CustomWatchViewController: UIViewController {
    
    let scene = SCNScene(named: "ScenekitAssets.scnassets/watchCustomizeExample.scn")!
    
    @IBOutlet weak var scenekitView: SCNView!
    
    @IBOutlet var viewOptionButtons: [UIButton]!
    
    @IBOutlet var caseButtons: [UIButton]!
    
    @IBOutlet var showHideButtons: [UIButton]!
    
    
    @IBOutlet weak var caseAluminumColorStackView: UIStackView!
    
    @IBOutlet weak var caseStainlessSteelColorStackView: UIStackView!
    
    @IBOutlet var caseAluminumColorButtons: [UIButton]!
    @IBOutlet var caseStainlessSteelColorButtons: [UIButton]!
    
    @IBOutlet var bandColorButtons: [UIButton]!
    
    var watchCaseNode = SCNNode()
    var watchBandNode = SCNNode()
    
    var caseAluminumColorPalleteAreaViews = [UIView]()
    var caseStainlessSteelColorPalleteAreaViews = [UIView]()
    var bandColorPalleteAreaViews = [UIView]()

     var watchViewOption: Int = 0 {
        didSet{
            setWatchColorAndView(viewOptionIndex: watchViewOption)
        }
    }
    
     var watchCaseMaterial: Int = 0 {
        didSet{
            watchCaseColor = 0
            setWatchColorAndView(caseMaterialIndex: watchCaseMaterial)
        }
    }
    
     var watchBandColor: Int = 0 {
        didSet{
            setWatchColorAndView(bandColorIndex: watchBandColor)
            
        }
    }
    
     var watchCaseColor: Int = 0 {
        didSet{
            setWatchColorAndView(caseColorIndex: watchCaseColor)
        }
    }

    
    var isSettingsAreaOpened = false
    
    @IBOutlet weak var whiteDummyAreaHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var settingsAreaViewBottomConstraint: NSLayoutConstraint!
    
    
    @IBAction func settingsDidDrag(_ sender: UIPanGestureRecognizer) {
        let state = sender.state
        let heightConstraint: CGFloat = 216
        let translationY = sender.translation(in: view).y
        let velocityY = sender.velocity(in: view).y
        
        if state == .changed {
            
            if isSettingsAreaOpened{
                
                if translationY > 0 && translationY < heightConstraint {
                    self.whiteDummyAreaHeightConstraint.constant = 44 * (translationY / heightConstraint)
                    self.settingsAreaViewBottomConstraint.constant = -translationY
                }
                
                
            } else {
                
                if translationY < 0 && translationY > -heightConstraint {
                    self.whiteDummyAreaHeightConstraint.constant = 44 - 44 * abs(translationY / heightConstraint)
                    self.settingsAreaViewBottomConstraint.constant = -heightConstraint - translationY
                }
                
            }
            
        }
        
        if state == .ended {
            
            
            if velocityY > 150 {
                let duration = !isSettingsAreaOpened ? (translationY) / abs(velocityY) + 0.15 : (heightConstraint - translationY) / abs(velocityY) + 0.15
                showSettings(willOpen: false, duration: TimeInterval(duration))
                
            } else if velocityY < -150 {
                let duration = !isSettingsAreaOpened ? (heightConstraint - translationY) / abs(velocityY) + 0.15 : (translationY) / abs(velocityY) + 0.15
                showSettings(willOpen: true, duration: TimeInterval(duration))
                
            }
            else {
                
                if translationY >= 0 {
                    showSettings(willOpen: (abs(translationY) < heightConstraint / 2))
                } else {
                    showSettings(willOpen: (abs(translationY) > heightConstraint / 2))
                }
                
            }
        }
        
        
    }
    
    private func showSettings(willOpen: Bool, duration: TimeInterval = 0, animated: Bool = true){
        
        if willOpen {
            
            self.whiteDummyAreaHeightConstraint.constant = 0
            self.settingsAreaViewBottomConstraint.constant = 0
        }else{
            
            self.whiteDummyAreaHeightConstraint.constant = 44
            self.settingsAreaViewBottomConstraint.constant = -216
            
        }
        
        if duration > 0 {
            UIView.animate(withDuration: animated ? duration : 0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
        }else {
            Constants.designs.animations.defaultPrimaryAnimate(animations:{
                self.view.layoutIfNeeded()
            }, animated: animated)
        }
        
        isSettingsAreaOpened = willOpen
        
    }
    
    @IBAction func showSettingsButtonDidTouch(_ sender: Any) {
        showSettings(willOpen: true)
        
    }
    
    @IBAction func hideSettingsButtonDidTouch(_ sender: Any) {
        showSettings(willOpen: false)
        
    }
    
    override func viewDidLoad() {
        setupDesign()
        setupScenekit()
    }
    
    fileprivate func setupScenekit(){
        watchCaseNode = scene.rootNode.childNode(withName: "watchCase", recursively: true)!
        watchBandNode = scene.rootNode.childNode(withName: "watchBand", recursively: true)!
        scenekitView.scene = self.scene
    }
    
    fileprivate func setupDesign() {
        
        for button in showHideButtons {
            button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }
        
        for button in viewOptionButtons {
            button.addTarget(self, action:#selector(viewOptionButtonDidPress(button:)), for: .touchUpInside)
            setupContentEdgeInsetsButton(button: button)
            button.rounded()
        }
        
        setButtonSelectedState(views: viewOptionButtons,selectedBankgroundColor: Constants.designs.colors.white, animated: false)
    
        
        for button in caseButtons {
            button.addTarget(self, action:#selector(caseButtonDidPress(button:)), for: .touchUpInside)
            setupContentEdgeInsetsButton(button: button)
            button.rounded()
        }
        
        setButtonSelectedState(views: caseButtons, animated: false)
        
        caseAluminumColorPalleteAreaViews = setupColorPalleteArea(buttons: caseAluminumColorButtons)
        setColorButtonSelectedState(views: caseAluminumColorPalleteAreaViews, animated: false)
        
        for button in caseAluminumColorButtons {
            button.addTarget(self, action:#selector(caseAluminumColorButtonDidPress(button:)), for: .touchUpInside)
            
            button.addTarget(self, action:#selector(caseAluminumColorButtonDidTouchDown(button:)), for: [.touchDown, .touchDragInside])
            
            button.addTarget(self, action:#selector(caseAluminumColorButtonDidTouchDragOutside(button:)), for: .touchDragOutside)
        }
        
        for view in caseAluminumColorPalleteAreaViews {
            view.rounded()
            if let index = caseAluminumColorPalleteAreaViews.index(of: view) {
                view.backgroundColor = watchOptionData.pallete.caseAluminum[index].palleteColor
                
            }
        }
        
        
        caseStainlessSteelColorPalleteAreaViews = setupColorPalleteArea(buttons: caseStainlessSteelColorButtons)
        setColorButtonSelectedState(views: caseStainlessSteelColorPalleteAreaViews, animated: false)
        
        for button in caseStainlessSteelColorButtons {
            button.addTarget(self, action:#selector(caseStainlessSteelColorButtonDidPress(button:)), for: .touchUpInside)
            
            button.addTarget(self, action:#selector(caseStainlessSteelColorButtonDidTouchDown(button:)), for: [.touchDown, .touchDragInside])
            
            button.addTarget(self, action:#selector(caseStainlessSteelColorButtonDidTouchDragOutside(button:)), for: .touchDragOutside)
        }
        
        for view in caseStainlessSteelColorPalleteAreaViews {
            view.rounded()
            if let index = caseStainlessSteelColorPalleteAreaViews.index(of: view) {
                view.backgroundColor = watchOptionData.pallete.caseStainlessSteel[index].palleteColor
                
            }
        }
        
        
        bandColorPalleteAreaViews = setupColorPalleteArea(buttons: bandColorButtons)
        setColorButtonSelectedState(views: bandColorPalleteAreaViews, animated: false)
        
        for button in bandColorButtons {
            button.addTarget(self, action:#selector(bandColorButtonDidPress(button:)), for: .touchUpInside)
            
            button.addTarget(self, action:#selector(bandColorButtonDidTouchDown(button:)), for: [.touchDown, .touchDragInside])
            
            button.addTarget(self, action:#selector(bandColorButtonDidTouchDragOutside(button:)), for: .touchDragOutside)
        }
        
        for view in bandColorPalleteAreaViews {
            view.rounded()
            if let index = bandColorPalleteAreaViews.index(of: view) {
                view.backgroundColor = watchOptionData.pallete.band[index].palleteColor
                
            }
            
        }
        
    }
    
    func viewOptionButtonDidPress(button: UIButton) {
        if let indexValue = viewOptionButtons.index(of: button) {
            setButtonSelectedState(views: viewOptionButtons, index: indexValue, selectedBankgroundColor: Constants.designs.colors.white, animated: false)
        }
    }
    
    func caseButtonDidPress(button: UIButton) {
        if let indexValue = caseButtons.index(of: button) {
            
            watchCaseMaterial = indexValue
            
            setButtonSelectedState(views: caseButtons, index: indexValue)
            
            setColorButtonSelectedState(views: caseAluminumColorPalleteAreaViews, animated: false)
            setColorButtonSelectedState(views: caseStainlessSteelColorPalleteAreaViews, animated: false)
            
            switch indexValue {
            case 0:
                caseAluminumColorStackView.isHidden = false
                caseStainlessSteelColorStackView.isHidden = true
                
                caseButtons[0].isUserInteractionEnabled = false
                caseButtons[1].isUserInteractionEnabled = true
            case 1:
                caseAluminumColorStackView.isHidden = true
                caseStainlessSteelColorStackView.isHidden = false
                
                caseButtons[0].isUserInteractionEnabled = true
                caseButtons[1].isUserInteractionEnabled = false
            default:
                caseAluminumColorStackView.isHidden = false
                caseStainlessSteelColorStackView.isHidden = true
            }
        }
    }
    
    func caseAluminumColorButtonDidPress(button: UIButton) {
        if let indexValue = caseAluminumColorButtons.index(of: button) {
            setColorButtonSelectedState(views: caseAluminumColorPalleteAreaViews, index: indexValue)
            watchCaseColor = indexValue
        }
    }
    
    func caseStainlessSteelColorButtonDidPress(button: UIButton) {
        if let indexValue = caseStainlessSteelColorButtons.index(of: button) {
            setColorButtonSelectedState(views: caseStainlessSteelColorPalleteAreaViews, index: indexValue)
            watchCaseColor = indexValue
        }
    }
    
    func bandColorButtonDidPress(button: UIButton) {
        if let indexValue = bandColorButtons.index(of: button) {
            setColorButtonSelectedState(views: bandColorPalleteAreaViews, index: indexValue)
            watchBandColor = indexValue
        }
    }
    
    func caseAluminumColorButtonDidTouchDown(button: UIButton) {
        if let indexValue = caseAluminumColorButtons.index(of: button) {
            setColorButtonHighlightedState(views: caseAluminumColorPalleteAreaViews, index: indexValue)
        }
    }
    
    func caseStainlessSteelColorButtonDidTouchDown(button: UIButton) {
        if let indexValue = caseStainlessSteelColorButtons.index(of: button) {
            setColorButtonHighlightedState(views: caseStainlessSteelColorPalleteAreaViews, index: indexValue)
        }
    }
    
    func bandColorButtonDidTouchDown(button: UIButton) {
        if let indexValue = bandColorButtons.index(of: button) {
            setColorButtonHighlightedState(views: bandColorPalleteAreaViews, index: indexValue)
        }
    }
    
    func caseAluminumColorButtonDidTouchDragOutside(button: UIButton) {
        setAllColorButtonHighlightedState(views: caseAluminumColorPalleteAreaViews)
    }
    
    func caseStainlessSteelColorButtonDidTouchDragOutside(button: UIButton) {
        setAllColorButtonHighlightedState(views: caseStainlessSteelColorPalleteAreaViews)
    }
    
    func bandColorButtonDidTouchDragOutside(button: UIButton) {
        setAllColorButtonHighlightedState(views: bandColorPalleteAreaViews)
    }
    
    fileprivate func setupColorPalleteArea(buttons: [UIButton]) -> [UIView] {
        
        var palleteAreaViews = [UIView]()
        for button in buttons {
            button.backgroundColor = UIColor.clear
            let palleteAreaView = UIView(frame: button.bounds)
            palleteAreaView.isUserInteractionEnabled = false
            palleteAreaView.clipsToBounds = true
            button.addSubview(palleteAreaView)
            palleteAreaViews.append(palleteAreaView)
            
        }
        
        return palleteAreaViews
    }
    
    fileprivate func setupContentEdgeInsetsButton(button: UIButton){
        let radiusValue = button.bounds.height / 2
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: radiusValue, bottom: 0, right: radiusValue)
        
    }
    
    fileprivate func setAllColorButtonHighlightedState(views: [UIView], animated:Bool = true){
        
        Constants.designs.animations.defaultTertiaryAnimate(animations: {
            for view in views {
                view.alpha = 1
            }
        }, animated: animated)
        
    }
    
    fileprivate func setColorButtonHighlightedState(views: [UIView], index: Int = 0, animated:Bool = false){
        
        Constants.designs.animations.defaultTertiaryAnimate(animations: {
            for view in views {
                let alphaValue = views.index(of: view) == index ? Constants.designs.colors.disableAlpha : 1
                view.alpha = alphaValue
            }
        }, animated: animated)
    
    }
    
    fileprivate func setColorButtonSelectedState(views: [UIView], index: Int = 0, animated:Bool = true){
        Constants.designs.animations.defaultTertiaryAnimate(animations: {
            for view in views {
                let scaleValue = views.index(of: view) == index ? CGAffineTransform(scaleX: 1, y: 1) : CGAffineTransform(scaleX: 0.5, y: 0.5)
                view.transform = scaleValue
                view.alpha = 1
            }
        }, animated: animated)
        
        
    }
    
    fileprivate func setButtonSelectedState(views: [UIView], index: Int = 0, selectedBankgroundColor: UIColor = Constants.designs.colors.whiteMuted, animated:Bool = true){
        
        Constants.designs.animations.defaultTertiaryAnimate(animations: {
            for view in views {
                let isSelected = views.index(of: view) == index
                let backgroundColor = isSelected ? selectedBankgroundColor : selectedBankgroundColor.withAlphaComponent(0)
                let alphaValue = isSelected ? CGFloat(1) : Constants.designs.colors.disableAlpha
                view.backgroundColor = backgroundColor
                view.alpha = alphaValue
            }
        }, animated: animated)
        
    }
    
    
    fileprivate func setViewBackgroundColor(color: UIColor, animated: Bool = true){
        Constants.designs.animations.defaultPrimaryAnimate(animations: {
            self.view.backgroundColor = color
        }, animated: animated)
    }
    
    fileprivate func setWatchColorAndView(viewOptionIndex: Int? = nil,
                                      caseMaterialIndex: Int? = nil,
                                      caseColorIndex: Int? = nil,
                                      bandColorIndex: Int? = nil,
                                      animated: Bool = true ){
        
        if let setViewOption = viewOptionIndex {
            
        }
        
        if let setCaseMaterial = caseMaterialIndex {
            
        }
        
        if let setCaseColor = caseColorIndex {
            var backgroundColor = UIColor()
            var caseColor = UIColor()
            switch watchCaseMaterial {
            case 0:
                backgroundColor = Constants.designs.colors.colorBrighten(basedColor:  watchOptionData.pallete.caseAluminum[setCaseColor].palleteColor)
                caseColor = watchOptionData.pallete.caseAluminum[setCaseColor].palleteColor
            case 1:
                backgroundColor = Constants.designs.colors.colorBrighten(basedColor:  watchOptionData.pallete.caseStainlessSteel[setCaseColor].palleteColor)
                caseColor = watchOptionData.pallete.caseStainlessSteel[setCaseColor].palleteColor
            default:
                backgroundColor = Constants.designs.colors.colorBrighten(basedColor:  watchOptionData.pallete.caseAluminum[setCaseColor].palleteColor)
                caseColor = watchOptionData.pallete.caseAluminum[setCaseColor].palleteColor
            }
            
            self.setViewBackgroundColor(color: backgroundColor)
            Constants.designs.animations.animateSceneKit(animations: {
                self.watchCaseNode.geometry?.firstMaterial?.diffuse.contents = caseColor
            })
            
        }
        
        if let setBandColor = bandColorIndex {
            
            Constants.designs.animations.animateSceneKit(animations: {
                let bandColor = watchOptionData.pallete.band[setBandColor].palleteColor
                self.watchBandNode.geometry?.firstMaterial?.diffuse.contents = bandColor
            })
            
        }
        
        
    }

    
}
