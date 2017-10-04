//
//  UIViewHelper.swift
//  YNLive
//
//  Created by libo on 2017/10/4.
//  Copyright © 2017年 libo. All rights reserved.
//

extension UIView{
    @IBInspectable var borderWidth:CGFloat{
        get{
            return self.layer.borderWidth
        }
        
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
}
