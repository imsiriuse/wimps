object OknoHlavicky: TOknoHlavicky
  Left = 257
  Top = 195
  BorderStyle = bsToolWindow
  Caption = 'Header'
  ClientHeight = 409
  ClientWidth = 461
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
  object Tabs: TPageControl
    Left = 0
    Top = 0
    Width = 461
    Height = 409
    ActivePage = TabSheet1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'Header'
      object Label11: TLabel
        Left = 328
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Observing places'
      end
      object DatumACas: TGroupBox
        Left = 0
        Top = 0
        Width = 289
        Height = 89
        Caption = 'Date and time'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 19
          Width = 77
          Height = 13
          Caption = 'Date (First night)'
        end
        object Label2: TLabel
          Left = 24
          Top = 56
          Width = 46
          Height = 13
          Caption = 'Start (UT)'
        end
        object Label3: TLabel
          Left = 160
          Top = 56
          Width = 43
          Height = 13
          Caption = 'End (UT)'
        end
        object Label13: TLabel
          Left = 108
          Top = 59
          Width = 3
          Height = 13
          Caption = ':'
        end
        object Label12: TLabel
          Left = 245
          Top = 59
          Width = 3
          Height = 13
          Caption = ':'
        end
        object EZaciatokH: TEdit
          Left = 88
          Top = 56
          Width = 19
          Height = 21
          MaxLength = 2
          TabOrder = 1
          OnChange = EZaciatokHChange
          OnKeyPress = EZaciatokHKeyPress
        end
        object EZaciatokM: TEdit
          Left = 112
          Top = 56
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 2
          OnChange = EZaciatokMChange
          OnKeyPress = EZaciatokMKeyPress
        end
        object EKoniecH: TEdit
          Left = 224
          Top = 56
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 3
          OnChange = EKoniecHChange
          OnKeyPress = EKoniecHKeyPress
        end
        object EKoniecM: TEdit
          Left = 249
          Top = 56
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 4
          OnChange = EKoniecMChange
          OnKeyPress = EKoniecMKeyPress
        end
        object EditDatum: TDateTimePicker
          Left = 104
          Top = 16
          Width = 153
          Height = 21
          Date = 0.526512037038628500
          Time = 0.526512037038628500
          TabOrder = 0
          OnChange = EditDatumChange
        end
      end
      object Miesta: TGroupBox
        Left = 0
        Top = 104
        Width = 289
        Height = 273
        Caption = 'Observing place'
        TabOrder = 1
        object Label4: TLabel
          Left = 112
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Coordinates'
        end
        object Label5: TLabel
          Left = 16
          Top = 32
          Width = 47
          Height = 13
          Caption = 'Longitude'
        end
        object Label6: TLabel
          Left = 16
          Top = 96
          Width = 41
          Height = 13
          Caption = 'Latitude '
        end
        object Label7: TLabel
          Left = 8
          Top = 240
          Width = 35
          Height = 13
          Caption = 'Altitude'
        end
        object Label8: TLabel
          Left = 8
          Top = 168
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object Label9: TLabel
          Left = 8
          Top = 216
          Width = 36
          Height = 13
          Caption = 'Country'
        end
        object Label10: TLabel
          Left = 8
          Top = 192
          Width = 47
          Height = 13
          Caption = 'IMO code'
        end
        object Label14: TLabel
          Left = 52
          Top = 56
          Width = 4
          Height = 13
          Caption = #176
        end
        object Label15: TLabel
          Left = 80
          Top = 56
          Width = 2
          Height = 13
          Caption = #39
        end
        object Label16: TLabel
          Left = 109
          Top = 56
          Width = 5
          Height = 13
          Caption = '"'
        end
        object Label17: TLabel
          Left = 52
          Top = 120
          Width = 4
          Height = 13
          Caption = #176
        end
        object Label18: TLabel
          Left = 80
          Top = 120
          Width = 2
          Height = 13
          Caption = #39
        end
        object Label19: TLabel
          Left = 109
          Top = 120
          Width = 5
          Height = 13
          Caption = '"'
        end
        object EditVyska: TEdit
          Left = 80
          Top = 240
          Width = 121
          Height = 21
          MaxLength = 4
          TabOrder = 11
          OnChange = EditVyskaChange
          OnKeyPress = EditVyskaKeyPress
        end
        object EditMiesto: TEdit
          Left = 80
          Top = 168
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 8
          OnChange = EditMiestoChange
          OnKeyPress = EditMiestoKeyPress
        end
        object EditStat: TEdit
          Left = 80
          Top = 216
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 10
          OnChange = EditStatChange
          OnKeyPress = EditStatKeyPress
        end
        object EditIMOKod: TEdit
          Left = 80
          Top = 192
          Width = 121
          Height = 21
          MaxLength = 5
          TabOrder = 9
          OnChange = EditIMOKodChange
          OnKeyPress = EditIMOKodKeyPress
        end
        object EDlzkaH: TEdit
          Left = 24
          Top = 56
          Width = 25
          Height = 21
          MaxLength = 3
          TabOrder = 0
          OnChange = EDlzkaHChange
          OnKeyPress = EDlzkaHKeyPress
        end
        object EDlzkaM: TEdit
          Left = 58
          Top = 56
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 1
          OnChange = EDlzkaMChange
          OnKeyPress = EDlzkaMKeyPress
        end
        object ESirkaM: TEdit
          Left = 58
          Top = 120
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 5
          OnChange = ESirkaMChange
          OnKeyPress = ESirkaMKeyPress
        end
        object ESirkaH: TEdit
          Left = 30
          Top = 120
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 4
          OnChange = ESirkaHChange
          OnKeyPress = ESirkaHKeyPress
        end
        object EDlzkaS1: TEdit
          Left = 86
          Top = 56
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 2
          OnChange = EDlzkaS1Change
          OnKeyPress = EDlzkaS1KeyPress
        end
        object ESirkaS1: TEdit
          Left = 86
          Top = 120
          Width = 20
          Height = 21
          MaxLength = 2
          TabOrder = 6
          OnChange = ESirkaS1Change
          OnKeyPress = ESirkaS1KeyPress
        end
        object EDlzkaP: TComboBox
          Left = 120
          Top = 56
          Width = 41
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnChange = ComboBox1Change
          Items.Strings = (
            'E'
            'W')
        end
        object ESirkaP: TComboBox
          Left = 120
          Top = 120
          Width = 41
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
          OnChange = ESirkaPChange
          Items.Strings = (
            'N'
            'S')
        end
      end
      object BtZmazat1: TButton
        Left = 296
        Top = 352
        Width = 75
        Height = 25
        Caption = 'Erase all'
        TabOrder = 2
        TabStop = False
        OnClick = BtZmazat1Click
      end
      object ZoznamMiest: TListBox
        Left = 296
        Top = 16
        Width = 153
        Height = 329
        TabStop = False
        ItemHeight = 13
        PopupMenu = PMenuSites
        TabOrder = 3
        OnDblClick = ZoznamMiestDblClick
      end
      object BtAdd1: TButton
        Left = 376
        Top = 352
        Width = 75
        Height = 25
        Caption = 'Add place'
        TabOrder = 4
        OnClick = BtAdd1Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Observers'
      ImageIndex = 2
      object Label22: TLabel
        Left = 352
        Top = 0
        Width = 48
        Height = 13
        Caption = 'Observers'
      end
      object ZoznamPozorovatelov: TListBox
        Left = 296
        Top = 16
        Width = 153
        Height = 329
        TabStop = False
        ItemHeight = 13
        PopupMenu = PmenuPozorovatelia
        TabOrder = 0
        OnDblClick = ZoznamPozorovatelovDblClick
      end
      object BtPridaj: TButton
        Left = 376
        Top = 352
        Width = 75
        Height = 25
        Caption = 'Add observer'
        TabOrder = 1
        OnClick = BtPridajClick
      end
      object BtZmazat: TButton
        Left = 296
        Top = 352
        Width = 75
        Height = 25
        Caption = 'Erase all'
        TabOrder = 2
        OnClick = BtZmazatClick
      end
      object ZapisovatelBox: TGroupBox
        Left = 0
        Top = 0
        Width = 289
        Height = 73
        Caption = 'Recorder'
        TabOrder = 3
        object Label24: TLabel
          Left = 8
          Top = 24
          Width = 204
          Height = 13
          Caption = 'IMO code    Name                         Surname'
        end
        object EMenoZapisovatela: TEdit
          Left = 64
          Top = 40
          Width = 97
          Height = 21
          TabOrder = 1
          OnChange = EMenoZapisovatelaChange
          OnKeyPress = EMenoZapisovatelaKeyPress
        end
        object EIMOkodZapisovatela: TEdit
          Left = 8
          Top = 40
          Width = 49
          Height = 21
          MaxLength = 5
          TabOrder = 0
          OnChange = EIMOkodZapisovatelaChange
          OnKeyPress = EIMOkodZapisovatelaKeyPress
        end
        object EPriezviskoZapisovatela: TEdit
          Left = 168
          Top = 40
          Width = 113
          Height = 21
          TabOrder = 2
          OnChange = EPriezviskoZapisovatelaChange
          OnKeyPress = EPriezviskoZapisovatelaKeyPress
        end
      end
      object PozorovateliaBox: TGroupBox
        Left = 0
        Top = 88
        Width = 289
        Height = 289
        Caption = 'Observers'
        TabOrder = 4
        object Pozorovatelia: TNextGrid
          Left = 2
          Top = 15
          Width = 285
          Height = 272
          Align = alClient
          Options = [goDisableColumnMoving, goGrid, goHeader, goRowMoving, goSelectFullRow]
          PopupMenu = PMenuTabulkaPozorovatelov
          TabOrder = 0
          TabStop = True
          OnAfterRowMove = PozorovateliaAfterRowMove
          OnEditAccept = PozorovateliaEditAccept
          object NxIncrementColumn2: TNxIncrementColumn
            DefaultWidth = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'N.'
            Options = [coCanClick, coCanInput, coPublicUsing]
            Position = 0
            SortType = stAlphabetic
            Width = 31
          end
          object NxTextColumn4: TNxTextColumn
            DefaultWidth = 50
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'IMO num.'
            Options = [coCanInput, coCanSort, coEditing, coPublicUsing, coShowTextFitHint]
            Position = 1
            SortType = stAlphabetic
            Width = 50
            MaxLength = 5
          end
          object NxTextColumn7: TNxTextColumn
            DefaultWidth = 54
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'IMO code'
            Options = [coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
            Position = 2
            SortType = stAlphabetic
            Width = 54
            MaxLength = 5
          end
          object NxTextColumn9: TNxTextColumn
            DefaultWidth = 65
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Name'
            Options = [coAutoSize, coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
            Position = 3
            SortType = stAlphabetic
            Width = 65
            MaxLength = 12
          end
          object NxTextColumn8: TNxTextColumn
            DefaultWidth = 83
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Surname'
            Options = [coAutoSize, coCanClick, coCanInput, coEditing, coPublicUsing, coShowTextFitHint]
            Position = 4
            SortType = stAlphabetic
            Width = 83
            MaxLength = 15
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Showers'
      ImageIndex = 1
      object Roje: TNextGrid
        Left = 0
        Top = 56
        Width = 448
        Height = 321
        HideScrollBar = False
        Options = [goDisableColumnMoving, goGrid, goHeader]
        PopupMenu = PMenuRoje
        TabOrder = 0
        TabStop = True
        WantReturns = True
        WantTabs = True
        OnEditAccept = RojeEditAccept
        object NxTextColumn3: TNxTextColumn
          DefaultWidth = 123
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Header.Caption = 'Shower'
          Options = [coCanClick, coCanInput, coFixedSize, coPublicUsing, coShowTextFitHint]
          Position = 0
          SortType = stAlphabetic
          Width = 123
        end
        object NxTextColumn2: TNxTextColumn
          DefaultWidth = 32
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Header.Caption = 'ID'
          Options = [coCanClick, coCanInput, coEditing, coFixedSize, coPublicUsing, coShowTextFitHint]
          Position = 1
          SortType = stAlphabetic
          Width = 32
          MaxLength = 1
        end
        object NxTextColumn1: TNxTextColumn
          DefaultWidth = 274
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Header.Caption = 'Rec.    Dec.    vel.        ZHR       IMO code'
          Options = [coCanClick, coFixedSize, coPublicUsing, coShowTextFitHint]
          Position = 2
          SortType = stAlphabetic
          Width = 274
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 49
        Caption = 'Add shower'
        TabOrder = 1
        object Label23: TLabel
          Left = 14
          Top = 19
          Width = 36
          Height = 13
          Caption = 'Shower'
        end
        object Label25: TLabel
          Left = 240
          Top = 19
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object BtAddShw: TButton
          Left = 328
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Add shower'
          TabOrder = 0
          OnClick = BtAddShwClick
        end
        object EZnak: TEdit
          Left = 264
          Top = 16
          Width = 17
          Height = 21
          MaxLength = 1
          TabOrder = 1
        end
        object BoxRoj: TComboBox
          Left = 72
          Top = 16
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
        end
      end
    end
  end
  object PMenuSites: TPopupMenu
    Left = 428
    Top = 411
    object Erase: TMenuItem
      Caption = 'Erase entry'
      OnClick = EraseClick
    end
  end
  object PmenuPozorovatelia: TPopupMenu
    Left = 396
    Top = 411
    object Priradizapisovatea1: TMenuItem
      Caption = 'Add recorder'
      OnClick = Priradizapisovatea1Click
    end
    object Zmazadaj1: TMenuItem
      Caption = 'Erase observer'
      OnClick = Zmazadaj1Click
    end
  end
  object PMenuTabulkaPozorovatelov: TPopupMenu
    Left = 364
    Top = 411
    object ZmazUdaj: TMenuItem
      Caption = 'Erase entry'
      OnClick = ZmazUdajClick
    end
    object Zmazvsetko1: TMenuItem
      Caption = 'Erase all'
      OnClick = Zmazvsetko1Click
    end
  end
  object PMenuRoje: TPopupMenu
    Left = 332
    Top = 411
    object Zmazudaj1: TMenuItem
      Caption = 'Erase entry'
      OnClick = Zmazudaj1Click
    end
    object Zmavetko1: TMenuItem
      Caption = 'Erase all'
      OnClick = Zmavetko1Click
    end
  end
end
