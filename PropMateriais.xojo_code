#tag Class
Protected Class PropMateriais
	#tag Property, Flags = &h0
		#tag Note
			parâmetro em função da natureza Do agregado que inﬂuencia o módulo de elasticidade
		#tag EndNote
		AlfaE As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Correção do módulo de elasticidade inicial
		#tag EndNote
		AlfaI As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Diâmetro Máximo Do agregado (mm)
		#tag EndNote
		Dmaxagr As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Módulo de Elasticidade Do Aço (kN/cm²)
		#tag EndNote
		Eaco As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Módulo de Elasticidade Inicial do Concreto (kN/cm²)
		#tag EndNote
		Eci As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Módulo de Elasticidade Secante Do Concreto (kN/cm²)
		#tag EndNote
		Ecs As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência à compressão de cálculo do concreto (kN/cm²)
		#tag EndNote
		Fcd As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência à Compressão Característica Do concreto (kN/cm²)
		#tag EndNote
		Fck As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			
			Resistência à tração inferior Do concreto (kN/cm²)
		#tag EndNote
		Fctkinf As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência à tração média Do concreto (kN/cm²)
		#tag EndNote
		Fctkm As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência à tração superior Do concreto (kN/cm²)
		#tag EndNote
		Fctksup As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência à compressão de cálculo Do aço (kN/cm²)
		#tag EndNote
		Fyd As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência à compressão característica do aço (kN/cm²)
		#tag EndNote
		Fyk As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência ao escoamento Do aço da armadura transversal (kN/m²)
			
			A tensão fywd, no caso de estribos, é dada pelo menor dos valores: fyd e
			435MPa. Portanto, para aços CA-50 ou CA-60, pode-se adotar:
			fywd = 435 MPa = 43,5 kN / cm2
		#tag EndNote
		Fywd As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Resistência ao escoamento Do aço da armadura transversal (kN/m²)
		#tag EndNote
		Fywk As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		GamaG As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		GamaS As Double
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
			Name="Fck"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fctkm"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fctksup"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fctkinf"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fcd"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlfaE"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlfaI"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ecs"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Eci"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Dmaxagr"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fywk"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fywd"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fyk"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fyd"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Eaco"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GamaG"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GamaS"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
