//
//  GalleryViewController.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/14/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit
import SceneKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var sceneKitView: SCNView!
    
    let scene = SCNScene(named: "ScenekitAssets.scnassets/watchGallerayExample.scn")!
    
    let mainNode = SCNNode()
    
    let cameraNode:SCNNode = {
        let fromOrigin:Float = 150
        let zNear = fromOrigin - 150
        let zFar = fromOrigin + 150
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        
        camera.xFov = 24
//        camera.yFov = 32
        
        camera.zFar = Double(150)
        camera.zNear = Double(50)
        
        
        camera.focalDistance = 85
        camera.focalSize = 4
        camera.aperture = 1/4 //1.2
//        camera.focalBlurRadius = 16
        
        camera.colorFringeStrength = 1
        camera.colorFringeIntensity = 1
        
        
        
        cameraNode.camera = camera
//        cameraNode.camera?.projectionTransform
        
        
        
        cameraNode.position = SCNVector3(x: -67.716, y: 0, z: -53.586)
        cameraNode.rotation = SCNVector4(0, -46.836, 0, 1)
        
//            = SCNVector3(x: -9.289, y: -8.712, z: -85.409)
        
//        cameraNode.transform = SCNMatrix4MakeRotation(<#T##angle: Float##Float#>, <#T##x: Float##Float#>, <#T##y: Float##Float#>, <#T##z: Float##Float#>)
        
        
        
        return cameraNode
    }()
        

    @IBOutlet var textContainerViews: [UIView]!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var scrollLineIndicatorView: ScrollLineIndicator!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupScenekit()
        
    }
    
    override func viewDidLayoutSubviews() {
        setupDesign()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupDesign() {
        
        scrollLineIndicatorView.basedColor = Constants.designs.colors.black.withAlphaComponent(0.1)
        //
        scrollLineIndicatorView.indicatorColor = Constants.designs.colors.black.withAlphaComponent(0.3)
        //
        scrollLineIndicatorView.contentLength = mainScrollView.contentSize == CGSize.zero ? 1 : mainScrollView.contentSize.width
        //
        scrollLineIndicatorView.isRounded = true
        //
        scrollLineIndicatorView.visibleLength = mainScrollView.frame.width
        var watchNameTextViews = [watchNameTextView]()
        for textContainerView in textContainerViews {
            
            watchNameTextViews.append(textContainerView.subviews.first as! watchNameTextView)
            
        }
        
        
        for watchNameTextView in watchNameTextViews {
            
            let index = watchNameTextViews.index(of: watchNameTextView)
            watchNameTextView.watchNameText = watchGalleryData.value[index!].name
            watchNameTextView.awakeFromNib()
            
        }

        
    }
    
    private func setupScenekit() {
        
        print(scene)
        self.scene.rootNode.addChildNode(cameraNode)
        mainNode.addChildNode(scene.rootNode.childNode(withName: "parentNode", recursively: true)!)
//        cameraNode = scene.rootNode.childNode(withName: "camera", recursively: true)!
        self.scene.rootNode.addChildNode(mainNode)
        
        self.scene.background.contents = UIColor.white
        
        
        
        sceneKitView.antialiasingMode = .multisampling4X
        sceneKitView.isJitteringEnabled = true
        
        sceneKitView.scene = self.scene
//        sceneKitView.renderingAPI = open
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            scrollLineIndicatorView.contentOffset = scrollView.contentOffset.x
            
            let pageIndex =  scrollView.contentOffset.x / scrollView.bounds.width
            let zPosition = (pageIndex * CGFloat(25))
            mainNode.position.z = Float(-zPosition)
            print((pageIndex * CGFloat(25)))
        }
    }
    
    
}

