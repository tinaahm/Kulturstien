//
//  HistoryView.swift
//  Kulturstien
//
//  Created by Christina Engene on 02/06/2022.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject var page : ViewIndex
    
    var body: some View {
        
        VStack (spacing: 20){
            
            BackButtonView()
            
            Spacer()
            
            Button(action: {
                
            }) {
                Text("Kontakt oss")
            }
            .foregroundColor(.black)
            .frame(width: 200)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1))
            
            
            Button(action: {
                
            }) {
                Text("Byåas historie")
            }
            .foregroundColor(.black)
            .frame(width: 200)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 1))
            
            Spacer()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environmentObject(ViewIndex())
    }
}
    

