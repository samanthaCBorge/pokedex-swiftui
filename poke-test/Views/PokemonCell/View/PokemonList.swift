//
//  SwiftUIView.swift
//  poke-test
//
//  Created by Samantha Cruz on 28/2/23.
//

import SwiftUI

struct PokemonListView: View {
    var viewModel: PokemonViewModelRepresentable
    @State var pokemon = [PokemonEntry]()
    
     var gridItemLayout = [GridItem(.flexible()),
                           GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(pokemon, id: \.id) { pokemon in
                        HStack(spacing: 5) {
                            Text(pokemon.name)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 24, alignment: .leading)
                                .padding(.leading, 15)
                            PokemonImage(imageLink: "\(pokemon.url)")
                           
                        }
                        .background(Color.purple)
                        .cornerRadius(12)
                        .shadow(color: .purple, radius: 6, x: 0, y: 0)
                    }
                }
            }
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .background(Color.clear)
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .navigationTitle("POKEDEX")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
}

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                } else {
                    getSprite(url: loadedData!)
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
            .scaledToFit()
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonSelectedApi().getSprite(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
        
    }
}

