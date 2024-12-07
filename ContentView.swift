import SwiftUI

struct ContentView: View {
    
    @StateObject var bezierVM: BezierViewModel = BezierViewModel()
    @State var showControlPolygon: Bool = true
    @State var showCoordinates: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                //Bezier Canvas
                BezierCanvasView(bezierVM: bezierVM, showControlPolygon: $showControlPolygon)
                
                //Pontos na tela
                ForEach(0..<bezierVM.controlPoints.count, id: \.self) { index in
                    ZStack {
                        BezierPointView()
                            .padding(30)
                        Text("\(index)")
                            .font(.caption)
                            .offset(x: 15, y: -15)
                    }
                    .position(bezierVM.controlPoints[index])
                    .gesture (
                        DragGesture()
                            .onChanged { value in
                                bezierVM.controlPoints[index] = value.location
                            }
                    )
                    .onTapGesture(count: 2) {
                        bezierVM.controlPoints.remove(at: index)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Button ("Mostrar polígono de controle") {
                            showControlPolygon.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button ("Deletar todos os pontos") {
                            bezierVM.controlPoints.removeAll()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding()
                
            }
            .navigationTitle("Editor de Curvas de Bézier")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink {
                            TutorialView()
                        } label: {
                            Label("Como usar", systemImage: "questionmark.circle.fill")
                        }
                        
                        Button {
                            showCoordinates = true
                        } label: {
                            Label("Mostrar coordenadas", systemImage: "dot.scope")
                        }
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                }
                
            }
            .sheet(isPresented: $showCoordinates) {
                NavigationStack {
                    CoordinatesView(coordinates: $bezierVM.controlPoints)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Fechar") { showCoordinates = false }
                            }
                        }
                }
            }
        }
        
    }
}


struct Produto {
    
}
