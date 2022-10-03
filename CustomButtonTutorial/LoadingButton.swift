//
//  LoadingButton.swift
//  CustomButtonTutorial
//
//  Created by Lasse Silkoset on 03/10/2022.
//

import SwiftUI

enum ButtonState {
    case active
    case inactive
    case loading
}

/**
 Her kan du skrive en desc
 */
struct LoadingButton: View {
    
    let buttonTitle: String
    let buttonColor: Color
    @Binding var buttonState: ButtonState
    let handler: () -> ()
    
    var body: some View {
        ZStack {
            Button {
                handler()
                buttonState = buttonState == .active ? .loading : .active
            } label: {
                Text(getButtonTitle())
                    .frame(width: buttonState == .loading ? 50 : 200, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(buttonState == .inactive ? Color.gray : buttonColor)
                    .cornerRadius(.infinity)
            }
            .disabled(buttonState == .inactive)
            .animation(.easeInOut(duration: 0.2), value: buttonState)
            
            
            buttonState == .loading ?
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
            : nil
        }
    }
    
    private func getButtonTitle() -> String {
        switch buttonState {
        case .active:
            return buttonTitle
        case .inactive:
            return buttonTitle
        case .loading:
            return ""
        }
    }
}

struct LoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        LoadingButton(buttonTitle: "Test", buttonColor: .red, buttonState: .constant(.active), handler: {})
    }
}
