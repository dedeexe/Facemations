//
//  AccessoryProtocol.swift
//  Facemations
//
//  Created by dede.exe on 24/04/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import Foundation
import FaceTracker

protocol AccessoryProtocol
{
    func injectPoints(points:FacePoints?)
    func updatePosition()
}