//
//  Model.swift
//  109598048_Midterm_Homework
//
//  Created by 徐雋銘 on 2021/4/21.
//

import Foundation



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
