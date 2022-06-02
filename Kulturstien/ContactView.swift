//
//  ContactView.swift
//  Kulturstien
//
//  Created by Christina Engene on 02/06/2022.
//

import SwiftUI

struct ContactView: View {
    
    @EnvironmentObject var page : ViewIndex
    @State private var feedBack: String = ""
    
    var body: some View {
        
        VStack (spacing: 40) {
            
        BackButtonView()
        
        Image("RælingenKommune")
        
        Text("Kontakt Rælingen Kommune")
            .font(.title)
            
        Text("Telefon: 63 83 50 00")
        Text("Telefax: 63 83 52 33")
        Text("postmottak@ralingen.kommune.no")
                
            VStack (spacing: 25){
            HStack {
                TextField("Tilbakemelding...", text: $feedBack)
            }
            .frame(width: 300, height: 200)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1)
            )
            
            Button(action: {
                
            }) {
                Text("Send")
            }
            .foregroundColor(.black)
            .frame(width: 200)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1))
    }
}
}
}
struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView().environmentObject(ViewIndex())
    }
}

