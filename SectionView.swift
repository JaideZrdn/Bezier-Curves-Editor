//
//  SectionView.swift
//  Bezier
//
//  Created by Jaide Zardin on 05/12/24.
//

import SwiftUI

struct SectionView: View {
    
    let section: SectionCases
    
    var body: some View {
        
        VStack {
            Image(systemName: section.systemImage)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.red)
            
            Text(section.textTitle)
                .font(.title)
                .bold()
            
            Text(section.textDescription)
                .font(.body)
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: 700)
            
            
            
        }
        
        
    }
    
    enum SectionCases {
        case colocandoPontos
        case movendoPontos
        case deletandoPontos
        
        var systemImage: String {
            switch self {
            case .colocandoPontos:
                return "dot.circle.and.hand.point.up.left.fill"
            case .movendoPontos:
                return "pencil.circle.fill"
            case .deletandoPontos:
                return "trash.circle.fill"
            }
        }
        
        var textTitle: String {
            switch self {
            case .colocandoPontos:
                return "Colocando Pontos"
            case .movendoPontos:
                return "Movendo Pontos"
            case .deletandoPontos:
                return "Deletando Pontos"
            }
        }
        
        var textDescription: String {
            switch self {
            case .colocandoPontos:
                return "Para colocar pontos de controle que irão compor a sua Curva de Bézier clique na tela com toque único. (A curva começará a ser desenhada à partir do momento que tivermos mais de 2 pontos de controle)"
            case .movendoPontos:
                return "Para alterar a curva, arraste os pontos de controle como desejar pela tela."
            case .deletandoPontos:
                return "Aperte duas vezes em um ponto de controle para deletá-lo da Curva de Bézier"
            }
        }
    }
    
}

#Preview ("colocando pontos") {
    SectionView(section: .colocandoPontos)
}

#Preview ("movendo pontos") {
    SectionView(section: .movendoPontos)
}

#Preview ("deletando pontos") {
    SectionView(section: .deletandoPontos)
}
