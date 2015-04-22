//
//  ViewController.swift
//  FunFacts
//
//  Created by Luiz Carlos Gonçalves dos Anjos on 20/04/15.
//  Copyright (c) 2015 Luiz Carlos Gonçalves dos Anjos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    
    let bookFacts = BookFacts()
    let colorWhell = ColorWhell()
    var isAnimation = false
    let withAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        funFactLabel.text = bookFacts.randomFact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showFunFact() {
        if isAnimation{
            return
        }
        
        //get color random
        let color = colorWhell.randomColor()
        
        //tint color button
        funFactButton.tintColor = color
        //change text fun fact
        funFactLabel.text = bookFacts.randomFact()
        
        if withAnimation{
            animation(color: color)
        }
        else{
            //set color in background
            view.backgroundColor = color
        }
    }
    
    func animation(#color:UIColor){
        isAnimation = true
        var options = UIViewAnimationOptions.CurveEaseOut
        var duration = 0.4
        UIView.animateWithDuration(duration, delay:0, options:options, animations:{
            //change color view
            self.view.backgroundColor = color
            //change position label
            self.funFactLabel.frame = CGRect(
                x: self.funFactLabel.frame.origin.x - 10,
                y: self.funFactLabel.frame.origin.y,
                width: self.funFactLabel.frame.width,
                height: self.funFactLabel.frame.height)
            }, completion:{
                finished in
                self.isAnimation = false
        })
    }
    
}

