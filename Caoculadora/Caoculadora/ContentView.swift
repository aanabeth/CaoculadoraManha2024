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
    @State var failedInput = false
    
    let tituloPreencherCampos = "Preencha os campos para cãocular!"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Qual a idade do seu cão?")
                        .foregroundStyle(.indigo60)
                        .font(.h5)
                    Text("Anos")
                        .foregroundStyle(.indigo60)
                        .font(.b1)
                    TextField(
                        "Quantos anos completos tem seu cão?",
                        value: $anos,
                        format: .number
                    )
                    Spacer()
                    
                    Text("Meses")
                        .foregroundStyle(.indigo60)
                        .font(.b1)
                    TextField(
                        "Quantos meses além disso ele tem?",
                        value: $meses,
                        format: .number
                    )
                    Spacer()
                    
                    Text("Porte")
                        .foregroundStyle(.indigo60)
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
                    Spacer()
                    if let result {
                        Text("Seu cão tem, em idade humana...")
                            .font(.b1)
                            .foregroundStyle(.indigo60)
                            .frame(maxWidth: .infinity)
                            
                        Text("\(result) anos")
                            .font(.display)
                            .foregroundStyle(.indigo60)
                            .frame(maxWidth: .infinity)
                            .contentTransition(.numericText())
                    } else {
                        Image(ImageResource.clarinha)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            . shadow(radius: 5)
                    }
                    Spacer()
                    Button("Cãocular", action: processYears)
                        .font(.b1)
                    
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.indigo)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .alert(tituloPreencherCampos, isPresented: $failedInput, actions: {
                    Button("OK", role: .cancel, action: {})
                })
                //            .pickerStyle(.wheel)
                .pickerStyle(.palette)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .containerRelativeFrame(.vertical)
                .animation(.easeInOut.speed(0.5), value: result)
            }
            .navigationTitle("Cãoculadora")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.indigo, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .fontDesign(.rounded)
    }
}

extension ContentView {
    
    func processYears() {
        print("Cãocular")
        
        guard let anos, let meses else {
            print("campos não preenchidos")
            failedInput = true
            return
        }
        
        guard meses > 0 || anos > 0 else {
            print("Pelo menos um campo deve ser maior que zero")
            return
        }
        
        withAnimation(.easeInOut.speed(0.5)) {
            result = selectedPorte.calcularIdade(deAnos: anos, eMeses: meses)
        }
    }
}

#Preview {
    ContentView()
}

