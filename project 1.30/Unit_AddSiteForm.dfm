object AddSiteForm: TAddSiteForm
  Left = 426
  Top = 254
  BorderStyle = bsToolWindow
  Caption = 'Add observing place'
  ClientHeight = 343
  ClientWidth = 287
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 16
    Top = 168
    Width = 47
    Height = 13
    Caption = 'Longitude'
  end
  object Label8: TLabel
    Left = 16
    Top = 40
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label4: TLabel
    Left = 16
    Top = 144
    Width = 56
    Height = 13
    Caption = 'Coordinates'
  end
  object Label6: TLabel
    Left = 16
    Top = 240
    Width = 38
    Height = 13
    Caption = 'Latitude'
  end
  object Label10: TLabel
    Left = 16
    Top = 64
    Width = 47
    Height = 13
    Caption = 'IMO code'
  end
  object Label7: TLabel
    Left = 16
    Top = 112
    Width = 35
    Height = 13
    Caption = 'Altitude'
  end
  object Label9: TLabel
    Left = 16
    Top = 88
    Width = 36
    Height = 13
    Caption = 'Country'
  end
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Informations'
  end
  object Label16: TLabel
    Left = 128
    Top = 200
    Width = 5
    Height = 13
    Caption = '"'
  end
  object Label15: TLabel
    Left = 96
    Top = 200
    Width = 2
    Height = 13
    Caption = #39
  end
  object Label14: TLabel
    Left = 64
    Top = 200
    Width = 4
    Height = 13
    Caption = #176
  end
  object Label2: TLabel
    Left = 128
    Top = 264
    Width = 5
    Height = 13
    Caption = '"'
  end
  object Label3: TLabel
    Left = 96
    Top = 264
    Width = 2
    Height = 13
    Caption = #39
  end
  object Label11: TLabel
    Left = 64
    Top = 264
    Width = 4
    Height = 13
    Caption = #176
  end
  object EditMiesto: TEdit
    Left = 136
    Top = 40
    Width = 121
    Height = 21
    MaxLength = 20
    TabOrder = 0
    OnKeyPress = EditMiestoKeyPress
  end
  object EditIMOKod: TEdit
    Left = 136
    Top = 64
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 1
    OnKeyPress = EditIMOKodKeyPress
  end
  object EditVyska: TEdit
    Left = 136
    Top = 112
    Width = 121
    Height = 21
    MaxLength = 4
    TabOrder = 3
    OnKeyPress = EditVyskaKeyPress
  end
  object EditStat: TEdit
    Left = 136
    Top = 88
    Width = 121
    Height = 21
    MaxLength = 20
    TabOrder = 2
    OnKeyPress = EditStatKeyPress
  end
  object ButtonAdd: TButton
    Left = 200
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 10
    OnClick = ButtonAddClick
  end
  object ESirkaM: TEdit
    Left = 72
    Top = 264
    Width = 20
    Height = 21
    MaxLength = 2
    TabOrder = 8
    OnKeyPress = ESirkaMKeyPress
  end
  object ESirkaH: TEdit
    Left = 40
    Top = 264
    Width = 20
    Height = 21
    MaxLength = 2
    TabOrder = 7
    OnKeyPress = ESirkaHKeyPress
  end
  object EDlzkaM: TEdit
    Left = 72
    Top = 200
    Width = 20
    Height = 21
    MaxLength = 2
    TabOrder = 5
    OnKeyPress = EDlzkaMKeyPress
  end
  object EDlzkaH: TEdit
    Left = 32
    Top = 200
    Width = 28
    Height = 21
    MaxLength = 3
    TabOrder = 4
    OnKeyPress = EDlzkaHKeyPress
  end
  object EDlzkaS1: TEdit
    Left = 104
    Top = 200
    Width = 20
    Height = 21
    MaxLength = 2
    TabOrder = 6
    OnKeyPress = EDlzkaS1KeyPress
  end
  object ESirkaS1: TEdit
    Left = 104
    Top = 264
    Width = 20
    Height = 21
    MaxLength = 2
    TabOrder = 9
    OnKeyPress = ESirkaS1KeyPress
  end
  object Btcancel: TButton
    Left = 112
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 11
    OnClick = BtcancelClick
  end
  object ESirkaP: TComboBox
    Left = 144
    Top = 264
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Items.Strings = (
      'N'
      'S')
  end
  object EDlzkaP: TComboBox
    Left = 144
    Top = 200
    Width = 41
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    Items.Strings = (
      'E'
      'W')
  end
end