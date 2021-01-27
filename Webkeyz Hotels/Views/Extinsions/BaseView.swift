//
//  BaseView.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import Foundation
import UIKit

@IBDesignable
class BaseView: UIView {
    
    
    @IBInspectable var isShadow: Bool = true {
        didSet {
            self.updateProperties()
        }
    }
    
    @IBInspectable var isCircle: Bool = false {
        didSet {
            self.cornerRadius = self.frame.height/2
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.updateProperties()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.updateProperties()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            self.updateProperties()
        }
    }
    
    
    /// The shadow color of the ShadowView, inspectable in Interface Builder
    @IBInspectable var shadowColor: UIColor = UIColor.lightText {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow offset of the ShadowView, inspectable in Interface Builder
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow radius of the ShadowView, inspectable in Interface Builder
    @IBInspectable var shadowBlure: CGFloat = 3 {
        didSet {
            self.updateProperties()
        }
    }
    /// The shadow opacity of the ShadowView, inspectable in Interface Builder
    @IBInspectable var shadowOpacity: Float = 4 {
        didSet {
            self.updateProperties()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateProperties()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateProperties()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateProperties()
    }
    
    /**
     Updates all layer properties according to the public properties of the ShadowView.
     */
    fileprivate func updateProperties() {
        
        
        if isShadow{
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = shadowOpacity
            layer.shadowOffset = shadowOffset
            layer.shadowRadius = shadowBlure
        }
        layer.cornerRadius  = cornerRadius
        layer.borderColor = borderColor?.cgColor ?? self.backgroundColor?.cgColor ?? UIColor.white.cgColor
        layer.borderWidth = borderWidth
        //            layer.masksToBounds = false
        //            layer.shouldRasterize = true
        //            layer.rasterizationScale = true ? UIScreen.main.scale : 1
        
        //        clipsToBounds = true
        //        self.layer.masksToBounds  = true
    }
    
}

import UIKit

@IBDesignable
class BaseImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
        
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor ?? self.backgroundColor?.cgColor ?? UIColor.white.cgColor
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

