//
//  ThemedButton.swift
//  SwiftUIGameOfLife
//

import SwiftUI

public struct ThemedButton: View {
    public var text: String
    public var action: () -> Void

    public init(
        text: String,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.action = action
    }

    public var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Text(text)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: false)
                    .frame(width: 80.0, height: 70.0)
            }
            .background(Circle().fill(Color("accent")))
            // Your Problem 2 code goes here.
            .overlay(Circle().stroke(Color.white, lineWidth: 3.0))
            .shadow(radius: 2.0)
            Spacer()
        }
    }
}

// MARK: Previews
struct ThemedButton_Previews: PreviewProvider {
    static var previews: some View {
        ThemedButton(text: "Random") { }
    }
}
