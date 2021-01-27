//
//  ImageExtensions.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/27/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    //MARK:- Kingfisher
    
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
    
    
    //MARK:- RoundCorners
    
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [CACornerMask]
    }
    
    
}


