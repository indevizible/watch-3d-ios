//
//  WatchDataExtension.swift
//  Watch 3D
//
//  Created by VIRAKRI JINANGKUL on 1/15/17.
//  Copyright © 2017 VIRAKRI JINANGKUL. All rights reserved.
//

import UIKit
import SceneKit

struct watchGalleryData {
    static let value: [watchGalleryValue] = [
        watchGalleryValue(name: "Silver Aluminum Case with\nWhite Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Gold Aluminum Case with\nConcrete Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Gold Aluminum Case with\nCocoa Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Rose Gold Aluminum Case with\nPink Sand Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Rose Gold Aluminum Case with\nMidnight Blue Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Space Gray Aluminum Case with\nBlack Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Stainless Steel Case with\nWhite Sport Band", model: SCNScene()),
        watchGalleryValue(name: "Space Black Stainless Steel Case\nwith Black Sport Band", model: SCNScene())
    ]
}

struct watchOptionData {
    struct pallete {
        static let caseAluminum: [watchMaterialValue]  = [
            watchMaterialValue(name: "Silver Aluminum",
                               palleteColor: Constants.designs.colors.palletes.caseAluminumSilver,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Space Gray Aluminum",
                               palleteColor: Constants.designs.colors.palletes.caseAluminumSpaceGray,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Gold Aluminum",
                               palleteColor: Constants.designs.colors.palletes.caseAluminumGold,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Rose Gold Aluminum",
                               palleteColor: Constants.designs.colors.palletes.caseAluminumRoseGold,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil)
        
        ]
        
        static let caseStainlessSteel: [watchMaterialValue] = [
            watchMaterialValue(name: "Stainless Steel",
                               palleteColor: Constants.designs.colors.palletes.caseStainlessSteel,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Space Black Stainless Steel",
                               palleteColor: Constants.designs.colors.palletes.caseStainlessSteelSpaceBlack,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil)
        ]
        
        static let band: [watchMaterialValue] = [
            watchMaterialValue(name: "Yellow",
                               palleteColor: Constants.designs.colors.palletes.bandYellow,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Red",
                               palleteColor: Constants.designs.colors.palletes.bandRed,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Pink Sand",
                               palleteColor: Constants.designs.colors.palletes.bandPinkSand,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "White",
                               palleteColor: Constants.designs.colors.palletes.bandWhite,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Concrete",
                               palleteColor: Constants.designs.colors.palletes.bandConcrete,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Cocoa",
                               palleteColor: Constants.designs.colors.palletes.bandCocoa,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Midnight Blue",
                               palleteColor: Constants.designs.colors.palletes.bandMidnightBlue,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Ocean Blue",
                               palleteColor: Constants.designs.colors.palletes.bandOceanBlue,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Turquoise",
                               palleteColor: Constants.designs.colors.palletes.bandTurquoise,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil),
            watchMaterialValue(name: "Black",
                               palleteColor: Constants.designs.colors.palletes.bandBlack,
                               diffuseColor: UIColor(),
                               metalness: nil,
                               roughness: nil)
        ]
    }
}

struct watchGalleryValue {
    var name = String();
    var model = SCNScene();
}

struct watchMaterialValue {
    var name = String();
    var palleteColor = UIColor();
    var diffuseColor:UIColor;
    var metalness:Any?;
    var roughness:Any?;
}



