//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Timothy Luong on 4/21/16.
//  Copyright © 2016 Timothy Luong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
    {
        return .All
    }
    
    var typing = false
    var n1 = 0; var n2 = 0
    var op = ""
    var count = 0
    var sum = 0
    var history: [String] = []
    var line = ""
    
    @IBAction func numClicked(sender: AnyObject) {
        if typing {
            resultText.text = resultText.text! + sender.currentTitle!!
        } else {
            resultText.text = sender.currentTitle!!
            typing = true
        }
    }
    
    @IBAction func opClicked(sender: AnyObject) {
        typing = false
        n1 = Int(resultText.text!)!
        op = sender.currentTitle!!
        if (op == "Count" || op == "Avg") {
            count += 1
            sum += n1
        }
        if op == "%" {
            line += String(n1) + "mod"
        } else {
            line += String(n1) + String(op)
        }
    }
    
    @IBAction func equals(sender: AnyObject) {
        typing = false
        n2 = Int(resultText.text!)!
        var result = 0
        switch(op) {
            case "+":
                result = n1 + n2
                break
            case "-":
                result = n1 - n2
                break
            case "X":
                result = n1 * n2
                break
            case "%":
                result = n1 % n2
                break
            case "/":
                result = n1 / n2
                break
            case "Count":
                result = count + 1
                count = 0
                break
            case "Avg":
                result = (sum + n2) / (count + 1)
                count = 0
                sum = 0
                break
            case "Fact":
                result = 1
                for x in 1...n1 {
                    result *= x
                }
                break
            default:
                result = 0
        }
        resultText.text = "\(result)"
        if (op == "Fact") {
            history.append(line + "=" + String(result))
        } else {
            history.append(line + String(n2) + "=" + String(result))
        }
        NSLog(history[history.count - 1])
        line = ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let HistoryView: HistoryViewController = segue.destinationViewController as! HistoryViewController;
        HistoryView.history = history;
    }

}

