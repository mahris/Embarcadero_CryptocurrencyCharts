object CryptocurrencyFrm: TCryptocurrencyFrm
  Left = 0
  Top = 0
  Caption = 'Cryptocurrency Charting Solutions'
  ClientHeight = 428
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 748
    Height = 387
    ActivePage = tsBTC
    Align = alClient
    TabOrder = 0
    object tsBTC: TTabSheet
      Caption = 'BTC'
      ImageIndex = 1
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 740
        Height = 359
        Title.Text.Strings = (
          'TDBChart')
        BottomAxis.LabelsAngle = 55
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 104
        ExplicitTop = 64
        ExplicitWidth = 400
        ExplicitHeight = 250
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          DataSource = ExchangeMemTable
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'Date'
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'USD_BTC'
        end
      end
    end
    object tsBTC_ETH: TTabSheet
      Caption = 'BTC & ETH'
      ImageIndex = 2
      object DBChart2: TDBChart
        Left = 0
        Top = 0
        Width = 740
        Height = 359
        Title.Text.Strings = (
          'TDBChart')
        Legend.Visible = False
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 120
        ExplicitTop = 40
        ExplicitWidth = 400
        ExplicitHeight = 250
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series2: TLineSeries
          DataSource = ExchangeMemTable
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'Date'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'USD_BTC'
        end
        object Series3: TLineSeries
          DataSource = ExchangeMemTable
          VertAxis = aRightAxis
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.DateTime = True
          XValues.Name = 'X'
          XValues.Order = loAscending
          XValues.ValueSource = 'Date'
          YValues.Name = 'Y'
          YValues.Order = loNone
          YValues.ValueSource = 'USD_ETH'
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 41
    Align = alTop
    TabOrder = 1
    object bnData: TButton
      Left = 32
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Data manipulation'
      TabOrder = 0
      OnClick = bnDataClick
    end
  end
  object ExchangeMemTable: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Date'
        DataType = ftDate
      end
      item
        Name = 'USD_BTC'
        DataType = ftFloat
      end
      item
        Name = 'USD_ETH'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'ExchangeMemTableIndex1'
        Fields = 'Date'
      end>
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'ExchangeMemTableIndex1'
        Fields = 'Date'
      end>
    IndexFieldNames = 'Date'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 624
    Top = 376
    Content = {
      414442530F006E1A72030000FF00010001FF02FF030400200000004500780063
      00680061006E00670065004D0065006D005400610062006C00650005000A0000
      005400610062006C006500060000000000070000080032000000090000FF0AFF
      0B040008000000440061007400650005000800000044006100740065000C0001
      0000000E000D000F000110000111000112000113000114000115000800000044
      00610074006500FEFF0B04000E0000005500530044005F004200540043000500
      0E0000005500530044005F004200540043000C00020000000E0016000F000110
      000111000112000113000114000115000E0000005500530044005F0042005400
      4300FEFF0B04000E0000005500530044005F0045005400480005000E00000055
      00530044005F004500540048000C00030000000E0016000F0001100001110001
      12000113000114000115000E0000005500530044005F00450054004800FEFEFF
      17FEFF18FEFF19FF1A1B00000000001D001C00FF1E000077420B000100B34467
      99E53BEC400200BCAE5FB00305A740FEFEFF1A1B00010000001D001C00FF1E00
      0059420B00010077137CD332AEEC400200EDB8E177A3BD9E40FEFEFF1A1B0002
      0000001D001C00FF1E00003A420B0001009A7D1EA3D93AE8400200E7559DD542
      899840FEFEFF1A1B00030000001D001C00FF1E00001E420B000100A30227DB91
      62E0400200F1B8A81661709540FEFEFF1A1B00040000001D001C00FF1E0000FF
      410B000100A9FB00A415ADDC4002005DA626C11BD08640FEFEFF1A1B00050000
      001D001C00FF1E0000E0410B00010057CC086F265CD2400200AED85F762F5682
      40FEFEFF1A1B00060000001D001C00FF1E0000C2410B000100BF61A241A8D8CA
      4002006C5A290432BD7840FEFEFF1A1B00070000001D001C00FF1E0000A3410B
      0001009B046F488DC0C4400200F4177AC468147640FEFEFF1A1B00080000001D
      001C00FF1E000085410B00010098141F9F5443C740020025766D6F77B27D40FE
      FEFF1A1B00090000001D001C00FF1E000066410B0001001FD61BB51612C74002
      00874D64E682397840FEFEFF1A1B000A0000001D001C00FF1E000047410B0001
      008690F3FEB50FC2400200F419506FC6E66C40FEFEFF1A1B000B0000001D001C
      00FF1E000029410B000100F41ABB4427DCC3400200B2632310AFE36E40FEFEFE
      FEFEFF1FFEFF2021003E000000FF22FEFEFE0E004D0061006E00610067006500
      72001E0055007000640061007400650073005200650067006900730074007200
      790012005400610062006C0065004C006900730074000A005400610062006C00
      650008004E0061006D006500140053006F0075007200630065004E0061006D00
      65000A0054006100620049004400240045006E0066006F007200630065004300
      6F006E00730074007200610069006E00740073001E004D0069006E0069006D00
      75006D0043006100700061006300690074007900180043006800650063006B00
      4E006F0074004E0075006C006C00140043006F006C0075006D006E004C006900
      730074000C0043006F006C0075006D006E00100053006F007500720063006500
      490044000C006400740044006100740065001000440061007400610054007900
      700065001400530065006100720063006800610062006C006500120041006C00
      6C006F0077004E0075006C006C000800420061007300650014004F0041006C00
      6C006F0077004E0075006C006C0012004F0049006E0055007000640061007400
      650010004F0049006E00570068006500720065001A004F007200690067006900
      6E0043006F006C004E0061006D00650010006400740044006F00750062006C00
      65001C0043006F006E00730074007200610069006E0074004C00690073007400
      100056006900650077004C006900730074000E0052006F0077004C0069007300
      7400060052006F0077000A0052006F0077004900440016007200730055006E00
      6300680061006E006700650064001A0052006F0077005000720069006F007200
      5300740061007400650010004F0072006900670069006E0061006C0018005200
      65006C006100740069006F006E004C006900730074001C005500700064006100
      7400650073004A006F00750072006E0061006C00120053006100760065005000
      6F0069006E0074000E004300680061006E00670065007300}
  end
end
