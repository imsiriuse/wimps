object OknoStatistiky: TOknoStatistiky
  Left = 255
  Top = 197
  Width = 623
  Height = 500
  VertScrollBar.Smooth = True
  VertScrollBar.Tracking = True
  Caption = #352'tatistika'
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 615
    Height = 465
    ActivePage = IMO
    Align = alTop
    TabOrder = 0
    object Sumarne: TTabSheet
      Caption = 'Summary report'
      OnShow = SumarneShow
      object Hlavicka: TGroupBox
        Left = 0
        Top = 0
        Width = 545
        Height = 129
        Caption = 'Header'
        TabOrder = 0
        object Datum: TLabel
          Left = 8
          Top = 16
          Width = 29
          Height = 13
          Caption = 'Date: '
        end
        object Zaciatok: TLabel
          Left = 144
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Start:'
        end
        object Koniec: TLabel
          Left = 264
          Top = 16
          Width = 25
          Height = 13
          Caption = 'End: '
        end
        object Label1: TLabel
          Left = 8
          Top = 48
          Width = 77
          Height = 13
          Caption = 'Observing place'
        end
        object Meno: TLabel
          Left = 8
          Top = 64
          Width = 34
          Height = 13
          Caption = 'Name: '
        end
        object Stat: TLabel
          Left = 232
          Top = 64
          Width = 42
          Height = 13
          Caption = 'Country: '
        end
        object KodMiesta: TLabel
          Left = 416
          Top = 64
          Width = 53
          Height = 13
          Caption = 'IMO code: '
        end
        object Label5: TLabel
          Left = 8
          Top = 88
          Width = 59
          Height = 13
          Caption = 'Coordinates:'
        end
        object dlzka: TLabel
          Left = 8
          Top = 104
          Width = 53
          Height = 13
          Caption = 'Longitude: '
        end
        object sirka: TLabel
          Left = 216
          Top = 104
          Width = 44
          Height = 13
          Caption = 'Latitude: '
        end
        object vyska: TLabel
          Left = 400
          Top = 104
          Width = 41
          Height = 13
          Caption = 'Altitude: '
        end
      end
      object Roje: TGroupBox
        Left = 0
        Top = 375
        Width = 545
        Height = 0
        Caption = 'Showers'
        TabOrder = 1
      end
      object Info: TGroupBox
        Left = 0
        Top = 136
        Width = 545
        Height = 193
        Caption = 'Report'
        TabOrder = 2
        object LabelZHR: TLabel
          Left = 8
          Top = 24
          Width = 90
          Height = 13
          Caption = 'Zenital hourly rate: '
        end
        object LabelLimitna: TLabel
          Left = 8
          Top = 144
          Width = 118
          Height = 13
          Caption = 'Average limit magnitude: '
        end
        object LabelRojove: TLabel
          Left = 8
          Top = 96
          Width = 92
          Height = 13
          Caption = 'Number of meteors:'
        end
        object LabelSporadicke: TLabel
          Left = 8
          Top = 120
          Width = 138
          Height = 13
          Caption = 'Number of sporadic meteors: '
        end
        object LabelMraky: TLabel
          Left = 8
          Top = 168
          Width = 80
          Height = 13
          Caption = 'Average clouds: '
        end
        object LabelTeff: TLabel
          Left = 8
          Top = 72
          Width = 128
          Height = 13
          Caption = 'Effective observation time: '
        end
        object LabelSporZHR: TLabel
          Left = 8
          Top = 48
          Width = 133
          Height = 13
          Caption = 'Sporadic zenital hourly rate: '
        end
      end
      object RastZHRGroup: TGroupBox
        Left = 0
        Top = 0
        Width = 545
        Height = 0
        Caption = 'ZHR graph'
        TabOrder = 3
        Visible = False
      end
      object LimitkyGroup: TGroupBox
        Left = 0
        Top = 0
        Width = 545
        Height = 0
        Caption = 'Limit magnitudes'
        TabOrder = 4
        Visible = False
      end
      object FrekvenciaZHR: TGroupBox
        Left = 0
        Top = 0
        Width = 545
        Height = 0
        Caption = 'Minute frequency of meteors'
        TabOrder = 5
        Visible = False
      end
      object PocetMeteorov: TGroupBox
        Left = 0
        Top = 0
        Width = 545
        Height = 0
        Caption = 'Number of meteors'
        TabOrder = 6
        Visible = False
        object Label8: TLabel
          Left = 256
          Top = 8
          Width = 144
          Height = 13
          Caption = 'Comparison of shower meteors'
        end
        object Label12: TLabel
          Left = 272
          Top = 24
          Width = 188
          Height = 13
          Caption = 'Comparison number of sporadic meteors'
        end
      end
      object Zapisovatel: TGroupBox
        Left = 0
        Top = 336
        Width = 545
        Height = 97
        Caption = 'Recorder'
        TabOrder = 7
        object Label2: TLabel
          Left = 8
          Top = 16
          Width = 34
          Height = 13
          Caption = 'Name: '
        end
        object Label9: TLabel
          Left = 8
          Top = 40
          Width = 89
          Height = 13
          Caption = 'Number of entries: '
        end
        object Label10: TLabel
          Left = 8
          Top = 56
          Width = 125
          Height = 13
          Caption = 'Max. frequency of entries: '
        end
        object Label11: TLabel
          Left = 8
          Top = 72
          Width = 104
          Height = 13
          Caption = 'Number of observers: '
        end
      end
      object Prestavky: TGroupBox
        Left = 0
        Top = 120
        Width = 545
        Height = 0
        Caption = 'Effective observation time'
        TabOrder = 8
        Visible = False
        object Label4: TLabel
          Left = 240
          Top = -8
          Width = 183
          Height = 13
          Caption = 'Comparison of average teff and breaks'
        end
        object Label7: TLabel
          Left = 248
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Comparison of teff'
        end
      end
    end
    object IMO: TTabSheet
      Caption = 'IMO form'
      ImageIndex = 2
      OnShow = IMOShow
      object IMOTabs: TTabControl
        Left = 0
        Top = 0
        Width = 607
        Height = 437
        Align = alClient
        TabOrder = 0
        OnChange = IMOTabsChange
        object FName: TLabel
          Left = 8
          Top = 40
          Width = 54
          Height = 13
          Caption = 'First name: '
        end
        object SName: TLabel
          Left = 176
          Top = 40
          Width = 64
          Height = 13
          Caption = 'Family name: '
        end
        object Country: TLabel
          Left = 8
          Top = 56
          Width = 39
          Height = 13
          Caption = 'Country:'
        end
        object Label13: TLabel
          Left = 8
          Top = 24
          Width = 76
          Height = 13
          Caption = 'Observer details'
        end
        object IMOkod: TLabel
          Left = 176
          Top = 56
          Width = 66
          Height = 13
          Caption = 'IMO Number: '
        end
        object Label15: TLabel
          Left = 8
          Top = 104
          Width = 88
          Height = 13
          Caption = 'Observing location'
        end
        object Longitude: TLabel
          Left = 8
          Top = 120
          Width = 50
          Height = 13
          Caption = 'Longitude:'
        end
        object Latitude: TLabel
          Left = 184
          Top = 120
          Width = 44
          Height = 13
          Caption = 'Latitude: '
        end
        object NadmVyska: TLabel
          Left = 328
          Top = 120
          Width = 34
          Height = 13
          Caption = 'Height:'
        end
        object MenoMiesta: TLabel
          Left = 8
          Top = 136
          Width = 31
          Height = 13
          Caption = 'Name:'
        end
        object MiestoStat: TLabel
          Left = 184
          Top = 136
          Width = 39
          Height = 13
          Caption = 'Country:'
        end
        object IMOKodMiesta: TLabel
          Left = 328
          Top = 136
          Width = 51
          Height = 13
          Caption = 'IMO Code:'
        end
        object Label18: TLabel
          Left = 8
          Top = 176
          Width = 29
          Height = 13
          Caption = 'Date: '
        end
        object TimeBegin: TLabel
          Left = 8
          Top = 192
          Width = 168
          Height = 13
          Caption = 'Observation begin (Universal Time):'
        end
        object TimeEnd: TLabel
          Left = 8
          Top = 208
          Width = 160
          Height = 13
          Caption = 'Observation end (Universal Time):'
        end
        object Label6: TLabel
          Left = 8
          Top = 240
          Width = 88
          Height = 13
          Caption = 'Observed showers'
        end
        object IMOSkratka: TLabel
          Left = 360
          Top = 40
          Width = 54
          Height = 13
          Caption = 'IMO Code: '
        end
        object ShowerGrid: TNextGrid
          Left = 8
          Top = 256
          Width = 126
          Height = 25
          Options = [goDisableColumnMoving, goGrid, goHeader]
          ReadOnly = True
          TabOrder = 0
          TabStop = True
          object NxTextColumn1: TNxTextColumn
            DefaultWidth = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Shower'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 0
            SortType = stAlphabetic
            Width = 40
          end
          object NxTextColumn2: TNxTextColumn
            DefaultWidth = 42
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'R.A'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 1
            SortType = stAlphabetic
            Width = 42
          end
          object NxTextColumn3: TNxTextColumn
            DefaultWidth = 42
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Dec'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 2
            SortType = stAlphabetic
            Width = 42
          end
        end
        object PeriodsGrid: TNextGrid
          Left = 8
          Top = 288
          Width = 257
          Height = 25
          Options = [goDisableColumnMoving, goGrid, goHeader]
          ReadOnly = True
          TabOrder = 1
          TabStop = True
          object NxTextColumn4: TNxTextColumn
            DefaultWidth = 70
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Period'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 0
            SortType = stAlphabetic
            Width = 70
          end
          object NxTextColumn5: TNxTextColumn
            DefaultWidth = 35
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'R.A'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 1
            SortType = stAlphabetic
            Width = 35
          end
          object NxTextColumn6: TNxTextColumn
            DefaultWidth = 35
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Dec'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 2
            SortType = stAlphabetic
            Width = 35
          end
          object NxTextColumn7: TNxTextColumn
            DefaultWidth = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Teff'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 3
            SortType = stAlphabetic
            Width = 40
          end
          object NxTextColumn8: TNxTextColumn
            DefaultWidth = 35
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'F'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 4
            SortType = stAlphabetic
            Width = 35
          end
          object NxTextColumn9: TNxTextColumn
            DefaultWidth = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Lm'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 5
            SortType = stAlphabetic
            Width = 40
          end
        end
        object MagnitudeDistributionsGrid: TNextGrid
          Left = 8
          Top = 320
          Width = 572
          Height = 25
          Options = [goDisableColumnMoving, goGrid, goHeader]
          ReadOnly = True
          TabOrder = 2
          TabStop = True
          object NxTextColumn12: TNxTextColumn
            DefaultWidth = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Shower'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 0
            SortType = stAlphabetic
            Width = 40
          end
          object NxTextColumn11: TNxTextColumn
            DefaultWidth = 70
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'Period'
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 1
            SortType = stAlphabetic
            Width = 70
          end
          object NxTextColumn17: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '-6'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 2
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn13: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '-5'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 3
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn14: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '-4'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 4
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn15: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '-3'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 5
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn16: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '-2'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 6
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn18: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '-1'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 7
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn19: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '0'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 8
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn20: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+1'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 9
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn21: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+2'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 10
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn22: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+3'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 11
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn23: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+4'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 12
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn24: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+5'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 13
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn25: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+6'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 14
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn27: TNxTextColumn
            DefaultWidth = 30
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = '+7'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 15
            SortType = stAlphabetic
            Width = 30
          end
          object NxTextColumn26: TNxTextColumn
            DefaultWidth = 40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Header.Caption = 'TOT'
            Header.Alignment = taCenter
            Options = [coDisableMoving, coFixedSize, coPublicUsing, coShowTextFitHint]
            Position = 16
            SortType = stAlphabetic
            Width = 40
          end
        end
      end
    end
  end
end