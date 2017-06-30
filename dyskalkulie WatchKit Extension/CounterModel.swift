//
//  CounterModel.swift
//  dyskalkulie
//
//  Created by Sergey Bakin on 30.06.17.
//  Copyright © 2017 idleon. All rights reserved.
//

import Foundation

class CounterModel {
    
    private var strokesPlayerOne = Array(repeating: 0, count: 18)
    private var strokesPlayerTwo = Array(repeating: 0, count: 18)
    
    func getStrokesPlayerOne(hole: Int) -> Int {
        return strokesPlayerOne[hole]
    }
    
    func getStrokesPlayerTwo(hole: Int) -> Int {
        return strokesPlayerTwo[hole]
    }
    
    func incrementStrokesPlayerOne(hole: Int) {
        strokesPlayerOne[hole] = strokesPlayerOne[hole] + 1
    }
    
    func incrementStrokesPlayerTwo(hole: Int) {
        strokesPlayerTwo[hole] = strokesPlayerTwo[hole] + 1
    }
    
    func decrementStrokesPlayerOne(hole: Int) {
        if strokesPlayerOne[hole] > 0 {
            strokesPlayerOne[hole] = strokesPlayerOne[hole] - 1
        }
    }
    
    func decrementStrokesPlayerTwo(hole: Int) {
        if strokesPlayerTwo[hole] > 0 {
            strokesPlayerTwo[hole] = strokesPlayerTwo[hole] - 1
        }
    }
    
}
