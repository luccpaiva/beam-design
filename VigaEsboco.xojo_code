#tag Class
Protected Class VigaEsboco
	#tag Method, Flags = &h0
		Sub Constructor(ComprimentoInterno As String, AlturaViga As String, ApoioEsquerdoTipo As String, ApoioEsquerdoB As String, ApoioEsquerdoH As String, ApoioDireitoTipo As String, ApoioDireitoB As String, ApoioDireitoH As String)
		  //Ordem para passar os parâmetros
		  Lint=CDbl(ComprimentoInterno)
		  Hviga=CDbl(AlturaViga)
		  ApoioEsqTipo=ApoioEsquerdoTipo
		  ApoioEsqB=CDbl(ApoioEsquerdoB)
		  ApoioEsqH=CDbl(ApoioEsquerdoH)
		  ApoioDirTipo=ApoioDireitoTipo
		  ApoioDirB=CDbl(ApoioDireitoB)
		  ApoioDirH=CDbl(ApoioDireitoH)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ApoioDirB As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		ApoioDirH As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		ApoioDirTipo As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ApoioEsqB As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		ApoioEsqH As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		ApoioEsqTipo As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Hviga As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Lint As Double
	#tag EndProperty


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
			Name="Lint"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ApoioEsqB"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ApoioEsqH"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ApoioDirH"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ApoioDirB"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ApoioEsqTipo"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ApoioDirTipo"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hviga"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
