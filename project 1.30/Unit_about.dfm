object About: TAbout
  Left = 280
  Top = 267
  BorderStyle = bsToolWindow
  Caption = 'About'
  ClientHeight = 228
  ClientWidth = 257
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Created by:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 204
    Height = 13
    Caption = 'Michal '#352'tefan'#269#237'k,  RNDr. Zden'#283'k Kom'#225'rek'
  end
  object Label3: TLabel
    Left = 24
    Top = 152
    Width = 207
    Height = 13
    Caption = 'Hvezd'#225're'#328' Michalovce    2009-2012'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 96
    Top = 88
    Width = 69
    Height = 13
    Caption = 'Betatesting:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 72
    Top = 104
    Width = 115
    Height = 13
    Caption = 'RNDr. Zden'#283'k Kom'#225'rek'
  end
  object Label6: TLabel
    Left = 96
    Top = 48
    Width = 77
    Height = 13
    Caption = 'Programming:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 88
    Top = 64
    Width = 80
    Height = 13
    Caption = 'Michal '#352'tefan'#269#237'k'
  end
  object Button1: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
end
