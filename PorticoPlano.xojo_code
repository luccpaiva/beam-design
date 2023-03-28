#tag Class
Protected Class PorticoPlano
	#tag Property, Flags = &h0
		#tag Note
			Área (m²)
		#tag EndNote
		A As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Coeficiente Térmico (1/ºC)
		#tag EndNote
		Alfa As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Inclinação (Rad)
		#tag EndNote
		B As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Cosseno diretor eixo X 
			
		#tag EndNote
		CosX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Cosseno diretor eixo Y
			
		#tag EndNote
		CosY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Elasticidade (kN/m²)
		#tag EndNote
		E As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Carregamento Concentrado
			
			Coluna 0 - Módulo Do Carga (kN) +entrando na barra, -saindo da barra
			Coluna 1 - Ângulo com o eixo da barra (Rad), sentido anti-horário
			Coluna 2 - Distância Do nó inicial até o ponto de atuação da carga (m)
		#tag EndNote
		FEP_C(-1,2) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Carregamento Distribuido
			
			Coluna 0 - Módulo Do Carga (kN) +entrando na barra, -saindo da barra
			Coluna 1 - Ângulo com o eixo da barra (Rad), sentido anti-horário
			Coluna 2 - Distância Do nó inicial até o começo da carga (m)
			Coluna 3 - Distância Do nó inicial até o fim da carga (m)
		#tag EndNote
		FEP_D(-1,3) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Carregamento de Momento
			
			Coluna 0 - Módulo da Carga (kN), +anti horário, -horário
			Coluna 1 - Distância do nó inicial até o ponto de atuação da carga (m)
			
		#tag EndNote
		FEP_M(-1,2) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Variação de  Temperatura
			
			Coluna 0 - Temperatura de Referência da Estrutura (ºC)
			Coluna 1 - Temperatura Interna Do Elemento (ºC)
			Coluna 2 - Temperatura Externa do ELemento (ºC)
		#tag EndNote
		FEP_T(2) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Inércia (m⁴)
		#tag EndNote
		I As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Nó J
		#tag EndNote
		J As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Coordenada X do nó J (m)
		#tag EndNote
		Jx As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Coordenada Y do nó J (m)
		#tag EndNote
		Jy As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Nó K
		#tag EndNote
		K As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Coordenada X do nó K (m)
		#tag EndNote
		Kx As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Coordenada Y do nó K (m)
		#tag EndNote
		Ky As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Comprimento efetivo (m)
		#tag EndNote
		L As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Poisson
		#tag EndNote
		V As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Peso Específico (kN/m³)
		#tag EndNote
		Y As Double
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
			Name="J"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="K"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Jx"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Jy"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Kx"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ky"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="A"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="L"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="B"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CosX"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CosY"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="E"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="V"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="I"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alfa"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
