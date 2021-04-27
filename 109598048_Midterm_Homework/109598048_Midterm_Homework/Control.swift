//
//  Control.swift
//  109598048_Midterm_Homework
//
//  Created by 徐雋銘 on 2021/4/21.
//

import Foundation

var modifier: String="n" //運算子區
var input: String="0" // 輸入區
var save: String="" //保存區
var lastIsDot="no"//input出現過小數點了嗎
var output=""
var Buff=[String]()
var buffCount=0


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
