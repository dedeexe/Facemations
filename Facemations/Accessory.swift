//
//  Accessory.swift
//  Facemations
//
//  Created by dede.exe on 24/04/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import UIKit
import FaceTracker

public class Accessory: UIImageView {
    
    var imageSize : CGSize
    {
        guard let _ = self.image else {
            return CGSize(width: 0, height: 0)
        }
        
        return CGSize(width: self.image!.size.width, height: self.image!.size.height)
    }
    
    init(imageNamed:String) {
        super.init(image: UIImage(named: imageNamed))
    }
    
    
    public func injectPoints(points: FacePoints?) {}
    
    func updatePosition() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}