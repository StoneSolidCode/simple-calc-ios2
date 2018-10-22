//
//  ViewController.swift
//  simple-calc
//
//  Created by iguest on 10/16/18.
//  Copyright © 2018 stonek9. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 0
    var specialOp = ""
    var input: [String] = []
    var answer = 0.0
    var answerDisplayed = true
    var correctIndex = 0
    @IBOutlet weak var calcDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        input.append((sender.titleLabel?.text)!)
        if answerDisplayed {
            calcDisplay.text = (sender.titleLabel?.text)!
        } else {
            calcDisplay.text = ((calcDisplay.text ?? "") + (sender.titleLabel?.text)!)
        }
        print(input)
        answerDisplayed = false
    }

    @IBAction func btnOperationPressed(_ sender: UIButton) {
        var oneNum = ""
        for num in input {
            oneNum.append(num)
        }
        input = [oneNum,(sender.titleLabel?.text)!]
        calcDisplay.text = ((calcDisplay.text ?? "") + " " + (sender.titleLabel?.text)! + " ")
    }

    @IBAction func btnSpecOpPressed(_ sender: UIButton) {
        var oneNum = ""
        for i in correctIndex...(input.count - 1) {
            oneNum.append(input[i])
        }
        input[correctIndex] = oneNum
        specialOp = (sender.titleLabel?.text)!
        correctIndex += 1
        calcDisplay.text = ((calcDisplay.text ?? "") + " " + (sender.titleLabel?.text)! + " ")
    }
    
    @IBAction func btnEqualsPressed(_ sender: Any) {
        if specialOp != "" {
            input.append(specialOp)
        }
        let l = input.last
        print(input)
        if l != "count" && l != "avg" && l != "fact" {
            var oneNum = ""
            for i in 2...(input.count - 1) {
                oneNum.append(input[i])
            }
            input[2] = oneNum
            var calc: [String] = []
            for i in 0...2 {
                calc.append(input[i])
            }
            answer = calculate(calc)
            if answer - round(answer) == 0.0 {
                calcDisplay.text = String(Int(round(answer)))
            } else {
                calcDisplay.text = String(answer)
            }
        } else {
            answer = calculate(input)
            if answer - round(answer) == 0.0 {
                calcDisplay.text = String(Int(round(answer)))
            } else {
                calcDisplay.text = String(answer)
            }
        }
        input = []
        correctIndex = 0
        answerDisplayed = true
        specialOp = ""
    }
    
    @IBAction func cheatClear(_ sender: Any) {
        input = []
        calcDisplay.text = "0"
    }
    
    public func calculate(_ args: [String]) -> Double {
        let l = args.last
        if args.count == 3 && l != "count" && l != "avg" && l != "fact" {
            if args[1] == "+" {
                return Double(args[0])! + Double(args[2])!
            } else if args[1] == "*" {
                return Double(args[0])! * Double(args[2])!
            } else if args[1] == "/" {
                return Double(args[0])! / Double(args[2])!
            } else if args[1] == "-" {
                return Double(args[0])! - Double(args[2])!
            } else if args[1] == "%" {
                return Double(Int(args[0])! % Int(args[2])!)
            }
        } else if l == "count" {
            return Double(args.count - 1)
        } else if l == "avg" {
            var total = 0.0
            if args.count > 1 {
                for i in 0...(args.count - 2) {
                    total += Double(args[i])!
                }
                total = total / Double(args.count - 1)
            }
            return total
        } else if l == "fact" {
            var total = 1
            if args.count > 1 && Int(args[0]) ?? 0 > 0 {
                for i in 1...Int(args[0])! {
                    total = total * i
                }
            } else {
                total = 0
            }
            return Double(total)
        }
        return 0.0
    }
}

