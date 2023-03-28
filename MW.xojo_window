#tag Window
Begin Window MW
   BackColor       =   &cC0C0C000
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   862744575
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Calculadora de Vigas em Concreto Armado"
   Visible         =   True
   Width           =   1000
   Begin TabPanel TP_Principal
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   599
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Tab 0\rTab 1"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Century Gothic"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   999
      Begin GroupBox GB_Secao2
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Seção Longitudinal e Carregamentos"
         Enabled         =   True
         Height          =   203
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   442
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   17
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   537
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Concreto"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   77
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Agregado"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Tipo Agregado"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   144
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   85
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Aço"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   178
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   70
      End
      Begin PopupMenu PopupPropMat
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   21
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "TP_Principal"
         InitialValue    =   "C20\r\nC25\r\nC30\r\nC40\r\nC50"
         Italic          =   False
         Left            =   106
         ListIndex       =   1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   77
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   74
      End
      Begin PopupMenu PopupPropMat
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   21
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "TP_Principal"
         InitialValue    =   "Brita 1\r\nBrita 2"
         Italic          =   False
         Left            =   106
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   110
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   74
      End
      Begin PopupMenu PopupPropMat
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   21
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "TP_Principal"
         InitialValue    =   "Basalto\r\nDiabásio\r\nGranito\r\nGnaisse\r\nCalcário\r\nArenito"
         Italic          =   False
         Left            =   106
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   144
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   74
      End
      Begin PopupMenu PopupPropMat
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   21
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "TP_Principal"
         InitialValue    =   "CA-25\r\nCA-50\r\nCA-60"
         Italic          =   False
         Left            =   106
         ListIndex       =   1
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   178
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   74
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   8
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   450
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   18
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Número de Nós"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   70
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin TextField TF_Nnos
         AcceptTabs      =   False
         Alignment       =   2
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   554
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   23
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "3"
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   69
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   54
      End
      Begin PushButton BT_CargaConc
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Cargas Concentradas"
         Default         =   True
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   462
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   20
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   131
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   140
      End
      Begin PushButton BT_CargaDist
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Cargas Distribuidas"
         Default         =   True
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   462
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   21
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   166
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   140
      End
      Begin PushButton BT_CargaMom
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Momentos Atuantes"
         Default         =   True
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   462
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   22
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   198
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   140
      End
      Begin PushButton BT_Apoios
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Apoios"
         Default         =   True
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   554
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   24
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   98
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   54
      End
      Begin PagePanel PP_DadosEntrada
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   166
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         PanelCount      =   6
         Panels          =   ""
         Scope           =   0
         TabIndex        =   26
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   68
         Transparent     =   False
         Value           =   3
         Visible         =   True
         Width           =   359
         Begin CheckBox CB_PesoProprio
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Incluir peso próprio da viga nos cálculos"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "PP_DadosEntrada"
            Italic          =   False
            Left            =   640
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            State           =   0
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   214
            Transparent     =   False
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   235
         End
         Begin ListBoxAlignment LB_CargaConc
            AutoDeactivate  =   True
            AutoHideScrollbars=   True
            Bold            =   False
            Border          =   True
            ColumnCount     =   2
            ColumnsResizable=   False
            ColumnWidths    =   "93,93"
            DataField       =   ""
            DataSource      =   ""
            DefaultRowHeight=   -1
            Enabled         =   True
            EnableDrag      =   False
            EnableDragReorder=   False
            GridLinesHorizontal=   3
            GridLinesVertical=   3
            HasHeading      =   True
            HeadingIndex    =   -1
            Height          =   114
            HelpTag         =   ""
            Hierarchical    =   False
            Index           =   -2147483648
            InitialParent   =   "PP_DadosEntrada"
            InitialValue    =   "Posição (cm)	Módulo (kN)"
            Italic          =   False
            Left            =   756
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            RequiresSelection=   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollBarVertical=   True
            SelectionType   =   0
            ShowDropIndicator=   False
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   186
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
         Begin ListBoxAlignment LB_CargaDist
            AutoDeactivate  =   True
            AutoHideScrollbars=   True
            Bold            =   False
            Border          =   True
            ColumnCount     =   3
            ColumnsResizable=   False
            ColumnWidths    =   "75,75,100"
            DataField       =   ""
            DataSource      =   ""
            DefaultRowHeight=   -1
            Enabled         =   True
            EnableDrag      =   False
            EnableDragReorder=   False
            GridLinesHorizontal=   3
            GridLinesVertical=   3
            HasHeading      =   True
            HeadingIndex    =   -1
            Height          =   114
            HelpTag         =   ""
            Hierarchical    =   False
            Index           =   -2147483648
            InitialParent   =   "PP_DadosEntrada"
            InitialValue    =   "Início (cm)	Comp. (cm)	Módulo (kN/m)\r\n20	540	12\r\n560	567	68"
            Italic          =   False
            Left            =   719
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            RequiresSelection=   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollBarVertical=   True
            SelectionType   =   0
            ShowDropIndicator=   False
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   250
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
         Begin ListBoxAlignment LB_Nos
            AutoDeactivate  =   True
            AutoHideScrollbars=   True
            Bold            =   False
            Border          =   True
            ColumnCount     =   4
            ColumnsResizable=   False
            ColumnWidths    =   "75,75,75,75"
            DataField       =   ""
            DataSource      =   ""
            DefaultRowHeight=   -1
            Enabled         =   True
            EnableDrag      =   False
            EnableDragReorder=   False
            GridLinesHorizontal=   3
            GridLinesVertical=   3
            HasHeading      =   True
            HeadingIndex    =   -1
            Height          =   114
            HelpTag         =   ""
            Hierarchical    =   False
            Index           =   -2147483648
            InitialParent   =   "PP_DadosEntrada"
            InitialValue    =   "Nó	Tipo	b (cm)	h (cm)	\r\n1	Pilar	40	20	\r\n2	Pilar	50	20	\r\n3	Pilar	40	20	"
            Italic          =   False
            Left            =   659
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            RequiresSelection=   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollBarVertical=   True
            SelectionType   =   0
            ShowDropIndicator=   False
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   False
            Visible         =   True
            Width           =   300
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
         Begin ListBoxAlignment LB_Trechos
            AutoDeactivate  =   True
            AutoHideScrollbars=   True
            Bold            =   False
            Border          =   True
            ColumnCount     =   2
            ColumnsResizable=   False
            ColumnWidths    =   "50,100"
            DataField       =   ""
            DataSource      =   ""
            DefaultRowHeight=   -1
            Enabled         =   True
            EnableDrag      =   False
            EnableDragReorder=   False
            GridLinesHorizontal=   3
            GridLinesVertical=   3
            HasHeading      =   True
            HeadingIndex    =   -1
            Height          =   114
            HelpTag         =   ""
            Hierarchical    =   False
            Index           =   -2147483648
            InitialParent   =   "PP_DadosEntrada"
            InitialValue    =   "Trecho	L,interno (cm)\r\n1-2	500\r\n2-3	495"
            Italic          =   False
            Left            =   734
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            RequiresSelection=   False
            Scope           =   0
            ScrollbarHorizontal=   False
            ScrollBarVertical=   True
            SelectionType   =   0
            ShowDropIndicator=   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   88
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   150
            _ScrollOffset   =   0
            _ScrollWidth    =   -1
         End
      End
      Begin PushButton BT_Comprimentos
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Comprimentos"
         Default         =   True
         Enabled         =   True
         Height          =   25
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   450
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   19
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   98
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   98
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   12
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   25
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextAlign       =   1
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   63
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   378
      End
      Begin PushButton BT_InserirCarga
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Inserir"
         Default         =   True
         Enabled         =   True
         Height          =   27
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   633
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   27
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   128
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   80
      End
      Begin PushButton BT_ApagarCarga
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "1"
         Cancel          =   False
         Caption         =   "Apagar"
         Default         =   True
         Enabled         =   True
         Height          =   27
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   633
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   28
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   161
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   79
      End
      Begin Canvas CV_Entrada
         AcceptFocus     =   True
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   True
         Height          =   290
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   276
         Transparent     =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   965
      End
      Begin ScrollBar SB_Vertical
         AcceptFocus     =   True
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   290
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Left            =   979
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Minimum         =   0
         PageStep        =   10
         Scope           =   0
         TabIndex        =   29
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   276
         Transparent     =   False
         Value           =   0
         Visible         =   True
         Width           =   15
      End
      Begin ScrollBar SB_Horizontal
         AcceptFocus     =   True
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   15
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Left            =   11
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Maximum         =   100
         Minimum         =   0
         PageStep        =   50
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   569
         Transparent     =   False
         Value           =   0
         Visible         =   True
         Width           =   965
      End
      Begin PushButton BT_CanvasConcep
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Concepção"
         Default         =   True
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   11
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton BT_CanvasReac
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Reações"
         Default         =   True
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   222
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton BT_CanvasDEC
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "DEC"
         Default         =   True
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   327
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton BT_CanvasDMF
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "DMF"
         Default         =   True
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   434
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   89
      End
      Begin GroupBox GB_Material
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Propriedades dos Materiais"
         Enabled         =   True
         Height          =   180
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   11
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   189
      End
      Begin GroupBox GB_Secao1
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Propriedades da Seção Transversal"
         Enabled         =   True
         Height          =   180
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   209
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   40
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   221
         Begin PushButton BT_CAA
            AutoDeactivate  =   True
            Bold            =   False
            ButtonStyle     =   "0"
            Cancel          =   False
            Caption         =   "?"
            Default         =   True
            Enabled         =   True
            Height          =   25
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   386
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Scope           =   0
            TabIndex        =   8
            TabPanelIndex   =   1
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   142
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   24
         End
         Begin TextField TF_dvib
            AcceptTabs      =   False
            Alignment       =   2
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   24
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   319
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   7
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "30"
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   176
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   56
         End
         Begin Label Label1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   11
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   217
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "D,agulha (mm)"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   177
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   89
         End
         Begin TextField TF_Cob
            AcceptTabs      =   False
            Alignment       =   2
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   24
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   319
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   6
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "25"
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   143
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   56
         End
         Begin Label Label1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   21
            HelpTag         =   ""
            Index           =   3
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   217
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Cobrimento (mm)"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   143
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   99
         End
         Begin TextField TF_Hviga
            AcceptTabs      =   False
            Alignment       =   2
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   24
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   319
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   5
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "45"
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   109
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   56
         End
         Begin Label Label1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   10
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   217
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Altura (cm)"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   109
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
         Begin TextField TF_BViga
            AcceptTabs      =   False
            Alignment       =   2
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &cFFFFFF00
            Bold            =   False
            Border          =   True
            CueText         =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   24
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   319
            LimitText       =   0
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Mask            =   ""
            Password        =   False
            ReadOnly        =   False
            Scope           =   0
            TabIndex        =   4
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "20"
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   76
            Transparent     =   False
            Underline       =   False
            UseFocusRing    =   True
            Visible         =   True
            Width           =   56
         End
         Begin Label Label1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   6
            InitialParent   =   "GB_Secao1"
            Italic          =   False
            Left            =   217
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "Base (cm)"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   76
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   70
         End
      End
      Begin PushButton BT_CanvasTeorico
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Teórico"
         Default         =   True
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         Italic          =   False
         Left            =   117
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin Listbox Listbox1
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   5
         ColumnsResizable=   False
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   False
         HeadingIndex    =   -1
         Height          =   200
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "TP_Principal"
         InitialValue    =   ""
         Italic          =   False
         Left            =   320
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "Century Gothic"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   186
         Transparent     =   False
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   300
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Maximize()
		  CV_Entrada.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  //Desativa a organização de colunas das ListBoxs ao clicar
		  Dim c As Control
		  For i As Integer = 0 To Self.ControlCount-1
		    c=Self.Control(i)
		    If c IsA Listbox Then
		      ListBox(c).HeaderType(-1)=ListBox.HeaderTypes.NotSortable
		    End
		  Next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  CV_Entrada.Invalidate(False)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Cota(g As Graphics, x1 As Double, y1 As Double, x2 As Double, y2 As Double)
		  //Desenhar cota do par (x1,y1) até (x2,y2), bolinha+risquinho nas pontas e legenda
		  g.ForeColor=Color.Blue
		  g.PenWidth=1
		  g.TextSize=13
		  g.Bold=True
		  g.TextFont= "Century Gothic"
		  Dim d As Integer = 6 // diâmetro do círculo
		  Dim delta As Double
		  delta=Sqrt((x2-x1)^2+(y2-y1)^2)
		  
		  //Seta Esquerda
		  g.FillOval(x1-d/2, y1-d/2, d, d)
		  g.Drawline(x1,y1+5,x1,y1-15)
		  //Linha
		  g.DrawLine(x1, y1, x2, y2)
		  //Seta Direita
		  g.FillOval(x2-d/2, y2-d/2, d, d)
		  g.DrawLine(x2,y2+5,x2,y2-15)
		  //Legenda
		  If x2-x1 < 20 Then // Caso a legenda não caiba no espaço
		    g.DrawLine((x1+x2)/2, y1, x2, y1-25)
		    g.DrawString(CStr(delta), x2-7, y1-25)
		  Else
		    g.DrawString(CStr(delta),(x1+x2)/2-7, y1-5)
		  End
		  g.PenWidth=2
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DesenharConcepcao()
		  //Calcular o comprimento total da viga
		  Dim LtotalViga As Double
		  Dim Hviga As Double = CDbl(TF_Hviga.Text)
		  For i As Integer = 0 To LB_Trechos.LastIndex
		    LtotalViga=LtotalViga+CDbl(LB_Trechos.Cell(i,1))
		  Next
		  For i As Integer = 0 To LB_Nos.LastIndex
		    LtotalViga=LtotalViga+CDbl(LB_Nos.Cell(i,2))
		  Next
		  
		  //Calcular o apoio mais alto pra desenhar a cota
		  Dim OYcota As Double
		  For i As Integer = 0 To LB_Nos.LastIndex
		    If OYcota<CDbl(LB_Nos.Cell(i,3)) And LB_Nos.Cell(i,1)="Viga" Then OYcota=CDbl(LB_Nos.Cell(i,3))
		  Next
		  OYcota=Max(OYcota,Hviga)+Hviga+30
		  
		  //Desenhar o Quadro
		  CanvasEntrada=New Picture(LtotalViga+80,Max(CV_Entrada.Height,OYcota+150), 144)
		  
		  //Pintar o fundo
		  // CanvasEntrada.Graphics.ForeColor= RGB(192,192,192)
		  // CanvasEntrada.Graphics.FillRect(0,0,CanvasEntrada.Width,CanvasEntrada.Height)
		  
		  //Obter o valor do Textfield
		  Nnos=CDbl(TF_Nnos.Text)
		  
		  //Carregar as informações para o classe de vigas
		  Redim VetorVigas(-1)
		  For i As Integer = 0 To Nnos-2
		    Dim V As New VigaEsboco(LB_Trechos.Cell(i,1), TF_Hviga.Text, LB_Nos.Cell(i,1), _
		    LB_Nos.Cell(i,2), LB_Nos.Cell(i,3), LB_Nos.Cell(i+1,1), LB_Nos.Cell(i+1,2), LB_Nos.Cell(i+1,3))
		    VetorVigas.Append(V)
		  Next
		  
		  //Desenhar a Viga
		  Dim OPX, OPY As Integer //Origem Parcial
		  OPX=10
		  OPY=(CanvasEntrada.Height-Hviga)/2
		  OYcota=OYcota+OPY
		  CanvasEntrada.Graphics.ForeColor = Color.Blue
		  Dim p As Integer // Espessura da pena pra corrigir os desenhos
		  CanvasEntrada.Graphics.TextSize=13
		  CanvasEntrada.Graphics.Bold=True
		  CanvasEntrada.Graphics.TextFont= "Century Gothic"
		  Dim contviga As Integer = 1
		  Dim contpilar As Integer= 1
		  Dim legendaapoio As String
		  CanvasEntrada.Graphics.PenWidth = 2
		  p=CanvasEntrada.Graphics.PenWidth
		  
		  For Each V As VigaEsboco In VetorVigas
		    // Construir o nome do apoio esquerdo V2 (15x40) ou P1 (20x45)
		    If V.ApoioEsqTipo="Viga" Then
		      legendaapoio="V"+CStr(contviga)+" ("+CStr(V.ApoioEsqB)+"x"+CStr(V.ApoioEsqH)+")"
		    Else
		      legendaapoio="P"+CStr(contpilar)+" ("+CStr(V.ApoioEsqB)+"x"+CStr(V.ApoioEsqH)+")"
		    End
		    
		    If V.ApoioEsqTipo="Viga" Then
		      CanvasEntrada.Graphics.DrawRect(OPX, OPY, V.ApoioEsqB+p, V.ApoioEsqH+p)
		      //Legenda
		      CanvasEntrada.Graphics.DrawString(legendaapoio,OPX+5, OPY+V.ApoioEsqH+18)
		      contviga=contviga+1
		    Else
		      //Linha Vertical Esquerda
		      CanvasEntrada.Graphics.DrawLine(OPX, OPY+V.Hviga, OPX,OPY+ 1.8*V.Hviga)
		      //Linha Horizontal Inferior
		      CanvasEntrada.Graphics.DrawLine(OPX, OPY+1.8*V.Hviga, OPX+V.ApoioEsqB, OPY+1.8*V.Hviga)
		      //Linha Horizontal Superior
		      CanvasEntrada.Graphics.DrawLine(OPX, OPY, OPX+V.ApoioEsqB, OPY)
		      //Linha Vertical Direita
		      CanvasEntrada.Graphics.DrawLine(OPX+V.ApoioEsqB, OPY+V.Hviga, OPX+V.ApoioEsqB, OPY+1.8*V.Hviga)
		      //Legenda
		      CanvasEntrada.Graphics.DrawString(legendaapoio,OPX+V.ApoioEsqB+5, OPY+V.Hviga+18)
		      contpilar=contpilar+1
		    End
		    //Viga Interna
		    //Linha Superior
		    Cota(CanvasEntrada.Graphics, OPX, OYcota, OPX+V.ApoioEsqB, OYcota)
		    OPX=OPX+V.ApoioEsqB
		    CanvasEntrada.Graphics.DrawLine(OPX,OPY, OPX+V.Lint, OPY)
		    //Linha Inferior
		    CanvasEntrada.Graphics.DrawLine(OPX,OPY+V.Hviga, OPX+V.Lint, OPY+V.Hviga)
		    Cota(CanvasEntrada.Graphics, OPX, OYcota, OPX+V.Lint, OYcota)
		    OPX=OPX+V.Lint
		    
		    //Apoio direito da última viga
		    If VetorVigas.IndexOf(V)=Nnos-2 Then
		      // Construir o nome do apoio direito
		      If V.ApoioDirTipo="Viga" Then
		        legendaapoio="V"+CStr(contviga)+" ("+CStr(V.ApoioDirB)+"x"+CStr(V.ApoioDirH)+")"
		      Else
		        legendaapoio="P"+CStr(contpilar)+" ("+CStr(V.ApoioDirB)+"x"+CStr(V.ApoioDirH)+")"
		      End
		      If V.ApoioDirTipo="Viga" Then
		        CanvasEntrada.Graphics.DrawRect(OPX, OPY, V.ApoioDirB+p, V.ApoioDirH+p)
		        //Legenda
		        CanvasEntrada.Graphics.DrawString(legendaapoio,OPX+5, OPY+V.ApoioDirH+18)
		        Cota(CanvasEntrada.Graphics, OPX, OYcota, OPX+V.ApoioDirB, OYcota)
		      Else
		        //Linha Vertical Esquerda
		        CanvasEntrada.Graphics.DrawLine(OPX, OPY+V.Hviga, OPX, OPY+ 1.8*V.Hviga)
		        //Linha Horizontal Inferior
		        CanvasEntrada.Graphics.DrawLine(OPX, OPY+1.8*V.Hviga, OPX+V.ApoioDirB, OPY+1.8*V.Hviga)
		        //Linha Horizontal Superior
		        CanvasEntrada.Graphics.DrawLine(OPX, OPY, OPX+V.ApoioDirB, OPY)
		        //Linha Vertical Direita
		        CanvasEntrada.Graphics.DrawLine(OPX+V.ApoioDirB, OPY, OPX+V.ApoioDirB, OPY+1.8*V.Hviga)
		        CanvasEntrada.Graphics.DrawString(legendaapoio,OPX+V.ApoioDirB+5, OPY+V.Hviga+18)
		        Cota(CanvasEntrada.Graphics, OPX, OYcota, OPX+V.ApoioDirB, OYcota)
		      End
		    End
		  Next
		  //Caso o primeiro apoio seja um pilar, fechar a linha vertical esquerda
		  If MW.LB_Nos.Cell(0,1)="Pilar" Then
		    CanvasEntrada.Graphics.DrawLine(10, OPY, 10, OPY+Hviga)
		  End
		  
		  CanvasEntrada.Graphics.PenWidth = 1
		  p=CanvasEntrada.Graphics.PenWidth
		  
		  //Escala para desenhar as Cargas
		  Dim Escala As Double = 100 //Comprimento máximo de 100 pixels
		  Dim MaiorCarga As Double
		  For i As Integer = 0 To LB_CargaConc.LastIndex
		    MaiorCarga=Max(MaiorCarga,CDbl(LB_CargaConc.Cell(i,1)))
		  Next
		  For i As Integer = 0 To LB_CargaDist.LastIndex
		    MaiorCarga=Max(MaiorCarga,CDbl(LB_CargaDist.Cell(i,2)))
		  Next
		  Escala=Escala/MaiorCarga
		  
		  //Cargas Concentradas
		  Dim x1,x2,y1,y2 As Double
		  CanvasEntrada.Graphics.ForeColor = Color.Red
		  For i As Integer = 0 To LB_CargaConc.LastIndex
		    x1=10+CDbl(LB_CargaConc.Cell(i,0))
		    y1=OPY-p
		    x2=x1
		    y2=y1-CDbl(LB_CargaConc.Cell(i,1))*Escala
		    CanvasEntrada.Graphics.Drawline(x1,y1,x2,y2)
		    //Setas com comprimento de 5 pixels
		    CanvasEntrada.Graphics.Drawline(x1,y1,x1+5,y1-5)
		    CanvasEntrada.Graphics.Drawline(x1,y1,x1-5,y1-5)
		    //Módulo da carga
		    CanvasEntrada.Graphics.DrawString(LB_cargaConc.Cell(i,1)+" kN", x1-7, y2-2)
		  Next
		  
		  //Cargas Distribuidas
		  //x1,y1 como o canto esquerdo do retângulo
		  //x2 como a largura e y2 como a altura do retângulo
		  For i As Integer = 0 To LB_CargaDist.LastIndex
		    x1=10+CDbl(LB_CargaDist.Cell(i,0))
		    y1=OPY-CDbl(LB_CargaDist.Cell(i,2))*Escala
		    x2=Val(LB_CargaDist.Cell(i,1))
		    y2=CDbl(LB_CargaDist.Cell(i,2))*Escala
		    CanvasEntrada.Graphics.DrawRect(x1,y1,x2,y2)
		    //Seta Esquerda
		    CanvasEntrada.Graphics.DrawLine(x1, y1+y2-2, x1-5, y1+y2-5-2)
		    CanvasEntrada.Graphics.DrawLine(x1, y1+y2-2, x1+5, y1+y2-5-2)
		    //Seta Direita
		    CanvasEntrada.Graphics.DrawLine(x1+x2-p, y1+y2-2, x1+x2-5-p, y1+y2-5-2) // por algum motivo, a seta fica desalinhada sem o -2
		    CanvasEntrada.Graphics.DrawLine(x1+x2-p, y1+y2-2, x1+x2+5-p, y1+y2-5-2)
		    //Módulo da carga
		    CanvasEntrada.Graphics.DrawString(LB_CargaDist.Cell(i,2)+ " kN/m", x1+x2/2-30,y1-2)
		  Next
		  
		  //Atualizar o quadro
		  CanvasEntrada.Graphics.PenWidth=1
		  CanvasEntrada.Graphics.DrawRect(1,1,CanvasEntrada.Width-1,CanvasEntrada.Height-1)
		  
		  CV_Entrada.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DesenharTeorico()
		  //Obter o vetor com as informações do modelo teórico
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FormatarNnos()
		  //Obter o valor do Textfield
		  Nnos=Val(TF_Nnos.Text)
		  
		  //Formatar a ListBox de Nós
		  LB_Nos.DeleteAllRows
		  For i As Integer = 0 To Nnos-1
		    LB_Nos.AddRow
		    LB_Nos.Cell(i,0)=CStr(i+1)
		  Next
		  
		  //Formatar a ListBox de Trechos
		  LB_Trechos.DeleteAllRows
		  For i As Integer = 0 To Nnos -2
		    LB_Trechos.AddRow
		    LB_Trechos.Cell(i,0)=CStr(i+1)+"-"+CStr(i+2)
		  Next
		  
		  //Excluir as linhas das ListBoxs de Cargas
		  LB_CargaConc.DeleteAllRows
		  LB_CargaDist.DeleteAllRows
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CanvasEntrada As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		iColumn As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LB As ListBox
	#tag EndProperty

	#tag Property, Flags = &h0
		mHorizontalScrollBarLast As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mOldX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mOldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mSB_VerticalLast As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mXScroll As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		mYScroll As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		VetorVigas(-1) As VigaEsboco
	#tag EndProperty


