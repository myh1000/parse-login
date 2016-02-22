//
//  ViewController.swift
//  Aced
//
//  Created by family on 1/18/16.
//  Copyright © 2016 Sage Michael. All rights reserved.
//
//

import UIKit
import Parse

class HomeViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                print("ShowWalkthrough")
                let viewController = UIStoryboard(name: "Walkthrough", bundle: nil)
                let walkthrough = viewController.instantiateViewControllerWithIdentifier("walk0") as! BWWalkthroughViewController
                let page_one = viewController.instantiateViewControllerWithIdentifier("walk1") as UIViewController
                let page_two = viewController.instantiateViewControllerWithIdentifier("walk2") as UIViewController
                let page_three = viewController.instantiateViewControllerWithIdentifier("walk3") as UIViewController
                let page_four = viewController.instantiateViewControllerWithIdentifier("walk4") as UIViewController
                
                walkthrough.delegate = self
                walkthrough.addViewController(page_one)
                walkthrough.addViewController(page_two)
                walkthrough.addViewController(page_three)
                walkthrough.addViewController(page_four)
                
                self.presentViewController(walkthrough, animated: false, completion: nil)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pUserName = PFUser.currentUser()?["username"] as? String {
            self.userNameLabel.text = "@" + pUserName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
