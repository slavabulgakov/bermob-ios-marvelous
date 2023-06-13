//
//  ItemHeroRow.swift
//  MarvelousApp
//
//  Created by Sergio Ruiz Pérez on 01.09.22.
//

import SwiftUI
import MarvelAPI

struct ItemHeroRow: View {
    let hero: Character
    
    
    
    var body: some View {
        HStack {
            Text(hero.name ?? "")
                .font(.subheadline)
                .bold()
                .lineLimit(2)
                .padding()
            
//            Spacer()

            Text(hero.desc ?? "")
                .font(.caption2)
                .lineLimit(2)
                .padding()
        }
    }
}

struct ItemHeroRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemHeroRow(hero: Character.example())
    }
}
