//
//  ViewController.swift
//  109598048_Midterm_Homework
//
//  Created by 徐雋銘 on 2021/4/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Answer: UILabel!
    @IBOutlet weak var Process: UILabel!
    
    var modifier: String="n" //運算子區
    var input: String="0" // 輸入區
    var save: String="" //保存區
    var lastIsDot="no"//input出現過小數點了嗎
    var output=""
    var Buff=[String]()
    var buffCount=0
 
    
    
    @IBAction func Numbers(_ sender: UIButton) {
        let inputNumber=sender.tag
        if(modifier != "n")
        {
            updateInput()
            modifier="n"
        }
        
        if(beforeZero()==0){input="\(inputNumber)"}
        else{input+="\(inputNumber)"}
        Answer.text=input
        Process.text=save
        
    }
    
    @IBAction func AC(_ sender: UIButton) {
        buffCount=0
        Buff.removeAll()
        lastIsDot="no"
        input="0"
        save=""
        modifier="n"
        Answer.text=input
        Process.text=" "
    }
    @IBAction func PositiveOrNot(_ sender: UIButton)
    {
        if(lastIsDot != "no")
        {
            var temp=Float(input)!
            temp *= -1
            input="\(temp)"
            
        }
        if(lastIsDot == "no")
        {
            var temp=Float(input)!
            temp *= -1
            input="\(temp)"
            
        }
        
        Answer.text=input
    }
    @IBAction func remainder(_ sender: UIButton) {
        
        var temp=Float(input)!
        if(temp != 0)
        {
            temp /= 100
            input="\(temp)"
            Answer.text=input
        }
        
    }
    @IBAction func add(_ sender: UIButton) {
        modifier="+"
        Answer.text="+"
        Process.text=save+afterZero(input: input)
        
    }
    @IBAction func Subtraction(_ sender: UIButton) {
        modifier="-"
        Answer.text="-"
        Process.text=save+afterZero(input: input)
    }
    @IBAction func multiplication(_ sender: UIButton) {
        modifier="X"
        Answer.text="X"
        Process.text=save+afterZero(input: input)
    }
    @IBAction func division(_ sender: UIButton) {
        modifier="÷"
        Answer.text="÷"
        Process.text=save+afterZero(input: input)
    }
    @IBAction func Equal(_ sender: UIButton) {
        modifier="="
        updateInput()
        Process.text=save+afterZero(input: input)+calculator()
        Answer.text=calculator()
        
        
        
    }
    @IBAction func Decimalpoint(_ sender: UIButton) {
        if(modifier == "n")
        {
            if(lastIsDot == "no" )
            {
             lastIsDot="yes"
             input+="."
             Answer.text=input
            }
        }
        
    }
    
    
    func updateInput() {
        if(lastIsDot != "no")
        {
            lastIsDot="no"
            save+=afterZero(input: input)+modifier
            
             buffCount += 2;
            Buff.append(afterZero(input: input))
             Buff.append(modifier)
                
            input="0"
        }
        else
        {
         lastIsDot="no"
         save+=input+modifier
            
         buffCount += 2;
         Buff.append(input)
         Buff.append(modifier)
            
         input="0"
        }
    }
    
    func afterZero(input:String)->String //判斷小數點後多餘的0
   {
    var temp=""
    var temp2=""
    var check=0;
    for index in input.indices.reversed() {
        if(input[index] != "0"){check=1}
        if(check == 1)
        {
            temp += ("\(input[index])")
        }
    }
    for index in temp.indices.reversed()
    {
        temp2+=("\(temp[index])")
    }
    
    return temp2
   }
   
    func beforeZero()->Int //判斷前面多餘的0
    {
        var count=0 //目前input的非0個數
        for index in input.indices {
            var temp=("\(input[index])")
            if(temp != "0"){count=1}
        }
        return count
    }
    
    
    func calculator()->String
    {
        var HowMuchModifier=0
        var HowMuchAddSub=0
        var sum:Float
        sum=0
                for numbers in 0...buffCount-1
                {
                    if(Buff[numbers] == "X"){HowMuchModifier += 1}
                    if(Buff[numbers] == "÷"){HowMuchModifier += 1}
                    if(Buff[numbers] == "+"){HowMuchAddSub += 1}
                    if(Buff[numbers] == "-"){HowMuchAddSub += 1}
                }
              if(HowMuchModifier != 0)
              {
                for index in 1...HowMuchModifier
                {
                    var temp = [String]()
                    var tempCount=0
                    for numbers2 in 0...buffCount-1
                    {
                        temp.append("n")
                    }
                    for numbers in 0...buffCount-1
                    {
                        if(Buff[numbers] == "X")
                        {
                            Buff[numbers-1]=("\(Float(Buff[numbers-1])!*Float(Buff[numbers+1])!)")
                            Buff[numbers+1]="n"
                            Buff[numbers]="n"
                            
                            break
                        }
                        else if(Buff[numbers] == "÷")
                        {
                            if(Buff[numbers+1]=="0")
                            {
                                Buff[numbers-1]="\(Float(0))"
                                Buff[numbers+1]="n"
                                Buff[numbers]="n"
                                break
                            }
                            else
                            {
                              Buff[numbers-1]=("\(Float(Buff[numbers-1])!/Float(Buff[numbers+1])!)")
                              Buff[numbers+1]="n"
                              Buff[numbers]="n"
                              break
                            }
                        }

                    }
                    for numbers in 0...buffCount-1
                    {
                        if(Buff[numbers] != "n")
                        {
                            temp[tempCount]=Buff[numbers]
                            tempCount += 1
                        }
                    }
                    
                    for numbers in 0...tempCount
                    {
                        Buff[numbers]=temp[numbers]
                    }
                    buffCount -= (buffCount-tempCount)
                    
                }
              }
        
                for index in 0...buffCount-1
                {
                    if(index == 0){sum=Float(Buff[index])!}
                    if(Buff[index] == "+"){sum += Float(Buff[index+1])!}
                    if(Buff[index] == "-"){sum -= Float(Buff[index+1])!}
                    
                }
        
        var end="\(sum)"
        var a=0

        for index in end.indices.reversed() {
            
            if(a==1 && "\(end[index])" == "."){
                end="\(Int(sum))"
                break
            }
            if(a==0 && "\(end[index])" == "0"){}
            else{a=5}
            
            
            a += 1
        }
               
       return end
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

