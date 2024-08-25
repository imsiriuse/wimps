object OknoIntervalu: TOknoIntervalu
  Left = 271
  Top = 196
  BorderStyle = bsToolWindow
  Caption = 'Intervals'
  ClientHeight = 481
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Intervaly: TNextGrid
    Left = 0
    Top = 0
    Width = 465
    Height = 481
    Align = alLeft
    AutoScroll = True
    HideScrollBar = False
    Options = [goDisableColumnMoving, goGrid, goHeader, goSelectFullRow]
    PopupMenu = PMenuIntervaly
    TabOrder = 0
    TabStop = True
    OnCellDblClick = IntervalyCellDblClick
    object NxTreeColumn1: TNxTreeColumn
      DefaultWidth = 150
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Interval'
      Options = [coCanClick, coCanInput, coFixedSize, coPublicUsing]
      Position = 0
      SortType = stAlphabetic
      Width = 150
      ShowLines = True
    end
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Break'
      MinWidth = 50
      Options = [coCanClick, coCanInput, coFixedSize, coPublicUsing, coShowTextFitHint]
      Position = 1
      SortType = stAlphabetic
      Width = 70
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 105
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Clouds'
      Options = [coCanClick, coCanInput, coFixedSize, coPublicUsing, coShowTextFitHint]
      Position = 2
      SortType = stAlphabetic
      Width = 105
    end
    object NxTextColumn4: TNxTextColumn
      DefaultWidth = 120
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Limit magnitude'
      Options = [coCanClick, coCanInput, coFixedSize, coPublicUsing, coShowTextFitHint]
      Position = 3
      SortType = stAlphabetic
      Width = 120
    end
  end
  object GroupBox1: TGroupBox
    Left = 472
    Top = 0
    Width = 169
    Height = 89
    BiDiMode = bdLeftToRight
    Caption = 'New interval'
    ParentBiDiMode = False
    TabOrder = 1
    object Label1: TLabel
      Left = 53
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label3: TLabel
      Left = 110
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label4: TLabel
      Left = 81
      Top = 35
      Width = 3
      Height = 13
      Caption = '-'
    end
    object Label2: TLabel
      Left = 40
      Top = 16
      Width = 80
      Height = 13
      Caption = 'Start             End'
    end
    object IntZacH: TEdit
      Left = 32
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = IntZacHKeyPress
    end
    object IntZacM: TEdit
      Left = 57
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = IntZacMKeyPress
    end
    object IntKonM: TEdit
      Left = 114
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 3
      OnKeyPress = IntKonMKeyPress
    end
    object IntKonH: TEdit
      Left = 89
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnKeyPress = IntKonHKeyPress
    end
    object BtAddInt: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 4
      OnClick = BtAddIntClick
    end
    object BtEditInt: TButton
      Left = 88
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Edit'
      Enabled = False
      TabOrder = 5
      OnClick = BtEditIntClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 472
    Top = 88
    Width = 169
    Height = 89
    Caption = 'Add observer'
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 140
      Height = 13
      Caption = 'Obs       Array        Rec    Dec'
    end
    object BtAddObs: TButton
      Left = 6
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 4
      OnClick = BtAddObsClick
    end
    object IntPoz: TEdit
      Left = 8
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = IntPozKeyPress
    end
    object IntStred: TComboBox
      Left = 40
      Top = 32
      Width = 50
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      MaxLength = 3
      TabOrder = 1
      OnChange = IntStredChange
      Items.Strings = (
        'And'
        'Ant'
        'Aps'
        'Aqr'
        'Aql'
        'Ara'
        'Ari'
        'Aur'
        'Boo'
        'Cae'
        'Cam'
        'Cnc'
        'CVn'
        'CMa'
        'CMi'
        'Cap'
        'Car'
        'Cas'
        'Cen'
        'Cep'
        'Cet'
        'Cha'
        'Cir'
        'Col'
        'Com'
        'CrA'
        'CrB'
        'Crv'
        'Crt'
        'Cru'
        'Cyg'
        'Del'
        'Dor'
        'Dra'
        'Equ'
        'Eri'
        'For'
        'Gem'
        'Gru'
        'Her'
        'Hor'
        'Hya'
        'Hyi'
        'Ind'
        'Lac'
        'Leo'
        'LMi'
        'Lep'
        'Lib'
        'Lup'
        'Lyn'
        'Lyr'
        'Men'
        'Mic'
        'Mon'
        'Mus'
        'Nor'
        'Oct'
        'Oph'
        'Ori'
        'Pav'
        'Peg'
        'Per'
        'Phe'
        'Pic'
        'Psc'
        'PsA'
        'Pup'
        'Pyx'
        'Ret'
        'Sge'
        'Sgr'
        'Sco'
        'Scl'
        'Sct'
        'Ser'
        'Sex'
        'Tau'
        'Tel'
        'Tri'
        'TrA'
        'Tuc'
        'UMa'
        'UMi'
        'Vel'
        'Vir'
        'Vol'
        'Vul')
    end
    object BtEditObs: TButton
      Left = 88
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Edit'
      Enabled = False
      TabOrder = 5
      OnClick = BtEditObsClick
    end
    object EdRec: TEdit
      Left = 98
      Top = 32
      Width = 25
      Height = 21
      MaxLength = 3
      TabOrder = 2
      OnKeyPress = EdRecKeyPress
    end
    object EdDec: TEdit
      Left = 130
      Top = 32
      Width = 25
      Height = 21
      MaxLength = 3
      TabOrder = 3
      OnKeyPress = EdDecKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 472
    Top = 176
    Width = 169
    Height = 89
    Caption = 'Add break'
    TabOrder = 3
    object Label6: TLabel
      Left = 81
      Top = 35
      Width = 3
      Height = 13
      Caption = '-'
    end
    object Label7: TLabel
      Left = 110
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label8: TLabel
      Left = 40
      Top = 16
      Width = 80
      Height = 13
      Caption = 'Start             End'
    end
    object Label9: TLabel
      Left = 53
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object BtAddBrk: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 4
      OnClick = BtAddBrkClick
    end
    object BrkKonH: TEdit
      Left = 89
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnKeyPress = BrkKonHKeyPress
    end
    object BrkKonM: TEdit
      Left = 114
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 3
      OnKeyPress = BrkKonMKeyPress
    end
    object BrkZacM: TEdit
      Left = 57
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = BrkZacMKeyPress
    end
    object BrkZacH: TEdit
      Left = 32
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = BrkZacHKeyPress
    end
    object BtEditBrk: TButton
      Left = 88
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Edit'
      Enabled = False
      TabOrder = 5
      OnClick = BtEditBrkClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 472
    Top = 264
    Width = 169
    Height = 89
    Caption = 'Add clouds'
    TabOrder = 4
    object Label10: TLabel
      Left = 29
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label11: TLabel
      Left = 86
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label12: TLabel
      Left = 57
      Top = 35
      Width = 3
      Height = 13
      Caption = '-'
    end
    object Label13: TLabel
      Left = 8
      Top = 16
      Width = 142
      Height = 13
      Caption = '    Start            End       Clouds'
    end
    object Label14: TLabel
      Left = 148
      Top = 35
      Width = 8
      Height = 13
      Caption = '%'
    end
    object CldZacH: TEdit
      Left = 8
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = CldZacHKeyPress
    end
    object CldZacM: TEdit
      Left = 33
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = CldZacMKeyPress
    end
    object CldKonM: TEdit
      Left = 90
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 3
      OnKeyPress = CldKonMKeyPress
    end
    object CldKonH: TEdit
      Left = 65
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnKeyPress = CldKonHKeyPress
    end
    object BtAddCld: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 5
      OnClick = BtAddCldClick
    end
    object CldPer: TEdit
      Left = 120
      Top = 32
      Width = 26
      Height = 21
      MaxLength = 3
      TabOrder = 4
      OnKeyPress = CldPerKeyPress
    end
    object BtEditCld: TButton
      Left = 88
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Edit'
      Enabled = False
      TabOrder = 6
      OnClick = BtEditCldClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 472
    Top = 352
    Width = 169
    Height = 89
    Caption = 'Add limit magnitude'
    TabOrder = 5
    object Label15: TLabel
      Left = 29
      Top = 35
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label18: TLabel
      Left = 21
      Top = 16
      Width = 118
      Height = 13
      Caption = 'Time      Triangle     Stars'
    end
    object LimCasH: TEdit
      Left = 8
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = LimCasHKeyPress
    end
    object LimCasM: TEdit
      Left = 33
      Top = 32
      Width = 20
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = LimCasMKeyPress
    end
    object BtAddLim: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 5
      OnClick = BtAddLimClick
    end
    object BtEditLim: TButton
      Left = 88
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Edit'
      Enabled = False
      TabOrder = 6
      OnClick = BtEditLimClick
    end
    object LimLim: TEdit
      Left = 96
      Top = 32
      Width = 34
      Height = 21
      MaxLength = 3
      TabOrder = 2
      Visible = False
      OnKeyPress = LimLimKeyPress
    end
    object LimTri: TComboBox
      Left = 62
      Top = 32
      Width = 40
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30')
    end
    object LimHv: TComboBox
      Left = 109
      Top = 32
      Width = 40
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40'
        '41'
        '42'
        '43'
        '44'
        '45'
        '46'
        '47'
        '48'
        '49'
        '50'
        '51'
        '52'
        '53'
        '54'
        '55'
        '56'
        '57'
        '58'
        '59'
        '60'
        '61'
        '62'
        '63'
        '64'
        '65'
        '66'
        '67'
        '68'
        '69'
        '70'
        '71'
        '72'
        '73'
        '74'
        '75'
        '76'
        '77'
        '78'
        '79'
        '80'
        '81'
        '82'
        '83'
        '84'
        '85'
        '86'
        '87'
        '88'
        '89'
        '90'
        '91'
        '92'
        '93'
        '94'
        '95'
        '96'
        '97'
        '98'
        '99')
    end
  end
  object Button1: TButton
    Left = 480
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Expand'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 560
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Collapse'
    TabOrder = 7
    OnClick = Button2Click
  end
  object PMenuIntervaly: TPopupMenu
    Left = 360
    Top = 432
    object Zmazadaj1: TMenuItem
      Caption = 'Erase'
      OnClick = Zmazadaj1Click
    end
  end
end
