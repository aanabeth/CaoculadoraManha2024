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
//    @State var selectedSegment = 0
    @State var selectedPorte = Porte.pequeno
    @State var result: Int?  = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.h5)
            Text("Anos")
                .font(.b1)
            TextField(
                "Quantos anos completos tem seu cão?",
                value: $anos,
                format: .number
            )
            
            
            Text("Meses")
                .font(.b1)
            TextField(
                "Quantos meses além disso ele tem?",
                value: $meses,
                format: .number
            )
            
            
            Text("Porte")
                .font(.b1)
            
            
            Picker("Options", selection: $selectedPorte) {
                ForEach(Porte.allCases, id:\.self) { porte in
                    Text(porte.rawValue)
                }
//                Text("Pequeno").tag(0)
//                Text("Médio").tag(1)
//                Text("Grande").tag(2)
            }
            
            Divider()
            
            if let result {
                Text("Seu cão tem, em idade humana...")
                    .font(.b1)
                Text("\(result) anos")
                    .font(.display)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    . shadow(radius: 5)
            }
            
            Button("Cãocular", action: processYears)
                .font(.b1)
            
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .background(.indigo)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        //            .pickerStyle(.wheel)
        .pickerStyle(.palette)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
        
    }
    
    func processYears() {
        print("Cãocular")
        
        guard let anos, let meses else {
            print("campos não preenchidos")
            return
        }
        
        guard meses > 0 || anos > 0 else {
            print("Pelo menos um campo deve ser maior que zero")
            return
        }
        
        result = selectedPorte.calcularIdade(deAnos: anos, eMeses: meses)
    }
}

#Preview {
    ContentView()
}

