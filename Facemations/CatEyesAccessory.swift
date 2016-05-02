//
//  CatEyesAccessory.swift
//  Facemations
//
//  Created by dede.exe on 02/05/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//


import UIKit
import FaceTracker

public class CatEyesAccessory: GlassAccessory
{
    init()
    {
        super.init(imageNamed: "cat-eyes")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func injectPoints(points: FacePoints?) {
        super.injectPoints(points)
    }
    
    public override func updatePosition()
    {
        super.updatePosition()
        
        let width = eyesCornerDistance * 2.0
        let height = (imageSize.height / imageSize.width) * width
        
        self.transform = CGAffineTransformIdentity
        self.frame = CGRect(x: eyesCenter.x,
                            y: eyesCenter.y,
                            width: width,
                            height: height)
        
        self.center = eyesCenter
        self.frame.origin.y -= 30
        
        
        self.transform = CGAffineTransformMakeRotation(eyesAngulation)
        
    }
    
}