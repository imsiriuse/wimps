object DataTest: TDataTest
  Left = 260
  Top = 315
  BorderStyle = bsToolWindow
  Caption = 'Data test'
  ClientHeight = 311
  ClientWidth = 531
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
  object TabChyb: TNextGrid
    Left = 8
    Top = 8
    Width = 513
    Height = 265
    Options = [goDisableColumnMoving, goHeader, goSelectFullRow]
    TabOrder = 0
    TabStop = True
    object NxIncrementColumn1: TNxIncrementColumn
      DefaultWidth = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'N.'
      Options = [coCanClick, coCanInput, coCanSort, coFixedSize, coPublicUsing]
      Position = 0
      SortType = stAlphabetic
      Width = 26
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 40
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Error n.'
      Options = [coCanClick, coCanInput, coCanSort, coFixedSize, coPublicUsing, coShowTextFitHint]
      Position = 1
      SortType = stAlphabetic
      Width = 40
    end
    object NxTextColumn1: TNxTextColumn
      DefaultWidth = 230
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Position'
      Options = [coCanClick, coCanInput, coCanSort, coFixedSize, coPublicUsing, coShowTextFitHint]
      Position = 2
      SortType = stAlphabetic
      Width = 230
    end
    object NxTextColumn3: TNxTextColumn
      DefaultWidth = 215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'Error'
      Options = [coAutoSize, coCanClick, coCanInput, coCanSort, coFixedSize, coPublicUsing, coShowTextFitHint]
      Position = 3
      SortType = stAlphabetic
      Width = 215
    end
  end
  object Spusti: TButton
    Left = 440
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = SpustiClick
  end
  object Zavriet: TButton
    Left = 352
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = ZavrietClick
  end
end
