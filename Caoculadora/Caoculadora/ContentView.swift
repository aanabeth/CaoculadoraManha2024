//
//  ContentView.swift
//  Caoculadora
//
//  Created by Ana Elizabeth Bastos de Mendonça on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var anos: Int? = nil
    @State var meses: Int? = nil
    //@State var porte:
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $anos,
                format: .number
            )
            
            Text("Meses")
            TextField(
                "Quantos meses além disso ele tem?",
                value: $meses,
                format: .number
            )
            
            Text("Porte")
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
