//
//  ContentView.swift
//  TCAIntroduce
//
//  Created by Woody Liu on 2023/1/30.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    typealias States = SignInReduce.States
    typealias Action = SignInReduce.Action
    
    var store: Store<States, Action> = Store(initialState: States(stauts: .ready),
                                             reducer: SignInReduce.reducer, environment: SignInReduce.Environment.test)
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                VStack {
                    Button(action: {
                        viewStore.send(.appleSignIn)
                    }, label: {
                        Text("Apple Sign In")
                    })
                    Button(action: {
                        viewStore.send(.signInEmail(with: "111", password: "1111"))
                    }, label: {
                        Text("Email Sign In")
                    })
                    
                }
                
                MyProgressView(show: viewStore.binding(get: { SignInStatus.isSignIning == $0.stauts }, send: .ready))
            }
            
            .fullScreenCover(isPresented: viewStore.binding(get: {
                if case SignInStatus.didSignIn = $0.stauts {
                    return true
                }
                return false
            }, send: .ready ), content: {
                ZStack {
                    Rectangle()
                        .fill(.white)
                    VStack {
                        HStack {
                            Button(action: {
                                viewStore.send(.ready)
                            }, label: {
                                Text(" 上一頁").font(.largeTitle)
                            })
                            Spacer()
                        }
                        Spacer()
                        Text("Did Login")
                        Text("email: \(viewStore.stauts.user!.email)")
                        Text("name: \(viewStore.stauts.user!.name!)")
                        Text("idToken: \(viewStore.stauts.user!.firebaseIDToken)")
                        Spacer()
                    }
                }
               
            })
        }
        
        
        
    }
}

struct MyProgressView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        if show {
            ZStack {
                Rectangle()
                    .fill(Color(UIColor.black.withAlphaComponent(0.1)))
                    .ignoresSafeArea(.all)
                ProgressView()
                    .scaleEffect(2)
                    .tint(.orange)
            }
            
        } else {
            EmptyView()
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
