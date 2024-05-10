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
    @State private var selectedSegment = 0
    @State var result: Int?  = nil
    
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
            
            
            Picker("Options", selection: $selectedSegment) {
                Text("Pequeno").tag(0)
                Text("Médio").tag(1)
                Text("Grande").tag(2)
                }
            
            if let result {
                Text("Seu cão tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }

            Button("Cãocular") {
                print("Cãocular")
                result = 23
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .bold()
            
            }
//            .pickerStyle(.wheel)
            .pickerStyle(.palette)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
            
        
        }
    }

#Preview {
    ContentView()
}

