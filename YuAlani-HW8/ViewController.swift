//
//  ViewController.swift
//  YuAlani-HW8
//
//  Created by Alani Yu on 4/4/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var clickCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestBtnPushed((Any).self)
        // Do any additional setup after loading the view.
        self.imageView.image = UIImage(named: "uttower")
    }
    
    @IBAction func fadeOutImage(_ sender: Any) {
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
        clickCount += 1
        
        // checks if the user has clicked a valid num of times
        if clickCount % 4 == 0{
            scheduleBtnPushed(Any.self)
        }
    }
    
    // asks for notification permissions
    func requestBtnPushed(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) {
            (granted,error) in
            if granted {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func scheduleBtnPushed(_ sender: Any) {
        // create content
        let content = UNMutableNotificationContent()
        content.title = "Click Content"
        content.subtitle = "Number of clicks"
        content.body = "You've clicked \(clickCount) times"
        content.sound = UNNotificationSound.default
        
        // create 8 second trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8.0, repeats: false)
        
        // combine it all into a request
        let request = UNNotificationRequest(
            identifier: "countNotification",
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
    }
}

