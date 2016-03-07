//
//  ViewController.swift
//  MultipleTappableLinksLabelDemo
//
//  Created by Robin on 3/7/16.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var linkLabel: UILabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.backgroundColor = UIColor.redColor()
        
        linkLabel.frame = CGRect(x: 20, y: 100, width: view.frame.maxX - 40, height: 80)
        linkLabel.textColor = UIColor.whiteColor()
        linkLabel.numberOfLines = 0
        linkLabel.userInteractionEnabled = true
        view.addSubview(linkLabel)
        
        underlineLabel()
    }
    
    
    
    func underlineLabel() {
        linkLabel.text = "By signing up you agree to our Terms & Conditions and Privacy Policy"
        let text = linkLabel.text!
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).rangeOfString("Terms & Conditions")
        
        underlineAttriString.addAttributes(
                [NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue,
                NSForegroundColorAttributeName : UIColor.yellowColor()],
            range: range1)
        
        let range2 = (text as NSString).rangeOfString("Privacy Policy")
        
        underlineAttriString.addAttributes(
                [NSUnderlineStyleAttributeName : NSUnderlineStyle.StyleSingle.rawValue,
                NSForegroundColorAttributeName : UIColor.yellowColor()],
            range: range2)
        
        linkLabel.attributedText = underlineAttriString
        
        
        //add tap 
        linkLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tappedLink:")))
    }
    
    func tappedLink(gesturer: UITapGestureRecognizer) {
        
        let text = linkLabel.text!
        let range1 = (text as NSString).rangeOfString("Terms & Conditions")
        let range2 = (text as NSString).rangeOfString("Privacy Policy")
        
        
        if gesturer.didTapAttributedTextInLabel(linkLabel, targetRange: range1) {
            print("Terms & Conditions")
        } else if gesturer.didTapAttributedTextInLabel(linkLabel, targetRange: range2) {
            print("Privacy Policy")
        } else {
            print("Tapped none")
        }
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

