#tag Module
Protected Module MetodosGlobais
	#tag Method, Flags = &h0
		Function Angulo(x1 As Double, y1 As Double, x2 As Double, y2 As Double) As Double
		  'Calcula o ângulo do elemento em relação ao eixo das abcissas, no sentido anti-horário, com base nas coordenadas dos nós
		  If (x2-x1) >= 0 And (y2-y1) >= 0 Then
		    Return (kPi/2- ATan((x2-x1)/(y2-y1)))*180/kPi
		    
		  Elseif (x2-x1) <=0 And (y2-y1) >= 0 Then
		    Return (kPi/2 + ATan(Abs((x2-x1)/(y2-y1))))*180/kPi
		    
		  Elseif (x2-x1) <=0 And (y2-y1) <= 0 Then
		    Return (3*kPi/2 - ATan((x2-x1)/(y2-y1)))*180/kPi
		    
		  Elseif (x2-x1) >=0 And (y2-y1) <= 0 Then
		    Return (3*kPi/2+ATan(Abs((x2-x1)/(y2-y1))))*180/kPi
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Area(diametro As Double) As Double
		  return kPi*diametro^2/4
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Area(base As Double, altura As Double) As Double
		  return base*altura
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Comprimento(x1 As Double, y1 As Double, x2 As Double, y2 As Double) As Double
		  'Calcula o comprimento com base nas coordenadas dos nós
		  Return ( Sqrt( (y2-y1)^2+(x2-x1)^2 ) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Gauss(M(,) as Double, V() as Double) As Double()
		  //M a matriz de coeficientes, V o vetor dos termos independentes
		  Dim X(-1) As Double
		  Dim M1(-1,-1) As Double
		  Dim L As Integer = Ubound(M,1)
		  Dim C As Integer = Ubound(M,2)
		  dim temp as double
		  
		  Redim M1(L,C+1)
		  
		  For i As Integer = 0 To L
		    For j As Integer = 0 To C
		      M1(i,j)=M(i,j)
		    Next
		    M1(i,C+1)=V(i)
		  Next
		  
		  For i As Integer = 0 To L-1
		    If M1(i,i)=0 Then
		      For k As Integer = i+1 To L
		        If M1(k,i) <> 0 Then
		          Dim M2(-1,-1) As Double
		          Redim M2(0,C+1)
		          For j As Integer = 0 To C+1
		            M2(i,j)=M1(i,j)
		            M1(i,j)=M1(k,j)
		            M1(k,j)=M2(i,j)
		            Break
		          Next
		        End
		      Next
		    End
		    For j As Integer = i+1 To L
		      temp=M1(j,i)/M1(i,i)
		      For k As Integer = i To C+1
		        M1(j,k)=M1(j,k)-temp*M1(i,k)
		      Next
		    Next
		  Next
		  
		  Redim X(L)
		  X(L)= M1(L,C+1)/M1(L,C)
		  
		  For i As Integer = 0 To L-1
		    Dim ii As Integer
		    ii=(L-1)-i
		    temp=0
		    For k As Integer = ii+1 To L
		      temp=temp+M1(ii,k)*X(k)
		    Next
		    X(ii)= (M1(ii,C+1)-temp)/M1(ii,ii)
		  Next
		  
		  Return X
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncluirApoio(ByRef Extends V() as integer, x1 as integer, x2 as integer, x3 as integer)
		  //Extensão para preencher o vetor de Ações Nodais 
		  V.Append(x1)
		  V.Append(x2)
		  V.Append(x3)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Inercia(diametro as Double) As Double
		  return kPi*(diametro*0.5)^4/4
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Inercia(base As Double, altura As Double) As Double
		  return base*altura^3/12
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Mappend(ByRef Extends M(,) As Double, C As integer, Valor As Double)
		  //Adaptar a função append para matrizes. Inserir o Valor, adicionado na nova linha e coluna C
		  Redim M(Ubound(M,1)+1,Ubound(M,2))
		  M(Ubound(M,1),C)=valor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MM_Mult(M1(,) As Double , M2(,) As Double) As Double(,)
		  //Multiploicação Matriz Matriz
		  Dim X(-1,-1) As Double
		  Redim X(Ubound(M1,2),Ubound(M2,1))
		  
		  If Ubound(M1,2)=UBound(M2,1) Then
		    
		    for i as integer = 0 to Ubound(M1,1)
		      for j as integer = 0 to Ubound(M1,2)
		        for k as integer = 0 to Ubound(M2,1)
		          
		          X(i,j)=X(i,j)+M1(i,k)*M2(k,j)
		          
		        next
		      next
		    next
		    
		  End
		  
		  Return X
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MV_Mult(M(,) As Double, V() As Double) As Double()
		  //Multiplicação Matriz Vetor
		  Dim X(-1) As Double
		  Redim X(Ubound(M,1))
		  
		  If Ubound(M,2)=Ubound(V) Then
		    
		    For i As Integer = 0 To Ubound(M,1)
		      For j As Integer = 0 To Ubound(M,2)
		        
		        X(i)= X(i)+ M(i,j)*V(j)
		        
		      Next
		    Next
		    
		  End
		  
		  Return X
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub textOut(extends lb As ListBox)
		  //Exportar ListBox para txt
		  Dim excelOut As TextOutputStream
		  
		  Dim dlg As New SaveAsDialog
		  Dim f As FolderItem
		  
		  dlg.InitialDirectory=SpecialFolder.Desktop
		  dlg.promptText="Save Text As"
		  dlg.SuggestedFileName="My Text Out.txt"
		  dlg.Title="Text Output"
		  
		  f=dlg.ShowModal
		  
		  If f <> Nil Then
		    excelOut = TextOutputStream.Create(f)
		    If excelOut <> Nil Then
		      excelOut.Write lb.cell(-1,-1)
		      excelOut.Close
		    End If
		  Else
		    //user canceled
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VaoEf(Linterno As String, Hviga As String, ApoioEsqB As String, ApoioDirB As String) As Double
		  //Calcular o vão efetivo da viga
		  Return CDbl(Linterno)_
		  +Min(0.3*CDbl(Hviga), 0.5*CDbl(ApoioEsqB))_
		  +Min(0.3*CDbl(Hviga), 0.5*CDbl(ApoioDirB))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VV_Rest(V1() As Double, V2() As Double) As Double()
		  //Substração Vetor Vetor
		  Dim X(-1) As Double
		  Redim X(Ubound(V1))
		  
		  For i As Integer = 0 To Ubound(V1)
		    X(i)=V1(i)-V2(i)
		  Next
		  Return X
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VV_Soma(V1() As Double, V2() As Double) As Double()
		  //Soma Vetor Vetor
		  Dim X(-1) As Double
		  Redim X(Ubound(V1))
		  
		  For i As Integer = 0 To Ubound(V1)
		    X(i)=V1(i)+V2(i)
		  Next
		  
		  Return X
		End Function
	#tag EndMethod


	#tag Note, Name = Def
		Módulo com operadores e constantes globais
		
	#tag EndNote


	#tag Constant, Name = kPi, Type = Double, Dynamic = False, Default = \"3.14159265358979323846264338327950", Scope = Public
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
	#tag EndViewBehavior
End Module
#tag EndModule
