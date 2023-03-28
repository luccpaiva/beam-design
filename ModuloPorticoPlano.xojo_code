#tag Module
Protected Module ModuloPorticoPlano
	#tag Method, Flags = &h0
		Sub CarregarMateriais()
		  //Carregar as propriedades do Concreto e Aço
		  Redim PropMat(-1)
		  Dim ConcretoAco As New PropMateriais
		  ConcretoAco.GamaG=1.4
		  ConcretoAco.GamaS=1.15
		  ConcretoAco.Fck=CDbl(Right(MW.PopupPropMat(0).Text,2))/10
		  ConcretoAco.Fctkm=0.3*(ConcretoAco.Fck*10)^(2/3)/10
		  ConcretoAco.Fctksup=1.3*ConcretoAco.Fctkm
		  ConcretoAco.Fctkinf=0.7*ConcretoAco.Fctkm
		  ConcretoAco.Fcd=ConcretoAco.Fck/ConcretoAco.GamaG
		  ConcretoAco.AlfaI=Min(0.8+2*ConcretoAco.Fck/80,1)
		  Select Case MW.PopupPropMat(2).Text
		  Case "Basalto", "Diabásio"
		    ConcretoAco.AlfaE=1.2
		  Case "Granito", "Gnaisse"
		    ConcretoAco.AlfaE=1.0
		  Case "Calcário"
		    ConcretoAco.AlfaE=0.9
		  Case "Arenito"
		    ConcretoAco.AlfaE=0.7
		  End Select
		  ConcretoAco.Eci=ConcretoAco.AlfaE*5600*Sqrt(10*ConcretoAco.Fck)/10
		  ConcretoAco.Ecs=ConcretoAco.AlfaI*ConcretoAco.Eci
		  ConcretoAco.Fywk=50
		  ConcretoAco.Fywd=43.5
		  ConcretoAco.Fyk=CDbl(Right(MW.PopupPropMat(2).Text,2))
		  ConcretoAco.Fyd=ConcretoAco.Fyk/ConcretoAco.GamaS
		  PropMat.Append(ConcretoAco)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CarregarModelo1()
		  //Modelo 1 considera o trecho rígido dos apoios intermediários
		  Nnos=Val(MW.TF_Nnos.Text)
		  Redim Vet_EL(-1) 
		  Dim LastKx As Double //Salvar o fim de uma viga como o início da próxima
		  Dim LastK As Integer = 1 //Salvar a numeração do último elemento
		  Dim Jmod, Kmod As Double //Coordenadas da face interna da viga, reposicionamento de cargas
		  Dim TrechoRigido(-1) As Integer //Salvar o nó que contém trecho rígido
		  For i As Integer = 0 To Nnos-2
		    //=======================================================================
		    Dim EL As New PorticoPlano
		    //Numeração dos Nós
		    EL.J=LastK
		    EL.K=EL.J+1
		    LastK=EL.K
		    //Calcular o comprimento efetivo da viga
		    EL.L=VaoEf(MW.LB_Trechos.Cell(i,1), MW.TF_Hviga.Text, MW.LB_Nos.Cell(i,2), MW.LB_Nos.Cell(i+1,2))
		    EL.L=EL.L
		    //Coordenadas dos Nós
		    EL.Jx=LastKx
		    EL.Kx=EL.Jx+EL.L
		    LastKx=EL.Kx
		    EL.Jy=0
		    EL.Ky=0
		    //Ângulo com a horizontal é nulo
		    EL.B=0
		    EL.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		    EL.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		    //Elasticidade Secante
		    EL.E=PropMat(0).Ecs
		    //Propriedades da Seção
		    EL.A=CDbl(MW.TF_BViga.Text)*CDbl(MW.TF_Hviga.Text)
		    EL.I=CDbl(MW.TF_BViga.Text)*CDbl(MW.TF_Hviga.Text)^3/12
		    //Peso específico do concreto 25kN/m³
		    EL.Y=25
		    //Zera vetores de Cargas
		    Redim EL.FEP_C(-1,-1)
		    Redim EL.FEP_D(-1,-1)
		    Redim EL.FEP_C(-1,2)
		    Redim EL.FEP_D(-1,3)
		    //Coordenadas da face interna das vigas
		    Jmod=Kmod+CDbl(MW.LB_Nos.Cell(i,2))
		    Kmod=Jmod+CDbl(MW.LB_Trechos.Cell(i,1))
		    Dim a1 As Double = Min(0.3*CDbl(MW.TF_Hviga.Text), 0.5*CDbl(MW.LB_Nos.Cell(i,2)))
		    //Carregamento Concentrado
		    Dim k As Integer = 0
		    Dim xcarga As Double = 0
		    For j As Integer = 0 To MW.LB_CargaConc.LastIndex
		      xcarga = CDbl(MW.LB_CargaConc.Cell(j,0)) 
		      If xcarga>=Jmod And xcarga<=Kmod Then
		        Redim EL.FEP_C(Ubound(EL.FEP_C,1)+1,2)
		        EL.FEP_C(k,0)=CDbl(MW.LB_CargaConc.Cell(j,1))
		        EL.FEP_C(k,1)=kPi/2
		        EL.FEP_C(k,2)=xcarga-Jmod+a1
		        k=k+1
		      End
		    Next
		    //Carregamento Distribuido
		    k=0
		    Dim xicarga,xfcarga As Double
		    For j As Integer = 0 To MW.LB_CargaDist.LastIndex
		      xicarga=CDbl(MW.LB_CargaDist.Cell(j,0))
		      xfcarga=xicarga+CDbl(MW.LB_CargaDist.Cell(j,1))
		      If xicarga>=Jmod And xicarga<=Kmod Then
		        Redim EL.FEP_D(Ubound(EL.FEP_D,1)+1,3)
		        EL.FEP_D(k,0)=CDbl(MW.LB_CargaDist.Cell(j,2))
		        EL.FEP_D(k,1)=kPi/2
		        EL.FEP_D(k,2)=xicarga-Jmod+a1
		        EL.FEP_D(k,3)=EL.FEP_D(k,2)+Min(xfcarga-xicarga,EL.L-EL.FEP_D(k,2))
		        k=k+1
		      Elseif xicarga<Jmod And xfcarga>Jmod Then
		        Redim EL.FEP_D(Ubound(EL.FEP_D,1)+1,3)
		        EL.FEP_D(k,0)=CDbl(MW.LB_CargaDist.Cell(j,2))
		        EL.FEP_D(k,1)=kPi/2
		        EL.FEP_D(k,2)=0
		        EL.FEP_D(k,3)=Min((xfcarga-Jmod+a1),EL.L)
		        k=k+1
		      End
		    Next
		    
		    //Incluir peso próprio como uma FEP distribuida em todo comprimento
		    If MW.CB_PesoProprio.Value Then
		      Redim EL.FEP_D(Ubound(EL.FEP_D,1)+1,3)
		      EL.FEP_D(k,0)=EL.Y*EL.A/1000 // 25kN/m => 0.0025 kN/m*cm²
		      EL.FEP_D(k,1)=kPi/2
		      EL.FEP_D(k,2)=0
		      EL.FEP_D(k,3)=EL.L
		      k=k+1
		    End
		    //Salva o elemento EL no vetor de Elementos
		    Vet_EL.Append(EL)
		    
		    //Caso o apoio imediatamente à direita deste elemento seja um pilar, incluir trecho rígido
		    If MW.LB_Nos.Cell(i+1,1)="Pilar" And i<Nnos-2 Then
		      Dim ELrig1 As New PorticoPlano
		      Dim Lrig As Double = CDbl(MW.LB_Nos.Cell(i+1,2))-0.6*CDbl(MW.TF_Hviga.Text)
		      //Numeração dos Nós
		      ELrig1.J=LastK
		      ELrig1.K=ELrig1.J+1
		      LastK=ELrig1.K
		      //Coordenadas dos nós
		      ELrig1.Jx=LastKx
		      ELrig1.Kx=ELrig1.Jx+0.5*Lrig
		      lastKx=ELrig1.Kx
		      ELrig1.Jy=0
		      ELrig1.Ky=0
		      //Comprimento do elemento
		      ELrig1.L=ELrig1.Kx-ELrig1.Jx
		      //Ângulo com a horizontal é nulo
		      ELrig1.B=0
		      ELrig1.CosX=1
		      ELrig1.CosY=0
		      //Elasticidade Secante
		      ELrig1.E=PropMat(0).Ecs
		      //Propriedades da Seção (método da penalidade)
		      ELrig1.A=10*1000
		      ELrig1.I=10*1000^3/12
		      //Salvar o primeiro trecho rígido no vetor de elementos
		      Vet_EL.Append(ELrig1)
		      Dim ELrig2 As New PorticoPlano
		      //Numeração dos Nós
		      ELrig2.J=LastK
		      ELrig2.K=ELrig2.J+1
		      LastK=ELrig2.K
		      //Coordenadas dos nós
		      ELrig2.Jx=LastKx
		      ELrig2.Kx=ELrig2.Jx+0.5*Lrig
		      lastKx=ELrig2.Kx
		      ELrig2.Jy=0
		      ELrig2.Ky=0
		      //Comprimento do elemento
		      ELrig2.L=ELrig2.Kx-ELrig2.Jx
		      //Ângulo com a horizontal é nulo
		      ELrig2.B=0
		      ELrig2.CosX=1
		      ELrig2.CosY=0
		      //Elasticidade Secante
		      ELrig2.E=PropMat(0).Ecs
		      //Propriedades da Seção (método da penalidade)
		      ELrig2.A=10*1000
		      ELrig2.I=10*1000^3/12
		      //Salvar o segundo trecho rígido no vetor de elementos
		      Vet_EL.Append(ELrig2)
		      //Guardar o nó que contém pilar para montar o vetor de restrições nodais
		      TrechoRigido.Append(i+2)
		    End
		    
		  Next
		  
		  //Montar o vetor de restrições nodais do Modelo1
		  Redim MtxANo_Rest(-1)
		  For i As Integer = 0 To Nnos-1
		    MtxANo_Rest.IncluirApoio(1,1,0)
		  Next
		  
		  //Incluir restrições nodais dos trechos rígidos
		  For i As Integer = 0 To UBound(TrechoRigido)
		    //Apoio Livre antes do elemento rígido
		    MtxANo_Rest.Insert(TrechoRigido(i)+1,0)
		    MtxANo_Rest.Insert(TrechoRigido(i)+2,0)
		    MtxANo_Rest.Insert(TrechoRigido(i)+3,0)
		    //Apoio Livre depois do elemento rígido
		    MtxANo_Rest.Insert(TrechoRigido(i)+7,0)
		    MtxANo_Rest.Insert(TrechoRigido(i)+8,0)
		    MtxANo_Rest.Insert(TrechoRigido(i)+9,0)
		  Next
		  
		  //Recalcular o número de nós dos trechos rígidos adicionados
		  Nnos=Nnos+2*(UBound(TrechoRigido)+1)
		  
		  Redim MtxANo_ES_NR(-1)
		  Redim MtxANo_ES_NR(Nnos*kGL-1)
		  
		  Redim MtxD_ES_NR(-1)
		  Redim MtxD_ES_NR(Nnos*kGL-1)
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CarregarModelo2()
		  //Modelo 2 considera o engastamento perfeito de apois intermediários
		  Nnos=Val(MW.TF_Nnos.Text)
		  Redim Vet_EL(-1) 
		  Dim LastKx As Double //Salvar o fim de uma viga como o início da próxima
		  Dim Jmod, Kmod As Double //Coordenadas da face interna da viga, reposicionamento de cargas
		  For i As Integer = 0 To Nnos-2
		    Dim EL As New PorticoPlano
		    //Numeração dos Nós
		    EL.J=i+1
		    EL.K=i+2
		    //Calcular o comprimento efetivo da viga
		    EL.L=VaoEf(MW.LB_Trechos.Cell(i,1), MW.TF_Hviga.Text, MW.LB_Nos.Cell(i,2), MW.LB_Nos.Cell(i+1,2))
		    EL.L=EL.L
		    //Coordenadas dos Nós
		    EL.Jx=LastKx
		    EL.Kx=EL.Jx+EL.L
		    LastKx=EL.Kx
		    EL.Jy=0
		    EL.Ky=0
		    //Ângulo com a horizontal é nulo
		    EL.B=0
		    EL.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		    EL.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		    //Elasticidade Secante
		    EL.E=PropMat(0).Ecs
		    //Propriedades da Seção
		    EL.A=CDbl(MW.TF_BViga.Text)*CDbl(MW.TF_Hviga.Text)
		    EL.I=CDbl(MW.TF_BViga.Text)*CDbl(MW.TF_Hviga.Text)^3/12
		    //Peso específico do concreto 25kN/m³
		    EL.Y=25
		    //Zera vetores de Cargas
		    Redim EL.FEP_C(-1,-1)
		    Redim EL.FEP_D(-1,-1)
		    Redim EL.FEP_C(-1,2)
		    Redim EL.FEP_D(-1,3)
		    //Coordenadas da face interna das vigas
		    Jmod=Kmod+CDbl(MW.LB_Nos.Cell(i,2))
		    Kmod=Jmod+CDbl(MW.LB_Trechos.Cell(i,1))
		    Dim a1 As Double = Min(0.3*CDbl(MW.TF_Hviga.Text), 0.5*CDbl(MW.LB_Nos.Cell(i,2)))
		    //Carregamento Concentrado
		    Dim k As Integer = 0
		    Dim xcarga As Double = 0
		    For j As Integer = 0 To MW.LB_CargaConc.LastIndex
		      xcarga = CDbl(MW.LB_CargaConc.Cell(j,0)) 
		      If xcarga>=Jmod And xcarga<=Kmod Then
		        Redim EL.FEP_C(Ubound(EL.FEP_C,1)+1,2)
		        EL.FEP_C(k,0)=CDbl(MW.LB_CargaConc.Cell(j,1))
		        EL.FEP_C(k,1)=kPi/2
		        EL.FEP_C(k,2)=xcarga-Jmod+a1
		        k=k+1
		      End
		    Next
		    //Carregamento Distribuido
		    k=0
		    Dim xicarga,xfcarga As Double
		    For j As Integer = 0 To MW.LB_CargaDist.LastIndex
		      xicarga=CDbl(MW.LB_CargaDist.Cell(j,0))
		      xfcarga=xicarga+CDbl(MW.LB_CargaDist.Cell(j,1))
		      If xicarga>=Jmod And xicarga<=Kmod Then
		        Redim EL.FEP_D(Ubound(EL.FEP_D,1)+1,3)
		        EL.FEP_D(k,0)=CDbl(MW.LB_CargaDist.Cell(j,2))
		        EL.FEP_D(k,1)=kPi/2
		        EL.FEP_D(k,2)=xicarga-Jmod+a1
		        EL.FEP_D(k,3)=EL.FEP_D(k,2)+Min(xfcarga-xicarga,EL.L-EL.FEP_D(k,2))
		        k=k+1
		      Elseif xicarga<Jmod And xfcarga>Jmod Then
		        Redim EL.FEP_D(Ubound(EL.FEP_D,1)+1,3)
		        EL.FEP_D(k,0)=CDbl(MW.LB_CargaDist.Cell(j,2))
		        EL.FEP_D(k,1)=kPi/2
		        EL.FEP_D(k,2)=0
		        EL.FEP_D(k,3)=Min((xfcarga-Jmod+a1),EL.L)
		        k=k+1
		      End
		    Next
		    //Incluir peso próprio como uma FEP distribuida em todo comprimento
		    If MW.CB_PesoProprio.Value Then
		      Redim EL.FEP_D(Ubound(EL.FEP_D,1)+1,3)
		      EL.FEP_D(k,0)=EL.Y*EL.A/1000 // 25kN/m => 0.0025 kN/m*cm²
		      EL.FEP_D(k,1)=kPi/2
		      EL.FEP_D(k,2)=0
		      EL.FEP_D(k,3)=EL.L
		      k=k+1
		    End
		    //Salva o elemento EL no vetor de Elementos
		    Vet_EL.Append(EL)
		    
		  Next
		  
		  //Montar o vetor de restrições nodais do Modelo2
		  //Apoio de segunda ordem nas extremidades e engaste em apoios intermediários
		  Redim MtxANo_Rest(-1)
		  MtxANo_Rest.IncluirApoio(1,1,0)
		  For i As Integer = 1 To Nnos-2
		    MtxANo_Rest.IncluirApoio(1,1,1)
		  Next
		  MtxANo_Rest.IncluirApoio(1,1,0)
		  
		  Redim MtxANo_ES_NR(-1)
		  Redim MtxANo_ES_NR(Nnos*kGL-1)
		  
		  Redim MtxD_ES_NR(-1)
		  Redim MtxD_ES_NR(Nnos*kGL-1)
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Deslocamentos(V() As PorticoPlano)
		  //Deslocamentos da Estrutura
		  Reordenacao(V)
		  
		  Redim MtxD_ES_L(-1)
		  Redim MtxD_ES_L(NDL-1)
		  
		  MtxD_ES_L=Gauss(MtxS_ES_LL,VV_Rest(VV_Rest(MtxANo_ES_L,MtxFEP_ES_L),MV_Mult(MtxS_ES_LR,MtxD_ES_R)))
		  
		  Redim MtxD_ES(-1)
		  Redim MtxD_ES(Nnos*kGL-1)
		  
		  For i As Integer = 0 To NDL-1
		    For j As Integer = 0 To Nnos*kGL-1
		      If MtxRd(j,3)-1=i Then
		        MtxD_ES(j)=MtxD_ES_L(i)
		      End
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Diagramas()
		  //Pontos do diagrama de deslocamentos
		  DiscModelo2v2
		  Redim MtxModelo1(-1,-1)
		  Redim MtxModelo1(Nnos-1,4)
		  For i As Integer = 0 To Nnos-2
		    MtxModelo1(i,0)=Vet_ELd(i).Jx
		    Reacoes(Vet_ELd(i))
		    MtxModelo1(i,1)=MtxANo_EL_R(1)
		    MtxModelo1(i,2)=MtxANo_EL_R(2)
		    MtxModelo1(i,3)=MtxD_ES(3*i+1)
		    MtxModelo1(i,4)=MtxD_ES(3*i+2)
		  Next
		  MtxModelo1(Nnos-1,0)=Vet_ELd(Nnos-2).Kx
		  Reacoes(Vet_ELd(Nnos-2))
		  MtxModelo1(Nnos-1,1)=MtxANo_EL_R(4)
		  MtxModelo1(Nnos-1,2)=MtxANo_EL_R(5)
		  MtxModelo1(Nnos-1,3)=MtxD_ES(3*(Nnos-1)+1)
		  MtxModelo1(Nnos-1,4)=MtxD_ES(3*(Nnos-1)+2)
		  
		  
		  For i As Integer = 0 To Nnos-1
		    MW.Listbox1.AddRow
		    For j As Integer = 0 To 4
		      MW.Listbox1.Cell(i,j)=Str(MtxModelo1(i,j))
		    Next
		  Next
		  
		  MW.Listbox1.textout
		  
		  Dim f As Double
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DiscModelo1()
		  //Discretizar Modelo 1
		  CarregarModelo1
		  Ndisc=10
		  Redim Vet_ELd(-1)
		  Dim Ld As Double //Comprimento discretizado
		  Dim LastKx As Double //Salvar o fim de uma viga como o início da próxima
		  Dim LastK As Integer = 1 //Salvar o último nó
		  For Each EL As PorticoPlano In Vet_EL
		    Ld=EL.L/Ndisc
		    For i As Integer = 0 To Ndisc-1
		      Dim ELd As New PorticoPlano
		      //Numeração dos Nós
		      ELd.J=LastK
		      ELd.K=ELd.J+1
		      LastK=ELd.K
		      //Comprimento do elemento
		      ELd.L=Ld
		      //Coordenadas dos nós
		      ELd.Jx=LastKx
		      ELd.Kx=ELd.Jx+ELd.L
		      LastKx=ELd.Kx
		      ELd.Jy=0
		      ELd.Ky=0
		      //Ângulo com a horizontal é nulo
		      ELd.B=0
		      ELd.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		      ELd.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		      //Elasticidade Secante
		      ELd.E=EL.E
		      //Propriedades da Seção
		      ELd.A=EL.A
		      ELd.I=EL.I
		      //Peso específico do concreto 25kN/m³
		      ELd.Y=25
		      //Zera vetores de Cargas
		      Redim ELd.FEP_C(-1,-1)
		      Redim ELd.FEP_D(-1,-1)
		      Redim ELd.FEP_C(-1,2)
		      Redim ELd.FEP_D(-1,3)
		      //Carregamento Concentrado
		      Dim k As Integer = 0
		      For j As Integer = 0 To Ubound(EL.FEP_C,1)
		        If EL.Jx+EL.FEP_C(j,2)>=ELd.Jx And EL.Jx+EL.FEP_C(j,2)<ELd.Kx  Then
		          Redim ELd.FEP_C(Ubound(ELd.FEP_C,1)+1,2)
		          ELd.FEP_C(k,0)=EL.FEP_C(j,0)
		          ELd.FEP_C(k,1)=kPi/2
		          ELd.FEP_C(k,2)=EL.FEP_C(j,2)-ELd.Jx
		          k=k+1
		        End
		      Next
		      //Carregamento Distribuido
		      k=0
		      For j As Integer = 0 To Ubound(EL.FEP_D,1)
		        If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>ELd.Jx Then
		          Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)+1,3)
		          ELd.FEP_D(k,0)=EL.FEP_D(j,0)
		          ELd.FEP_D(k,1)=kPi/2
		          ELd.FEP_D(k,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd.Jx,0)
		          ELd.FEP_D(k,3)=Min( EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd.Jx,ELd.L)
		          k=k+1
		        End
		      Next
		      //Salvar no vetor de elementos
		      Vet_ELd.Append(ELd)
		    Next
		  Next
		  
		  //Incluir os nós dos elementos discretizados
		  For i As Integer = 0 To Nnos-2
		    For j As Integer = 0 To kGL*(Ndisc-1)-1
		      If i=0 Then
		        MtxANo_Rest.insert(3+j,0)
		      Else
		        MtxANo_Rest.insert(kGL*Ndisc*i+3+j,0)
		      End
		    Next
		  Next
		  
		  Nnos=(Ubound(MtxANo_Rest)+1)/3
		  
		  Redim Vet_EL(-1)
		  For Each EL As PorticoPlano In Vet_ELd
		    Vet_EL.Append(EL)
		  Next
		  
		  Redim MtxANo_ES_NR(-1)
		  Redim MtxANo_ES_NR(Nnos*kGL-1)
		  
		  Redim MtxD_ES_NR(-1)
		  Redim MtxD_ES_NR(Nnos*kGL-1)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DiscModelo1v2()
		  //Discretizar Modelo 1
		  CarregarModelo1
		  Ndisc=10
		  Redim Vet_ELd(-1)
		  Dim Ld As Double //Comprimento discretizado
		  Dim LastKx As Double = 0 //Salvar o fim de uma viga como o início da próxima
		  Dim LastK As Integer = 1 //Salvar o último nó
		  Dim temp, temp1(-1), temp2(-1),temp3(-1) As Double
		  Dim temp4 As Boolean = True
		  For Each EL As PorticoPlano In Vet_EL
		    Ld=EL.L/Ndisc
		    For i As Integer = 0 To Ndisc-1
		      Dim ELd As New PorticoPlano
		      //Numeração dos Nós
		      ELd.J=LastK
		      ELd.K=ELd.J+1
		      LastK=ELd.K
		      //Comprimento do elemento
		      ELd.L=Ld
		      //Coordenadas dos nós
		      ELd.Jx=LastKx
		      ELd.Kx=ELd.Jx+ELd.L
		      LastKx=ELd.Kx
		      ELd.Jy=0
		      ELd.Ky=0
		      //Ângulo com a horizontal é nulo
		      ELd.B=0
		      ELd.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		      ELd.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		      //Elasticidade Secante
		      ELd.E=EL.E
		      //Propriedades da Seção
		      ELd.A=EL.A
		      ELd.I=EL.I
		      //Peso específico do concreto 25kN/m³
		      ELd.Y=25
		      //Zera vetores de Cargas
		      Redim ELd.FEP_C(-1,-1)
		      Redim ELd.FEP_D(-1,-1)
		      Redim ELd.FEP_C(-1,2)
		      Redim ELd.FEP_D(-1,3)
		      //Carregamento Distribuido
		      Dim k As Integer = 0
		      For j As Integer = 0 To Ubound(EL.FEP_D,1)
		        If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>EL.Jx Then
		          Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)+1,3)
		          ELd.FEP_D(k,0)=EL.FEP_D(j,0)
		          ELd.FEP_D(k,1)=kPi/2
		          ELd.FEP_D(k,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd.Jx,0)
		          ELd.FEP_D(k,3)=Min( EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd.Jx,ELd.L)
		          k=k+1
		        End
		      Next
		      //Carregamento Concentrado como carga nodal
		      For j As Integer = 0 To Ubound(EL.FEP_C,1)
		        If EL.Jx+EL.FEP_C(j,2)=ELd.Jx  Then
		          temp1.Append(ELd.j)
		          temp2.Append(EL.FEP_C(j,0))
		          temp3.Append(0)
		        Elseif EL.Jx+EL.FEP_C(j,2)>ELd.Jx And EL.Jx+EL.FEP_C(j,2)<ELd.Kx Then
		          //Comprimento do elemento
		          ELd.L=EL.Jx+EL.FEP_C(j,2)-ELd.Jx
		          temp=ELd.L
		          //Coordenadas dos nós
		          ELd.Kx=ELd.Jx+ELd.L
		          LastKx=ELd.Kx
		          //Carregamento Distribuido
		          Dim w As Integer = 0
		          For p As Integer = 0 To Ubound(EL.FEP_D,1)
		            If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>ELd.Jx Then
		              Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)-1,3)
		              Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)+1,3)
		              ELd.FEP_D(w,0)=EL.FEP_D(j,0)
		              ELd.FEP_D(w,1)=kPi/2
		              ELd.FEP_D(w,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd.Jx,0)
		              ELd.FEP_D(w,3)=Min(EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd.Jx,ELd.L)
		              w=w+1
		            End
		          Next
		          Vet_ELd.Append(ELd)
		          
		          Dim ELd2 As New PorticoPlano
		          //Numeração dos Nós
		          ELd2.J=LastK
		          ELd2.K=ELd2.J+1
		          LastK=ELd2.K
		          //Comprimento do elemento
		          ELd2.L=Ld-temp
		          //Coordenadas dos nós
		          ELd2.Jx=LastKx
		          ELd2.Kx=ELd2.Jx+ELd2.L
		          LastKx=ELd2.Kx
		          ELd2.Jy=0
		          ELd2.Ky=0
		          //Ângulo com a horizontal é nulo
		          ELd2.B=0
		          ELd2.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		          ELd2.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		          //Elasticidade Secante
		          ELd2.E=EL.E
		          //Propriedades da Seção
		          ELd2.A=EL.A
		          ELd2.I=EL.I
		          //Carregamento Distribuido
		          w=0
		          For p As Integer = 0 To Ubound(EL.FEP_D,1)
		            If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>ELd2.Jx Then
		              Redim ELd2.FEP_D(Ubound(ELd2.FEP_D,1)+1,3)
		              ELd2.FEP_D(w,0)=EL.FEP_D(j,0)
		              ELd2.FEP_D(w,1)=kPi/2
		              ELd2.FEP_D(w,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd2.Jx,0)
		              ELd2.FEP_D(w,3)=Min( EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd2.Jx,ELd2.L)
		              w=w+1
		            End
		          Next
		          temp1.Append(ELd2.J)
		          temp2.Append(EL.FEP_C(j,0))
		          temp3.Append(1)
		          Vet_ELd.Append(ELd2)
		          temp4=False
		        End
		      Next
		      If temp4 Then Vet_ELd.Append(ELd)
		      temp4=True
		    Next
		  Next
		  
		  //Incluir os nós dos elementos discretizados
		  For i As Integer = 0 To Nnos-2
		    For j As Integer = 0 To kGL*(Ndisc-1)-1
		      If i=0 Then
		        MtxANo_Rest.insert(3+j,0)
		      Else
		        MtxANo_Rest.insert(kGL*Ndisc*i+3+j,0)
		      End
		    Next
		  Next
		  
		  For i As Integer = 0 To ubound(temp1)
		    If temp3(i)=1 Then
		      MtxANo_Rest.insert(temp1(i)+1,0)
		      MtxANo_Rest.insert(temp1(i)+2,0)
		      MtxANo_Rest.insert(temp1(i)+3,0)
		    End
		  Next
		  
		  Nnos=(Ubound(MtxANo_Rest)+1)/3
		  
		  Redim Vet_EL(-1)
		  For Each EL As PorticoPlano In Vet_ELd
		    Vet_EL.Append(EL)
		  Next
		  
		  Redim MtxANo_ES_NR(-1)
		  Redim MtxANo_ES_NR(Nnos*kGL-1)
		  
		  For i As Integer = 0 To ubound(temp1)
		    MtxANo_ES_NR(3*temp1(i)-2)=-temp2(i)
		  Next
		  
		  Redim MtxD_ES_NR(-1)
		  Redim MtxD_ES_NR(Nnos*kGL-1)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DiscModelo2()
		  //Discretizar Modelo2
		  CarregarModelo2
		  Ndisc=10
		  Redim Vet_ELd(-1)
		  Dim Ld As Double //Comprimento discretizado
		  Dim LastKx As Double //Salvar o fim de uma viga como o início da próxima
		  Dim LastK As Integer = 1 //Salvar o último nó
		  For Each EL As PorticoPlano In Vet_EL
		    Ld=EL.L/Ndisc
		    For i As Integer = 0 To Ndisc-1
		      Dim ELd As New PorticoPlano
		      //Numeração dos Nós
		      ELd.J=LastK
		      ELd.K=ELd.J+1
		      LastK=ELd.K
		      //Comprimento do elemento
		      ELd.L=Ld
		      //Coordenadas dos nós
		      ELd.Jx=LastKx
		      ELd.Kx=ELd.Jx+ELd.L
		      LastKx=ELd.Kx
		      ELd.Jy=0
		      ELd.Ky=0
		      //Ângulo com a horizontal é nulo
		      ELd.B=0
		      ELd.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		      ELd.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		      //Elasticidade Secante
		      ELd.E=EL.E
		      //Propriedades da Seção
		      ELd.A=EL.A
		      ELd.I=EL.I
		      //Peso específico do concreto 25kN/m³
		      ELd.Y=25
		      //Zera vetores de Cargas
		      Redim ELd.FEP_C(-1,-1)
		      Redim ELd.FEP_D(-1,-1)
		      Redim ELd.FEP_C(-1,2)
		      Redim ELd.FEP_D(-1,3)
		      //Carregamento Concentrado
		      Dim k As Integer = 0
		      For j As Integer = 0 To Ubound(EL.FEP_C,1)
		        If EL.Jx+EL.FEP_C(j,2)>=ELd.Jx And EL.Jx+EL.FEP_C(j,2)<ELd.Kx  Then
		          Redim ELd.FEP_C(Ubound(ELd.FEP_C,1)+1,2)
		          ELd.FEP_C(k,0)=EL.FEP_C(j,0)
		          ELd.FEP_C(k,1)=kPi/2
		          ELd.FEP_C(k,2)=EL.FEP_C(j,2)-ELd.Jx
		          k=k+1
		        End
		      Next
		      //Carregamento Distribuido
		      k=0
		      For j As Integer = 0 To Ubound(EL.FEP_D,1)
		        If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>ELd.Jx Then
		          Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)+1,3)
		          ELd.FEP_D(k,0)=EL.FEP_D(j,0)
		          ELd.FEP_D(k,1)=kPi/2
		          ELd.FEP_D(k,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd.Jx,0)
		          ELd.FEP_D(k,3)=Min( EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd.Jx,ELd.L)
		          k=k+1
		        End
		      Next
		      //Salvar no vetor de elementos
		      Vet_ELd.Append(ELd)
		    Next
		  Next
		  
		  //Incluir os nós dos elementos discretizados
		  For i As Integer = 0 To Nnos-2
		    For j As Integer = 0 To kGL*(Ndisc-1)-1
		      If i=0 Then
		        MtxANo_Rest.insert(3+j,0)
		      Else
		        MtxANo_Rest.insert(kGL*Ndisc*i+3+j,0)
		      End
		    Next
		  Next
		  
		  Nnos=(Ubound(MtxANo_Rest)+1)/3
		  
		  Redim Vet_EL(-1)
		  For Each EL As PorticoPlano In Vet_ELd
		    Vet_EL.Append(EL)
		  Next
		  
		  Redim MtxANo_ES_NR(-1)
		  Redim MtxANo_ES_NR(Nnos*kGL-1)
		  
		  Redim MtxD_ES_NR(-1)
		  Redim MtxD_ES_NR(Nnos*kGL-1)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DiscModelo2v2()
		  //Discretizar Modelo 1
		  CarregarModelo2
		  Ndisc=20
		  Redim Vet_ELd(-1)
		  Dim Ld As Double //Comprimento discretizado
		  Dim LastKx As Double = 0 //Salvar o fim de uma viga como o início da próxima
		  Dim LastK As Integer = 1 //Salvar o último nó
		  Dim temp, temp1(-1), temp2(-1),temp3(-1) As Double
		  Dim temp4 As Boolean = True
		  For Each EL As PorticoPlano In Vet_EL
		    Ld=EL.L/Ndisc
		    For i As Integer = 0 To Ndisc-1
		      Dim ELd As New PorticoPlano
		      //Numeração dos Nós
		      ELd.J=LastK
		      ELd.K=ELd.J+1
		      LastK=ELd.K
		      //Comprimento do elemento
		      ELd.L=Ld
		      //Coordenadas dos nós
		      ELd.Jx=LastKx
		      ELd.Kx=ELd.Jx+ELd.L
		      LastKx=ELd.Kx
		      ELd.Jy=0
		      ELd.Ky=0
		      //Ângulo com a horizontal é nulo
		      ELd.B=0
		      ELd.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		      ELd.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		      //Elasticidade Secante
		      ELd.E=EL.E
		      //Propriedades da Seção
		      ELd.A=EL.A
		      ELd.I=EL.I
		      //Peso específico do concreto 25kN/m³
		      ELd.Y=25
		      //Zera vetores de Cargas
		      Redim ELd.FEP_C(-1,-1)
		      Redim ELd.FEP_D(-1,-1)
		      Redim ELd.FEP_C(-1,2)
		      Redim ELd.FEP_D(-1,3)
		      //Carregamento Distribuido
		      Dim k As Integer = 0
		      For j As Integer = 0 To Ubound(EL.FEP_D,1)
		        If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>EL.Jx Then
		          Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)+1,3)
		          ELd.FEP_D(k,0)=EL.FEP_D(j,0)
		          ELd.FEP_D(k,1)=kPi/2
		          ELd.FEP_D(k,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd.Jx,0)
		          ELd.FEP_D(k,3)=Min( EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd.Jx,ELd.L)
		          k=k+1
		        End
		      Next
		      //Carregamento Concentrado como carga nodal
		      For j As Integer = 0 To Ubound(EL.FEP_C,1)
		        If EL.Jx+EL.FEP_C(j,2)=ELd.Jx  Then
		          temp1.Append(ELd.j)
		          temp2.Append(EL.FEP_C(j,0))
		          temp3.Append(0)
		        Elseif EL.Jx+EL.FEP_C(j,2)>ELd.Jx And EL.Jx+EL.FEP_C(j,2)<ELd.Kx Then
		          //Comprimento do elemento
		          ELd.L=EL.Jx+EL.FEP_C(j,2)-ELd.Jx
		          temp=ELd.L
		          //Coordenadas dos nós
		          ELd.Kx=ELd.Jx+ELd.L
		          LastKx=ELd.Kx
		          //Carregamento Distribuido
		          Dim w As Integer = 0
		          For p As Integer = 0 To Ubound(EL.FEP_D,1)
		            If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>ELd.Jx Then
		              Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)-1,3)
		              Redim ELd.FEP_D(Ubound(ELd.FEP_D,1)+1,3)
		              ELd.FEP_D(w,0)=EL.FEP_D(j,0)
		              ELd.FEP_D(w,1)=kPi/2
		              ELd.FEP_D(w,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd.Jx,0)
		              ELd.FEP_D(w,3)=Min(EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd.Jx,ELd.L)
		              w=w+1
		            End
		          Next
		          Vet_ELd.Append(ELd)
		          
		          Dim ELd2 As New PorticoPlano
		          //Numeração dos Nós
		          ELd2.J=LastK
		          ELd2.K=ELd2.J+1
		          LastK=ELd2.K
		          //Comprimento do elemento
		          ELd2.L=Ld-temp
		          //Coordenadas dos nós
		          ELd2.Jx=LastKx
		          ELd2.Kx=ELd2.Jx+ELd2.L
		          LastKx=ELd2.Kx
		          ELd2.Jy=0
		          ELd2.Ky=0
		          //Ângulo com a horizontal é nulo
		          ELd2.B=0
		          ELd2.CosX=1 //(EL.Kx-EL.Jx)/EL.L
		          ELd2.CosY=0 //(EL.Ky-EL.Jy)/EL.L
		          //Elasticidade Secante
		          ELd2.E=EL.E
		          //Propriedades da Seção
		          ELd2.A=EL.A
		          ELd2.I=EL.I
		          //Carregamento Distribuido
		          w=0
		          For p As Integer = 0 To Ubound(EL.FEP_D,1)
		            If EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)>ELd2.Jx Then
		              Redim ELd2.FEP_D(Ubound(ELd2.FEP_D,1)+1,3)
		              ELd2.FEP_D(w,0)=EL.FEP_D(j,0)
		              ELd2.FEP_D(w,1)=kPi/2
		              ELd2.FEP_D(w,2)=Max(EL.Jx+EL.FEP_D(j,2)-ELd2.Jx,0)
		              ELd2.FEP_D(w,3)=Min( EL.Jx+EL.FEP_D(j,2)+EL.FEP_D(j,3)-ELd2.Jx,ELd2.L)
		              w=w+1
		            End
		          Next
		          temp1.Append(ELd2.J)
		          temp2.Append(EL.FEP_C(j,0))
		          temp3.Append(1)
		          Vet_ELd.Append(ELd2)
		          temp4=False
		        End
		      Next
		      If temp4 Then Vet_ELd.Append(ELd)
		      temp4=True
		    Next
		  Next
		  
		  //Incluir os nós dos elementos discretizados
		  For i As Integer = 0 To Nnos-2
		    For j As Integer = 0 To kGL*(Ndisc-1)-1
		      If i=0 Then
		        MtxANo_Rest.insert(3+j,0)
		      Else
		        MtxANo_Rest.insert(kGL*Ndisc*i+3+j,0)
		      End
		    Next
		  Next
		  
		  For i As Integer = 0 To ubound(temp1)
		    If temp3(i)=1 Then
		      MtxANo_Rest.insert(temp1(i)+1,0)
		      MtxANo_Rest.insert(temp1(i)+2,0)
		      MtxANo_Rest.insert(temp1(i)+3,0)
		    End
		  Next
		  
		  Nnos=(Ubound(MtxANo_Rest)+1)/3
		  
		  Redim Vet_EL(-1)
		  For Each EL As PorticoPlano In Vet_ELd
		    Vet_EL.Append(EL)
		  Next
		  
		  Redim MtxANo_ES_NR(-1)
		  Redim MtxANo_ES_NR(Nnos*kGL-1)
		  
		  For i As Integer = 0 To ubound(temp1)
		    MtxANo_ES_NR(3*temp1(i)-2)=-temp2(i)
		  Next
		  
		  Redim MtxD_ES_NR(-1)
		  Redim MtxD_ES_NR(Nnos*kGL-1)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FEP(V() As PorticoPlano)
		  //Calcula o vetor MtxFEP_ES_NR da Estrutura
		  
		  'Soma das FEP EL SG
		  Redim MtxFEP_ES_NR(-1)
		  Redim MtxFEP_ES_NR(Nnos*kGL-1)
		  For each X As PorticoPlano in V
		    FEP(X)
		    VetCorr(X)
		    for i as integer = 0 to 2*kGL-1
		      MtxFEP_ES_NR(VC(i))=MtxFEP_ES_NR(VC(i))+MtxFEP_EL_SG(i)
		    next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FEP(X As PorticoPlano)
		  //Calcula os vetores MtxFEP_EL_SL e MtxFEP_EL_SG do elemento X
		  
		  //Cargas Concentradas
		  Redim MtxFEP_C(-1)
		  Redim MtxFEP_C(2*kGL-1)
		  if Ubound(X.FEP_C,1)>-1 then
		    for i as integer = 0 to Ubound(X.FEP_C,1)
		      Dim a As Double = X.FEP_C(i,2)
		      Dim L As Double =X.L
		      Dim b As Double =L-a
		      Dim inc As Double =X.FEP_C(i,1)
		      Dim Pv As Double = X.FEP_C(i,0)*Sin(inc)
		      Dim Ph As Double =X.FEP_C(i,0)*Cos(inc)
		      
		      If Ph <0.01 Then
		        Ph=0
		      Elseif Pv<0.001 Then
		        Pv=0
		      end
		      
		      MtxFEP_C(0)=MtxFEP_C(0) - Ph*b/L
		      MtxFEP_C(2)=MtxFEP_C(2) + Pv*a*b^2/L^2
		      MtxFEP_C(3)=MtxFEP_C(3) - Ph*a/L
		      MtxFEP_C(5)=MtxFEP_C(5) - Pv*a^2*b/L^2
		      MtxFEP_C(1)=MtxFEP_C(1) + Pv*b/L + (Pv*a*b^2/L^2 + - Pv*a^2*b/L^2)/L
		      MtxFEP_C(4)=MtxFEP_C(4) + Pv - Pv*b/L + (Pv*a*b^2/L^2 + - Pv*a^2*b/L^2)/L
		      
		    next
		  End
		  
		  //Cargas Distribuídas
		  Redim MtxFEP_D(-1)
		  Redim MtxFEP_D(2*kGL-1)
		  if Ubound(X.FEP_D,1)>-1 then
		    for i as integer = 0 to Ubound(X.FEP_D,1)
		      Dim L As Double = X.L
		      Dim c As Double =X.FEP_D(i,3)-X.FEP_D(i,2)
		      Dim a As Double =X.FEP_D(i,2) + c/2
		      Dim b As Double =L-a
		      Dim inc As Double =X.FEP_D(i,1)
		      //Converter para kN/m
		      Dim Pv As Double = X.FEP_D(i,0)*Sin(inc)/100
		      Dim Ph As Double =X.FEP_D(i,0)*Cos(inc)/100
		      
		      if Ph <0.01 then
		        Ph=0
		      Elseif Pv<0.001 Then
		        Pv=0
		      end
		      
		      MtxFEP_D(0)=MtxFEP_D(0) + 0
		      MtxFEP_D(2)=MtxFEP_D(2) + (Pv*c)*(12*a*b^2+c^2*(L-3*b))/(12*L^2)
		      MtxFEP_D(3)=MtxFEP_D(3) + 0
		      MtxFEP_D(5)=MtxFEP_D(5) - (Pv*c)*(12*a*b^2+c^2*(L-3*b))/(12*L^2) - (3*Pv*c^3)*(b-a)/(12*L^3)
		      MtxFEP_D(1)=MtxFEP_D(1) + Pv*c*b/L - ((3*Pv*c^3)*(b-a)/(12*L^3))/L
		      MtxFEP_D(4)=MtxFEP_D(4) + Pv*c - Pv*c*b/L + ((3*Pv*c^3)*(b-a)/(12*L^3))/L
		    next
		  End
		  
		  //Soma as parcelas no vetor SL
		  Redim MtxFEP_EL_SL(-1)
		  Redim MtxFEP_EL_SL(2*kGL-1)
		  for i as integer = 0 to 2*kGL-1
		    MtxFEP_EL_SL(i)=MtxFEP_C(i)+MtxFEP_D(i)
		  next
		  
		  //Passa para os eixos globais
		  VetCorr(X)
		  Rotacao(X)
		  MtxFEP_EL_SG=MV_Mult(MtxRt,MtxFEP_EL_SL)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reacoes(V() As PorticoPlano)
		  //Reações da Estrutura
		  Deslocamentos(V)
		  Redim MtxANo_ES_R(-1)
		  Redim MtxANo_ES_R(Nnos*kGL-NDL-1)
		  MtxANo_ES_R=VV_Soma((MV_Mult(MtxS_ES_RL,MtxD_ES_L)),VV_Soma(MV_Mult(MtxS_ES_RR,MtxD_ES_R),MtxFEP_ES_R))
		  
		  //Inserir as reações da mola no vetor de reaões da estrutura
		  //Primeiro pilar no 3GL global
		  If MtxS_Mola(0)>0 Then MtxANo_ES_R.Insert(2,-MtxD_ES_L(0)*MtxS_Mola(0))
		  //Último pilar no último GL global
		  If MtxS_Mola(1)>0 Then MtxANo_ES_R.Append(-MtxD_ES_L(NDL-1)*MtxS_Mola(1))
		  //For i As Integer = 0 To ubound(MtxS_ES_RL,1)
		  //MW.Listbox1.AddRow
		  //For j As Integer = 0 To  ubound(MtxS_ES_RL,2)
		  //MW.Listbox1.Cell(i,j)=Str(MtxS_ES_RL(i,j))
		  //Next
		  //Next
		  //
		  //For i As Integer = 0  To ubound(MtxD_ES_L)
		  //MW.Listbox2.AddRow
		  //MW.Listbox2.Cell(i,0)=Str(MtxD_ES_L(i))
		  //Next
		  //
		  //For i As Integer = 0 To ubound(MtxS_ES_RR,1)
		  //MW.Listbox3.AddRow
		  //For j As Integer = 0 To  ubound(MtxS_ES_RR,2)
		  //MW.Listbox3.Cell(i,j)=Str(MtxS_ES_RR(i,j))
		  //Next
		  //Next
		  //
		  //For i As Integer = 0 To ubound(MtxD_ES_R)
		  //MW.Listbox4.AddRow
		  //MW.Listbox5.AddRow
		  //MW.Listbox4.Cell(i,0)=Str(MtxD_ES_R(i))
		  //MW.Listbox5.Cell(i,0)=Str(MtxFEP_ES_R(i))
		  //Next
		  
		  //MW.LIstbox1.textout
		  //MW.LIstbox2.textout
		  //MW.LIstbox3.textout
		  //MW.LIstbox4.textout
		  //MW.LIstbox5.textout
		  //
		  Dim c(-1) As Double = MtxANo_ES_R
		  Dim b As Double
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reacoes(X As PorticoPlano)
		  //Reações do Elemento X
		  Deslocamentos(Vet_EL)
		  Rigidez(X)
		  Rotacao(X)
		  FEP(X)
		  VetCorr(X)
		  
		  Redim MtxD_EL(-1)
		  Redim MtxD_EL(2*kGL-1)
		  
		  For i As Integer = 0 To 2*kGL-1
		    MtxD_EL(i)=MtxD_ES(VC(i))
		  Next
		  
		  Redim MtxANo_EL_R(-1)
		  Redim MtxANo_EL_R(2*kGL-1)
		  
		  MtxANo_EL_R=VV_Soma(MV_Mult(MtxS_EL_SL,MV_Mult(MtxR,MtxD_EL)),MtxFEP_EL_SL)
		  
		  //Dim b(-1) As Double = MtxANo_EL_R
		  //dim c as double
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reordenacao(V() As PorticoPlano)
		  //Calcula a Matriz de Reordenação
		  Redim MtxRd (-1,-1)
		  Redim MtxRd(Nnos*kGL-1, 3)
		  
		  //Direção antiga
		  For i As Integer = 0 To Nnos*kGL-1
		    MtxRd(i,0)=i+1
		  Next
		  
		  //Índice de Restrição
		  For i As Integer = 0 To Nnos*kGL-1
		    MtxRd(i,1)=MtxANo_Rest(i)
		  Next
		  
		  //Número de Restrições Livres (NDL) e Restringidas (NDR)
		  NDR=0
		  NDL=0
		  For i As Integer = 0 To Nnos*kGL-1
		    If MtxRd(i,1)=1 Then
		      NDR=NDR+1
		    Else
		      NDL=NDL+1
		    End
		  Next
		  
		  //Índice de Restrição Acumulado
		  MtxRd(0,2)=MtxRd(0,1)
		  For i As Integer = 1 To Nnos*kGL-1
		    MtxRd(i,2)= MtxRd(i-1,2) + MtxRd(i,1)
		  Next
		  
		  //Nova Direção
		  For i As Integer = 0 To Nnos*kGL-1
		    If MtxRd(i,1)=0 Then
		      MtxRd(i,3)=MtxRd(i,0)-MtxRd(i,2)
		    Else
		      MtxRd(i,3)=NDL+MtxRd(i,2)
		    End
		  Next
		  
		  //====================================================================
		  //Calcula o Sistema Global Reordenado
		  FEP(V)
		  Rigidez(V)
		  
		  //Rigidez Reordenada
		  Redim MtxS_ES_RO(-1,-1)
		  Redim MtxS_ES_RO(Nnos*kGL-1, Nnos*kGL-1)
		  For i As Integer = 0 To Nnos*kGL-1
		    For j As Integer = 0 To Nnos*kGL-1
		      MtxS_ES_RO(MtxRd(i,3)-1,MtxRd(j,3)-1)=MtxS_ES_NR(i,j)
		    Next
		  Next
		  
		  //Ações Reordenado
		  Redim MtxANo_ES_RO(-1)
		  Redim MtxANo_ES_RO(Nnos*kGL-1)
		  For i As Integer= 0 To Nnos*kGL-1
		    MtxANo_ES_RO(MtxRd(i,3)-1)= MtxANo_ES_NR(i)
		  Next
		  
		  //FEP Reordenado
		  Redim MtxFEP_ES_RO(-1)
		  Redim MtxFEP_ES_RO(Nnos*kGL-1)
		  For i As Integer= 0 To Nnos*kGL-1
		    MtxFEP_ES_RO(MtxRd(i,3)-1)= MtxFEP_ES_NR(i)
		  Next
		  
		  //Rigidez LL
		  Redim MtxS_ES_LL(-1, -1)
		  Redim MtxS_ES_LL(NDL-1, NDL-1)
		  For i As Integer = 0 To NDL-1
		    For j As Integer = 0 To NDL-1
		      MtxS_ES_LL(i,j)= MtxS_ES_RO(i,j)
		    Next
		  Next
		  
		  //Rigidez RL
		  Redim MtxS_ES_RL(-1,-1)
		  Redim MtxS_ES_RL(Nnos*kGL-NDL-1, NDL-1)
		  For i As Integer =  NDL To Nnos*kGL-1
		    For j As Integer = 0 To NDL-1
		      MtxS_ES_RL(i-NDL,j)= MtxS_ES_RO(i,j)
		    Next
		  Next
		  
		  //Rigidez LR
		  Redim MtxS_ES_LR(-1,-1)
		  Redim MtxS_ES_LR(NDL-1, Nnos*kGL-NDL-1)
		  For i As Integer = 0 To NDL-1
		    For j As Integer = NDL To Nnos*kGL-1
		      MtxS_ES_LR(i,j-NDL)= MtxS_ES_RO(i,j)
		    Next
		  Next
		  
		  //Rigidez RR
		  Redim MtxS_ES_RR(-1,-1)
		  Redim MtxS_ES_RR(Nnos*kGL-NDL-1, Nnos*kGL-NDL-1)
		  For i As Integer = NDL To Nnos*kGL-1
		    For j As Integer = NDL To Nnos*kGL-1
		      MtxS_ES_RR(i-NDL,j-NDL)= MtxS_ES_RO(i,j)
		    Next
		  Next
		  
		  //Ações L
		  Redim MtxANo_ES_L(-1)
		  Redim MtxANo_ES_L(NDL-1)
		  
		  For i As Integer = 0 To Nnos*kGL-1
		    If i < NDL Then
		      MtxANo_ES_L(i)=MtxANo_ES_RO(i)
		    End
		  Next
		  
		  //Deslocamento R (Recalque)
		  Redim MtxD_ES_R(-1)
		  Redim MtxD_ES_R(Nnos*kGL-NDL-1)
		  For i As Integer = 0 To Nnos*kGL-1
		    If i > NDL-1 Then
		      MtxD_ES_R(i-NDL)=MtxD_ES_NR(i)
		    End
		  Next
		  
		  //FEP L e R
		  Redim MtxFEP_ES_L(-1)
		  Redim MtxFEP_ES_R(-1)
		  Redim MtxFEP_ES_L(NDL-1)
		  Redim MtxFEP_ES_R(Nnos*kGL-NDL-1)
		  For i As Integer = 0 To Nnos*kGL-1
		    If i < NDL Then
		      MtxFEP_ES_L(i)=MtxFEP_ES_RO(i)
		    Else
		      MtxFEP_ES_R(i-NDL)=MtxFEP_ES_RO(i)
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rigidez(V() As PorticoPlano)
		  //Calcula a Matriz MtxS_ES_NR da Estrutura
		  
		  Redim MtxS_ES_NR(-1,-1)
		  Redim MtxS_ES_NR(Nnos*kGL-1,Nnos*kGL-1)
		  
		  //Soma das S_EL_SG
		  For Each X As PorticoPlano In V
		    Rigidez(X)
		    VetCorr(X)
		    For i As Integer = 0 To 2*kGL-1
		      For j As Integer = 0 To 2*kGL-1
		        MtxS_ES_NR(VC(i),VC(j))=MtxS_ES_NR(VC(i),VC(j))+MtxS_EL_SG(i,j)
		      Next
		    Next
		  Next
		  
		  //Somar a rigidez da mola Z no caso de apoios em pilares extremos
		  Dim E As Double = PropMat(0).Ecs
		  Dim I As Double
		  Dim PeDireito As Double = 300 //cm
		  Redim MtxS_Mola(-1)
		  Redim MtxS_Mola(1) //salvar a rigidez da mola para o cálculo da reação
		  If MW.LB_Nos.Cell(0,1)="Pilar" Then
		    I  = CDbl(MW.LB_Nos.Cell(0,3))*CDbl(MW.LB_Nos.Cell(0,2))^3/12
		    MtxS_ES_NR(2,2)=MtxS_ES_NR(2,2)+8*E*I/(PeDireito/2)
		    MtxS_Mola(0)=8*E*I/(PeDireito/2)
		  End
		  If MW.LB_Nos.Cell(MW.LB_Nos.LastIndex,1)="Pilar" Then 
		    I  = CDbl(MW.LB_Nos.Cell(MW.LB_Nos.LastIndex,3))*CDbl(MW.LB_Nos.Cell(MW.LB_Nos.LastIndex,2))^3/12
		    MtxS_ES_NR(Nnos*kGL-1,Nnos*kGL-1)=MtxS_ES_NR(Nnos*kGL-1,Nnos*kGL-1)+8*E*I/(PeDireito/2)
		    MtxS_Mola(1)=8*E*I/(PeDireito/2)
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rigidez(X As PorticoPlano)
		  //Calcula as matrizes de rigidez do Elemento X
		  
		  ReDim MtxS_EL_SL(-1,-1)
		  ReDim MtxS_EL_SL(2*kGL-1,2*kGL-1)
		  
		  MtxS_EL_SL(0,0) = X.E*X.A/X.L
		  MtxS_EL_SL(0,1) = 0
		  MtxS_EL_SL(0,2) = 0
		  MtxS_EL_SL(0,3) = -X.E*X.A/X.L
		  MtxS_EL_SL(0,4) = 0
		  MtxS_EL_SL(0,5) = 0
		  
		  MtxS_EL_SL(1,0) = 0
		  MtxS_EL_SL(1,1) = 12*X.E*X.I/X.L^3
		  MtxS_EL_SL(1,2) = 6*X.E*X.I/X.L^2
		  MtxS_EL_SL(1,3) = 0
		  MtxS_EL_SL(1,4) = -12*X.E*X.I/X.L^3
		  MtxS_EL_SL(1,5) = 6*X.E*X.I/X.L^2
		  
		  MtxS_EL_SL(2,0) = 0
		  MtxS_EL_SL(2,1) = 6*X.E*X.I/X.L^2
		  MtxS_EL_SL(2,2) = 4*X.E*X.I/X.L
		  MtxS_EL_SL(2,3) = 0
		  MtxS_EL_SL(2,4) = -6*X.E*X.I/X.L^2
		  MtxS_EL_SL(2,5) = 2*X.E*X.I/X.L
		  
		  MtxS_EL_SL(3,0) = -X.E*X.A/X.L
		  MtxS_EL_SL(3,1) = 0
		  MtxS_EL_SL(3,2) = 0
		  MtxS_EL_SL(3,3) = X.E*X.A/X.L
		  MtxS_EL_SL(3,4) = 0
		  MtxS_EL_SL(3,5) = 0
		  
		  MtxS_EL_SL(4,0) = 0
		  MtxS_EL_SL(4,1) = -12*X.E*X.I/X.L^3
		  MtxS_EL_SL(4,2) = -6*X.E*X.I/X.L^2
		  MtxS_EL_SL(4,3) = 0
		  MtxS_EL_SL(4,4) = 12*X.E*X.I/X.L^3
		  MtxS_EL_SL(4,5) = -6*X.E*X.I/X.L^2
		  
		  MtxS_EL_SL(5,0) = 0
		  MtxS_EL_SL(5,1) = 6*X.E*X.I/X.L^2
		  MtxS_EL_SL(5,2) = 2*X.E*X.I/X.L
		  MtxS_EL_SL(5,3) = 0
		  MtxS_EL_SL(5,4) = -6*X.E*X.I/X.L^2
		  MtxS_EL_SL(5,5) = 4*X.E*X.I/X.L
		  
		  Rotacao(X)
		  VetCorr(X)
		  
		  Redim MtxS_EL_SG(-1,-1)
		  ReDim MtxS_EL_SG(2*kGL-1,2*kGL-1)
		  
		  'Calcula a Rigidez Global do Elemento [S_SG]=[Rt]*([S_SL]*[R])
		  MtxS_EL_SG=MM_Mult(MM_Mult(MtxRt,MtxS_EL_SL),MtxR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotacao(X As PorticoPlano)
		  //Calcula As Matrizes de Rotação Do Elemento X
		  
		  Redim MtxR(-1,-1)
		  Redim MtxRt(-1,-1)
		  Redim MtxR(2*kGL-1,2*kGL-1)
		  Redim MtxRt(2*kGL-1,2*kGL-1)
		  
		  MtxR(0,0) = X.CosX
		  MtxR(0,1) = X.CosY
		  MtxR(0,2) = 0
		  MtxR(0,3) = 0
		  MtxR(0,4) = 0
		  MtxR(0,5) = 0
		  
		  MtxR(1,0) = -X.CosY
		  MtxR(1,1) = X.CosX
		  MtxR(1,2) = 0
		  MtxR(1,3) = 0
		  MtxR(1,4) = 0
		  MtxR(1,5) = 0
		  
		  MtxR(2,0) = 0
		  MtxR(2,1) = 0
		  MtxR(2,2) = 1
		  MtxR(2,3) = 0
		  MtxR(2,4) = 0
		  MtxR(2,5) = 0
		  
		  MtxR(3,0) = 0
		  MtxR(3,1) = 0
		  MtxR(3,2) = 0
		  MtxR(3,3) = X.CosX
		  MtxR(3,4) = X.CosY
		  MtxR(3,5) = 0
		  
		  MtxR(4,0) = 0
		  MtxR(4,1) = 0
		  MtxR(4,2) = 0
		  MtxR(4,3) = -X.CosY
		  MtxR(4,4) = X.CosX
		  MtxR(4,5) = 0
		  
		  MtxR(5,0) = 0
		  MtxR(5,1) = 0
		  MtxR(5,2) = 0
		  MtxR(5,3) = 0
		  MtxR(5,4) = 0
		  MtxR(5,5) = 1
		  
		  //Cálculo da Tranposta
		  For i As Integer = 0 To 2*kGL-1
		    For j As Integer = 0 To 2*kGL-1
		      MtxRt(i,j)=MtxR(j,i)
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VetCorr(X As PorticoPlano)
		  //Calcula o Vetor de Correspondência do Elemento X
		  
		  Redim VC(-1)
		  Redim VC(2*kGL-1)
		  
		  VC(0)=kGL*(X.J)-3
		  VC(1)=kGL*(X.J)-2
		  VC(2)=kGL*(X.J)-1
		  VC(3)=kGL*(X.K)-3
		  VC(4)=kGL*(X.K)-2
		  VC(5)=kGL*(X.K)-1
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Def
		Módulo com os dados e métodos para o cálculo de Pórtico Plano
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			Matriz de Ações Nodais do Elemento Restringido (Reações do Elemento)
		#tag EndNote
		Private MtxANo_EL_R(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MtxAno_ES(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Ações Nodais da Estrutura Livre
		#tag EndNote
		Private MtxANo_ES_L(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Ações Nodais da Estrutura Não Restringida
		#tag EndNote
		Private MtxANo_ES_NR(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Ações Nodais da Estrutura Restringido (Reações da Estrutura)
		#tag EndNote
		Private MtxANo_ES_R(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Ações Nodais da Estrutura Reordenada
		#tag EndNote
		Private MtxANo_ES_RO(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz das Restrições Nodais da Estrutura
		#tag EndNote
		Private MtxANo_Rest(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Deslocamentos do Elemento
		#tag EndNote
		Private MtxD_EL(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Deslocamentos da Estrutura
		#tag EndNote
		Private MtxD_ES(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Deslocamentos da Estrutura Livre
		#tag EndNote
		Private MtxD_ES_L(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Deslocamentos da Estrutura Não Restringida
		#tag EndNote
		Private MtxD_ES_NR(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Deslocamentos da Estrutura Restringida
		#tag EndNote
		Private MtxD_ES_R(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MtxD_ES_VC(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			FEP Carga Concentrada
		#tag EndNote
		Private MtxFEP_C(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			FEP Carga Distribuída
		#tag EndNote
		Private MtxFEP_D(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz FEP do elemento no sistema global
		#tag EndNote
		Private MtxFEP_EL_SG(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz FEP do elemento no sistema local
		#tag EndNote
		Private MtxFEP_EL_SL(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MtxFEP_ES_L(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz FEP da Estrutura Não Restringida
		#tag EndNote
		Private MtxFEP_ES_NR(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MtxFEP_ES_R(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MtxFEP_ES_RO(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			FEP Momento Atuante (Barras)
		#tag EndNote
		Private MtxFEP_M(5) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			FEP Temperatura
		#tag EndNote
		Private MtxFEP_T(5) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Matriz com os valores dos diagramas Do modelo 1
			
			coluna 0 - Coordenada X (Nós Kx com o primeiro sendo 0)
			coluna 1 - Cortante em kN
			Coluna 2 - Momento em kNcm
			Coluna 3 - Deslocamento vertical em cm
			Coluna 4 - Deslocamento de rotação em rad
		#tag EndNote
		MtxModelo1(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Matriz com os valores dos diagramas Do modelo 2
			
			coluna 0 - Coordenada X (Nós Kx com o primeiro sendo 0)
			coluna 1 - Cortante em kN
			Coluna 2 - Momento em kNcm
			Coluna 3 - Deslocamento vertical em cm
			Coluna 4 - Deslocamento de rotação em rad
		#tag EndNote
		MtxModelo2(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rotação do Elemento
		#tag EndNote
		Private MtxR(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Reordenação
			
			0 - Direção Antiga
			1 - Índice de Restrição
			2 - Índice de Restrição Acumulado
			3 - Direção Nova
		#tag EndNote
		Private MtxRd(-1,-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rotação Tranposta do Elemento
		#tag EndNote
		Private MtxRt(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez do Elemento no Sistema Global
		#tag EndNote
		Private MtxS_EL_SG(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez do Elemento no Sistema Local
		#tag EndNote
		Private MtxS_EL_SL(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez Livre na Direção Livre
		#tag EndNote
		Private MtxS_ES_LL(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez Restringida na Direção Livre
		#tag EndNote
		Private MtxS_ES_LR(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez da Estrutura Não Restringida
		#tag EndNote
		Private MtxS_ES_NR(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez Livre na Direção Restringida
			
		#tag EndNote
		Private MtxS_ES_RL(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez da Estrutura Reordenada
		#tag EndNote
		Private MtxS_ES_RO(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Matriz de Rigidez Restringida na Direção Restringida
		#tag EndNote
		Private MtxS_ES_RR(-1,-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MtxS_Mola(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NDisc As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Número de Direções Livres
		#tag EndNote
		Private NDL As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Número de Direções Restringidas
		#tag EndNote
		Private NDR As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Número de nós da Estrutura
		#tag EndNote
		Nnos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PropMat(0) As PropMateriais
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Vetor de Correspondência
			
		#tag EndNote
		Private VC(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Vetor dos elementos do tipo Portico Plano
		#tag EndNote
		Vet_EL(-1) As PorticoPlano
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Vet_ELd(-1) As PorticoPlano
	#tag EndProperty


	#tag Constant, Name = kGL, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Nnos"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
