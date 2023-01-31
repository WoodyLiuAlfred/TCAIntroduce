//
//  SomeViewModel.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/31.
//

import Foundation
import SwiftUI

protocol SomeViewModel: ObservableObject {
    var someBinding: Binding<Bool> { get }
    func foo()
}

class SomeViewModelSample: SomeViewModel {
    
    @Published var bool = false
    
    var someBinding: Binding<Bool> {
        return Binding(get: { return self.bool}, set: { self.bool = $0 })
    }
    
    func foo() {}
}

