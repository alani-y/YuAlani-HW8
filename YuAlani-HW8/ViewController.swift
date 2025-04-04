//
//  ViewController.swift
//  YuAlani-HW8
//
//  Created by Alani Yu on 4/4/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var switchCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imageView.image = UIImage(named: "uttower")
    }
    
    @IBAction func fadeOutImage(_ sender: Any) {
        switchCount += 1
        self.imageView.alpha = 1.0
        
        var newImage: UIImage
        
        if imageView.image == UIImage(named: "uttower"){
            newImage = UIImage(named: "ut")!
        }
        else{
            newImage = UIImage(named: "uttower")!
        }
        
        // animation 1
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options:.curveEaseOut,
            animations:{
                self.imageView.alpha = 0.0
            },
            completion: {_ in
                self.imageView.image = newImage
        
                // animation 2
                UIView.animate(
                    withDuration: 1.0,
                    delay: 0.0,
                    options:.curveEaseIn,
                    animations:{
                        self.imageView.alpha = 1.0
                    }
                )
            }
        )
    }
}

