//
//  HistoryViewController.swift
//  SimpleCalc
//
//  Created by Timothy Luong on 4/26/16.
//  Copyright © 2016 Timothy Luong. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    var history: [String] = [];
    @IBOutlet var scrollView: UIScrollView!
    //@IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        scrollView.contentSize = CGSizeMake(screenSize.width, CGFloat(history.count * 20));
        var yPos: CGFloat = 1
        for lines in history {
            var label = UILabel(frame: CGRectMake(0, (yPos - 1) * 20, screenSize.width, 20))
            //label.center = CGPointMake(screenSize.width / 2, screenSize.height / 2)
            label.textAlignment = NSTextAlignment.Left
            label.text = "Line" + String(Int(yPos)) + " " + lines
            scrollView.addSubview(label)
            yPos += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let MainView: ViewController = segue.destinationViewController as! ViewController;
        MainView.history = history;
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
