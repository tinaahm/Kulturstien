//
//  HistoryView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 02/06/2022.
//

import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject var page: ViewIndex
    
    var body: some View {
        VStack () {
            
        BackButtonView()
            
            Image("RælingenKommune")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
        
        Text("Byåas Historie")
            .font(.system(size: 25))
            
            HStack (alignment: .top) {
                
                VStack () {
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        VStack () {
                        Image("Corn")
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Kvernhus")
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    
                }
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        VStack () {
                        Image("Saw")
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Sagbruk")
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    
                }
                    .padding()
                    
                }
               
                
                VStack () {
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        VStack () {
                        Image("WaterMill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Demning")
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    
                }
                    
                    Button (action: {
                        
                        page.pageIndex = .profile
                    }) {
                        VStack () {
                        Image("LogBoomsIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        Text("Lenseanlegg")
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    
                }
                    .padding()
                }
                
                
            }
            .padding()
            
        
            
          Spacer()
        }
        
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environmentObject(ViewIndex())
    }
}
