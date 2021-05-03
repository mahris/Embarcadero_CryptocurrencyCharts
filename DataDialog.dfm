object DataDlg: TDataDlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cryptocurrency data'
  ClientHeight = 218
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 64
    Width = 345
    Height = 137
    Caption = 'Fill from network'
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 64
      Width = 30
      Height = 13
      Caption = 'Period'
    end
    object Label2: TLabel
      Left = 120
      Top = 64
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object bnFill: TButton
      Left = 14
      Top = 96
      Width = 113
      Height = 25
      Action = acFill
      TabOrder = 0
    end
    object edApiKey: TLabeledEdit
      Left = 120
      Top = 24
      Width = 201
      Height = 21
      EditLabel.Width = 104
      EditLabel.Height = 13
      EditLabel.Caption = 'api.coinlayer.com key'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '62ed3f8b122e5839ed7e2ab485586f10'
    end
    object cbPeriod: TComboBox
      Left = 50
      Top = 61
      Width = 54
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'year'
      Items.Strings = (
        'year'
        'month'
        'week')
    end
    object cbStep: TComboBox
      Left = 148
      Top = 61
      Width = 54
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'month'
      Items.Strings = (
        'month'
        'week'
        'days')
    end
    object edStep: TEdit
      Left = 207
      Top = 61
      Width = 18
      Height = 21
      TabOrder = 4
      Text = '1'
    end
    object udStep: TUpDown
      Left = 225
      Top = 61
      Width = 16
      Height = 21
      Associate = edStep
      Min = 1
      Max = 31
      Position = 1
      TabOrder = 5
    end
    object ProgressBar1: TProgressBar
      Left = 133
      Top = 100
      Width = 188
      Height = 17
      TabOrder = 6
    end
  end
  object bnSave: TButton
    Left = 176
    Top = 16
    Width = 113
    Height = 25
    Action = acSave
    TabOrder = 1
  end
  object bnLoad: TButton
    Left = 32
    Top = 16
    Width = 113
    Height = 25
    Action = acLoad
    TabOrder = 2
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 332
    Top = 158
    object acLoad: TAction
      Caption = 'Load from file'
      OnExecute = acLoadExecute
    end
    object acSave: TAction
      Caption = 'Save to file'
      OnExecute = acSaveExecute
    end
    object acFill: TAction
      Caption = 'Fill from network'
      OnExecute = acFillExecute
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML files|*.xml|All files|*.*'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 324
    Top = 102
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 320
    Top = 54
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 320
    Top = 6
  end
end
