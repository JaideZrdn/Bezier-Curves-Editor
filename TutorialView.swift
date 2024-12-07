//
//  TutorialView.swift
//  Bezier
//
//  Created by Jaide Zardin on 05/12/24.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        
        VStack () {
            ScrollView {
                SectionView(section: .colocandoPontos)
                    .padding(.top, 30)
                
                Divider()
                SectionView(section: .movendoPontos)
                    .padding(.top, 30)
                
                Divider()
                SectionView(section: .deletandoPontos)
                    .padding(.top, 30)
                Spacer()
            }
        }
        .padding()
            .navigationTitle("Tutorial")
    }
}

#Preview {
    NavigationStack {
        TutorialView()
    }
}
