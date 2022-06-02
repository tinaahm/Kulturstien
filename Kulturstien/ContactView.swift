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
    @State var sentFeedBAck: Bool = false
    
    var body: some View {
        
        VStack (spacing: 30) {

        BackButtonView()
        
        Image("RælingenKommune")
        
        Text("Kontakt Rælingen Kommune")
            .font(.title2)
            
        Text("Telefon: 63 83 50 00")
        Text("Telefax: 63 83 52 33")
        Text("postmottak@ralingen.kommune.no")
            if self.sentFeedBAck {
                Text("Din tilbakemelding er sendt")
                    .padding()
                    .frame(width: 320)
                    .background(.green)
                    .font(.title3)
                    .cornerRadius(15)
            }
                
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
                self.sentFeedBAck = true
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

