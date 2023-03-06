//
//  WelcomeView.swift
//  poke-test
//
//  Created by Samantha Cruz on 3/3/23.
//

import SwiftUI

struct WelcomeView: View {
    var viewModel: WelcomeViewModelRepresentable
    @State var isActive = false
    @State var size = 0.8
    @State var opacity = 0.5
    
    var body: some View {
        VStack {
            VStack {
                Image("pokeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    size = 0.9
                    opacity = 1.0
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isActive = true
                if isActive {
                    viewModel.goToPokemon()
                }
            }
        }
    }
}

