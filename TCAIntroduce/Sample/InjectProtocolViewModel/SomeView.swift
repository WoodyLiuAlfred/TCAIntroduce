//
//  SomeView.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/31.
//

import SwiftUI

struct SomeView<ViewModel>: View where ViewModel: SomeViewModel {
    
   @StateObject var viewModel: ViewModel
        
    var body: some View {
        Button("") { viewModel.foo() }
            .fullScreenCover(isPresented: viewModel.someBinding) { Color(.blue) }
    }

}

