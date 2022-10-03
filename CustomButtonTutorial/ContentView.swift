//
//  ContentView.swift
//  CustomButtonTutorial
//
//  Created by Lasse Silkoset on 03/10/2022.


/*
 5. tre states. inactive, active og loading. (hint: Enum)
 */
//

import SwiftUI

struct ContentView: View {
    
    @State var buttonState: ButtonState = .inactive
    
    var body: some View {
        VStack {
            
            Button {
                buttonState = .active
            } label: {
                Text("Make active")
            }

            
            LoadingButton(buttonTitle: "Hello World", buttonColor: .blue, buttonState: $buttonState) {
                print("Dette er i contentView")
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
