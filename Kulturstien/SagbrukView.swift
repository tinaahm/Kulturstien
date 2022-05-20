//
//  SagbrukView.swift
//  Kulturstien
//
//  Created by Sigurd Graff Henrichsen on 19/05/2022.
//

import SwiftUI

struct SagbrukView: View {
    
    @EnvironmentObject var page : ViewIndex
    
    var body: some View {
        ScrollView {
            VStack {
                
                
                ZStack(alignment: .topLeading) {
                            Color.clear
                            VStack(alignment: .leading) {
                                Button (action: {
                                    page.pageIndex = .main
                                }) {
                                    Image("BackArrow")
                                        .resizable()
                                        .frame(width: 15, height: 25)
                                        .padding(.leading, 25)
                                       
                                        
                                    
                                }
                                
                            }
                    
                        }
                .padding(.bottom, -20)
                VStack(alignment: .leading) {
                    
                    
                    Text("Om Sagbruk")
                        .font(.title)
                }
                
                .padding(.bottom, 30)
                
               

                

                
                
                Image("Sawmill1")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    
                    
                    .frame(width: 350, height: 250)
                    .shadow(radius: 7)
                
            
                
                        VStack(alignment: .leading) {
                            
                            HStack {
                                
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(.white)

                                ZStack {
                                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                .fill(.pink)

                                            VStack {
                                                Text("Ifølge bygdehistorien til Rælingen skal det på det meste ha vært 7 sagbruk i drift langs Byåa. I dag er det fortsatt mulig å se spor etter 4 av sagbrukene ved ruiner som står igjen. Sagbruksvirksomheten i Byåa tok trolig slutt om kring 1860 eller noe senere. ")
                                                    .font(.body)
                                                    .foregroundColor(.black)

                                                
                                            }
                                            .padding(20)
                                            .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 350, height: 250)
                                .padding(20)
                                
                                
                            
                            }
                        }
                        .padding()

                        Spacer()
                
                
                
                
                
                
                
                
                
                Image("Sawmill1")
                    .resizable()
                    .clipShape(Circle())
                    .overlay {
                                    Circle().stroke(.white, lineWidth: 4)
                                }
                    .frame(width: 200, height: 200)
                    .shadow(radius: 7)
            
                
                        VStack(alignment: .leading) {
                        

                            HStack {
                                
                                Text("Ifølge bygdehistorien til Rælingen skal det på det meste ha vært 7 sagbruk i drift langs Byåa. I dag er det fortsatt mulig å se spor etter 4 av sagbrukene ved ruiner som står igjen. Sagbruksvirksomheten i Byåa tok trolig slutt om kring 1860 eller noe senere. ")
                                    .font(.body)
                                
                            
                            }
                        }
                        .padding()

                        Spacer()
                
                
                
                Image("Sawmill1")
                    .resizable()
                    .clipShape(Circle())
                    .overlay {
                                    Circle().stroke(.white, lineWidth: 4)
                                }
                    .frame(width: 200, height: 200)
                    .shadow(radius: 7)
            
                
                        VStack(alignment: .leading) {
                        

                            HStack {
                                Text("Ifølge bygdehistorien til Rælingen skal det på det meste ha vært 7 sagbruk i drift langs Byåa. I dag er det fortsatt mulig å se spor etter 4 av sagbrukene ved ruiner som står igjen. Sagbruksvirksomheten i Byåa tok trolig slutt om kring 1860 eller noe senere. ")
                                    .font(.body)
                                
                            
                            }
                        }
                        .padding()
                
            
                            
                        
                       
                
                

                        
                
                
                
                
                    }
        }
        
    }
}

struct SagbrukView_Previews: PreviewProvider {
    static var previews: some View {
        SagbrukView().environmentObject(ViewIndex())
    }
}