#tag EndWindowCode

#tag Events TP_Principal
	#tag Event
		Sub Open()
		  Me.Caption(0)="Dados de Entrada"
		  Me.Caption(1)="Armadura"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TF_Nnos
	#tag Event
		Sub TextChange()
		  FormatarNnos
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CargaConc
	#tag Event
		Sub Action()
		  PP_DadosEntrada.Value=2
		  Label1(12).Text="                            Cargas Concentradas"
		  BT_InserirCarga.Visible=True
		  BT_ApagarCarga.Visible=True
		  LB=LB_CargaConc
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CargaDist
	#tag Event
		Sub Action()
		  PP_DadosEntrada.Value=3
		  Label1(12).Text="                           Cargas Distribuidas"
		  BT_InserirCarga.Visible=True
		  BT_ApagarCarga.Visible=True
		  LB=LB_CargaDist
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_Apoios
	#tag Event
		Sub Action()
		  PP_DadosEntrada.Value=1
		  Label1(12).Text="Definição dos Apoios"
		  BT_InserirCarga.Visible=False
		  BT_ApagarCarga.Visible=False
		  LB_Nos.EditCell(0,2)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PP_DadosEntrada
	#tag Event
		Sub Open()
		  me.Value=5
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LB_CargaConc
	#tag Event
		Sub Open()
		  For i As Integer = 0 To Me.ColumnCount-1
		    Me.ColumnType(i)=Me.TypeEditable
		  Next
		  
		  Me.HeaderAlignment(-1)=Listbox.AlignCenter
		  _
		  _
		  _
		  _
		  _
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  iRow=row
		  iColumn=column
		End Function
	#tag EndEvent
	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  'Função para usar Tab na ListBox
		  If Key =  Chr(9) Then
		    
		    If column=0 Then
		      Me.EditCell(row, column+1)
		      Return True
		    Elseif iRow <>Me.ListCount-1 Then
		      iColumn=0
		      iRow=row+1
		      Me.EditCell(iRow,iColumn)
		      Return True
		    End
		    
		  End
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LB_CargaDist
	#tag Event
		Sub Open()
		  For i As Integer = 0 To Me.ColumnCount-1
		    Me.ColumnType(i)=Me.TypeEditable
		  Next
		  
		  Me.HeaderAlignment(-1)=Listbox.AlignCenter
		End Sub
	#tag EndEvent
	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  'Função para usar Tab na ListBox
		  If Key =  Chr(9) Then
		    
		    If column<2 Then
		      Me.EditCell(row, column+1)
		      Return True
		    Elseif iRow <>Me.ListCount-1 Then
		      iColumn=0
		      iRow=row+1
		      Me.EditCell(iRow,iColumn)
		      Return True
		    End
		    
		  End
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  iRow=row
		  iColumn=column
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LB_Nos
	#tag Event
		Sub Open()
		  For i As Integer = 2 To Me.ColumnCount-1
		    me.ColumnType(i)=me.TypeEditable
		  next
		  
		  Me.HeaderAlignment(-1)=Listbox.AlignCenter
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  //Controle do tipo de apoio
		  //Alterna entre (1) Pilar e (2) Viga
		  //Não usar 0 ou 1 porque o CellTag default é 0
		  If column=1 Then
		    Select Case Me.CellTag(row,column)
		    Case 0,2
		      Me.CellTag(row,column)=1
		    Case 1
		      Me.Celltag(row,column)=2
		    End Select
		  End
		  
		  iRow=row
		  iColumn=column
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  //Formata a coluna do tipo de Nó
		  If row > -1 And row < Me.listcount And Column=1 Then
		    Select Case Me.CellTag(row,column)
		    Case 1
		      g.ForeColor=RGB(255,210,210) // Vermelho
		      g.FillRect(0,0,g.Width,g.Height)
		      Me.Cell(row,column)="Pilar"
		    Case 2
		      g.ForeColor=RGB(210,240,255) // Azul
		      g.FillRect(0,0,g.Width,g.Height)
		      Me.Cell(row,column)="Viga"
		    End Select
		  End
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  'Função para usar Tab na ListBox
		  If Key =  Chr(9) Then
		    
		    If column >1 And column<3 Then
		      Me.EditCell(row, column+1)
		      Return True
		    Elseif iRow <>Me.ListCount-1 Then
		      iColumn=2
		      iRow=row+1
		      Me.EditCell(iRow,iColumn)
		      Return True
		    End
		    
		  End
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LB_Trechos
	#tag Event
		Sub Open()
		  For i As Integer = 1 To Me.ColumnCount-1
		    me.ColumnType(i)=me.TypeEditable
		  next
		  
		  Me.HeaderAlignment(-1)=Listbox.AlignCenter
		End Sub
	#tag EndEvent
	#tag Event
		Function CellKeyDown(row as Integer, column as Integer, key as String) As Boolean
		  'Função para usar Tab na ListBox
		  If Key =  Chr(9) Then
		    
		    If column=1 And row<>Me.ListCount-1 Then
		      Me.EditCell(row+1, column)
		      Return True
		      Return True
		    End
		    
		  End
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  iRow=row
		  iColumn=column
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events BT_Comprimentos
	#tag Event
		Sub Action()
		  PP_DadosEntrada.Value=0
		  Label1(12).Text="Comprimentos dos Trechos"
		  BT_InserirCarga.Visible=False
		  BT_ApagarCarga.Visible=False
		  LB_Trechos.EditCell(0,1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_InserirCarga
	#tag Event
		Sub Action()
		  LB.AddRow
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_ApagarCarga
	#tag Event
		Sub Action()
		  If LB.LastIndex>=0 Then
		    LB.RemoveRow(LB.LastIndex)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CV_Entrada
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If CanvasEntrada <> Nil Then
		    
		    //Desenha a imagem ajustada no centro
		    If CanvasEntrada.Width>960 Then
		      If MW.Width<CanvasEntrada.Width Then
		        g.DrawPicture(CanvasEntrada, mXScroll+10, mYScroll)
		      Else
		        g.DrawPicture(CanvasEntrada, (MW.Width-CanvasEntrada.Width-5)/2, mYScroll)
		      End
		    Else
		      g.DrawPicture(CanvasEntrada, (Me.Width-CanvasEntrada.Width)/2, mYScroll)
		    End
		    
		    //g.DrawPicture(CanvasEntrada,(Window1.Width-CanvasEntrada.Width-5)/2,0)
		    
		    // Size the scrollbar based on how much vertical scrolling the image can do
		    SB_Vertical.Maximum = CanvasEntrada.Height - g.Height 
		    
		    // Disable scrollbar if image is shorter than canvas area since there
		    // is nothing to scroll
		    If g.Height > CanvasEntrada.Height Then
		      SB_Vertical.Enabled = False
		      mYScroll = 0
		    Else
		      SB_Vertical.Enabled = True
		    End If
		    
		    // Size the scrollbar based on how much horizontal scrolling the image can do
		    SB_Horizontal.Maximum = CanvasEntrada.Width - Me.Width+15
		    
		    // Disable scrollbar if image is narrower than canvas area since there
		    // is nothing to scroll
		    If MW.Width > CanvasEntrada.Width Then
		      SB_Horizontal.Enabled = False 
		      mXScroll = 0
		    Else
		      SB_Horizontal.Enabled = True
		    End If
		    
		  End
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If X <> mOldX Or y <> mOldY Then
		    // If the mouse has been moved, calculate the delta
		    // and scroll the image.
		    
		    Dim dx As Integer = X - mOldX
		    Dim dy As Integer = Y - mOldY
		    
		    // Only allow image to be scrolled right and down
		    If SB_Horizontal.Value - dx < 0 Then Return
		    If SB_Vertical.Value - dy < 0 Then Return
		    
		    // Don't allow image to be scrolled beyond its size
		    If SB_Horizontal.Value - dx > SB_Horizontal.Maximum Then Return
		    If SB_Vertical.Value - dx > SB_Vertical.Maximum Then Return
		    
		    // Adjust scrollbars which will scroll image 
		    SB_Horizontal.Value = SB_Horizontal.Value - dx
		    SB_Vertical.Value = SB_Vertical.Value - dy
		    
		    mOldX = X
		    mOldY = Y
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  // Save the last mouse coordinates so we can
		  // calculate if the mouse has moved.
		  
		  mOldX = X
		  mOldY = Y
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Const kLeftArrow = 28
		  Const kRightArrow = 29
		  Const kUpArrow = 30
		  Const kDownArrow = 31
		  Const kScrollUnit = 8 // pixels to scroll per keypress
		  
		  // Move the scrollbar based on the key that was pressed
		  Select Case Asc(Key)
		  Case kLeftArrow
		    SB_Horizontal.Value = SB_Horizontal.Value - kScrollUnit
		    
		  Case kRightArrow
		    SB_Horizontal.Value = SB_Horizontal.Value + kScrollUnit
		    
		  Case kUpArrow
		    SB_Vertical.Value = SB_Vertical.Value - kScrollUnit
		    
		  Case kDownArrow
		    SB_Vertical.Value = SB_Vertical.Value + kScrollUnit
		    
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // If the mousewheel is moved over the Canvas, then
		  // use the delta to adjust the scrollbars, which
		  // scrolls the image.
		  
		  SB_Vertical.Value = SB_Vertical.Value + deltaY
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SB_Vertical
	#tag Event
		Sub ValueChanged()
		  // Calculate the delta that the scrollbar was
		  // moved and scroll the image accordingly.
		  
		  Dim delta As Integer
		  delta = mSB_VerticalLast - Me.Value
		  mYScroll = mYScroll + delta
		  
		  CV_Entrada.Scroll(0, delta)
		  
		  mSB_VerticalLast = Me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // If the mouse wheel is moved, adjust the scrollbar
		  // by the delta.
		  
		  Me.Value = Me.Value + deltaY
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SB_Horizontal
	#tag Event
		Sub ValueChanged()
		  // Calculate the delta that the scrollbar was
		  // moved and scroll the image accordingly.
		  
		  Dim delta As Integer
		  delta = mHorizontalScrollBarLast - Me.Value
		  mXScroll = mXScroll + delta
		  
		  CV_Entrada.Scroll(delta, 0)
		  
		  mHorizontalScrollBarLast = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CanvasConcep
	#tag Event
		Sub Action()
		  DesenharConcepcao
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CanvasReac
	#tag Event
		Sub Action()
		  CarregarMateriais
		  DiscModelo2
		  Reacoes(Vet_EL)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CanvasDEC
	#tag Event
		Sub Action()
		  CarregarMateriais
		  Diagramas
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CanvasDMF
	#tag Event
		Sub Action()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CAA
	#tag Event
		Sub Action()
		  CAAWindow.Visible=True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BT_CanvasTeorico
	#tag Event
		Sub Action()
		  CarregarMateriais
		  DiscModelo1v2
		  Reacoes(Vet_EL)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CanvasEntrada"
		Group="Behavior"
		Type="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mHorizontalScrollBarLast"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mOldX"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mOldY"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mXScroll"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mYScroll"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="iRow"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="iColumn"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mSB_VerticalLast"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
