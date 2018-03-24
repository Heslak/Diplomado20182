//: [Previous](@previous)

//: Playground - noun: a place where people can play

import UIKit

let main = DispatchQueue.main
let background = DispatchQueue.global()

func doSyncWork(){
    background.async{
        for _ in 1...3 {
            print("Light")
        }
    }
    for _ in 1...3{
        print("Heavy")
    }
    
}

doSyncWork()

let brownWorker = DispatchQueue (label: "construction_worker_1")
let asianWorker = DispatchQueue (label: "construction_worker_2")

func doLightWork(){
    asianWorker.async {
        for _ in 1...10 {
            print("👷‍♂️")
        }
    }
    brownWorker.async {
        for _ in 1...10{
            print("👷🏽‍♂️")
        }
    }
}
doLightWork()

let whiteWorker = DispatchQueue(label: "contrusction_worker_3", qos: .background)
let blackWorker = DispatchQueue(label: "contrusction_worker_4", qos: .userInitiated)

func doLightWorks(){
    whiteWorker.async {
        for _ in 1...10 {
            print("👷🏻‍♂️")
        }
    }
    
    blackWorker.async {
        for _ in 1...10 {
            print("👷🏿‍♂️")
        }
    }
}
doLightWorks()
/*
 Prioridades de los Queue
 userInteractive (highest Priority)
 userInitiated
 default
 utility
 background
 unspecified(lowest)
 
 */



//: [Next](@next)
