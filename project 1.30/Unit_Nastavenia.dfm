object WndNastavenia: TWndNastavenia
  Left = 366
  Top = 287
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 279
  ClientWidth = 358
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
  object Button1: TButton
    Left = 280
    Top = 248
    Width = 73
    Height = 25
    Caption = 'Save'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 200
    Top = 144
    Width = 153
    Height = 57
    Caption = 'Limit magnitude'
    TabOrder = 1
    object RBtTrojuholniky: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Limit squares'
      TabOrder = 0
    end
    object RBtLimitka: TRadioButton
      Left = 8
      Top = 32
      Width = 113
      Height = 17
      Caption = 'LImit magnitude'
      TabOrder = 1
    end
  end
  object Button2: TButton
    Left = 200
    Top = 248
    Width = 73
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 200
    Width = 185
    Height = 41
    Caption = 'Altitude of horizont'
    TabOrder = 3
    object Horiz: TSpinEdit
      Left = 16
      Top = 14
      Width = 49
      Height = 22
      MaxValue = 35
      MinValue = 0
      TabOrder = 0
      Value = 10
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 0
    Width = 185
    Height = 201
    Caption = 'Meteor table'
    TabOrder = 4
    object GroupBox6: TGroupBox
      Left = 8
      Top = 16
      Width = 169
      Height = 57
      Caption = 'Shower competence'
      TabOrder = 0
      object Label1: TLabel
        Left = 56
        Top = 35
        Width = 85
        Height = 13
        Caption = 'Shower from table'
      end
      object RBtSporadicky: TRadioButton
        Left = 8
        Top = 16
        Width = 113
        Height = 17
        Caption = 'Sporadic (-)'
        TabOrder = 0
        OnClick = RBtSporadickyClick
      end
      object CBoxRoje: TComboBox
        Left = 8
        Top = 32
        Width = 41
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBoxRojeChange
      end
    end
    object GroupBox7: TGroupBox
      Left = 8
      Top = 80
      Width = 169
      Height = 57
      Caption = 'Trace'
      TabOrder = 1
      object SoStopou: TRadioButton
        Left = 8
        Top = 16
        Width = 113
        Height = 17
        Caption = 'Trace (+)'
        TabOrder = 0
      end
      object BezStopy: TRadioButton
        Left = 8
        Top = 32
        Width = 113
        Height = 18
        Caption = 'Without trace (-)'
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 8
      Top = 144
      Width = 169
      Height = 41
      Caption = 'Quality'
      TabOrder = 2
      object kvalita: TSpinEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 22
        MaxValue = 3
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
    end
  end
  object GroupBox9: TGroupBox
    Left = 200
    Top = 0
    Width = 153
    Height = 145
    Caption = 'Statistics charts'
    TabOrder = 5
    object ContVyskaRadiantu: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Radiant altitude'
      TabOrder = 0
    end
    object ContRastZHR: TCheckBox
      Left = 8
      Top = 32
      Width = 105
      Height = 17
      Caption = 'ZHR change'
      TabOrder = 1
    end
    object ContLimitky: TCheckBox
      Left = 8
      Top = 48
      Width = 137
      Height = 17
      Caption = 'Lim. magintudes change'
      TabOrder = 2
    end
    object ContFrekvenciaZHR: TCheckBox
      Left = 8
      Top = 64
      Width = 129
      Height = 17
      Caption = 'Minute frequency'
      TabOrder = 3
    end
    object ContPoctyMeteorov: TCheckBox
      Left = 8
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Meteor count'
      TabOrder = 4
    end
    object Button3: TButton
      Left = 32
      Top = 114
      Width = 89
      Height = 25
      Caption = 'Select all'
      TabOrder = 5
      OnClick = Button3Click
    end
    object ContPrestavky: TCheckBox
      Left = 8
      Top = 80
      Width = 97
      Height = 17
      Caption = 'Breaks'
      TabOrder = 6
    end
  end
  object GroupBox4: TGroupBox
    Left = 200
    Top = 200
    Width = 153
    Height = 41
    Caption = 'Red Filter'
    TabOrder = 6
    object RedFilter: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Red Filter'
      TabOrder = 0
    end
  end
end
