inherited sElementyForm: TsElementyForm
  Caption = 'sElementyForm'
  ClientWidth = 414
  PixelsPerInch = 96
  TextHeight = 13
  object PanelSu: TPanel [0]
    Left = 0
    Top = 26
    Width = 414
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    inherited CancelBtn: TBitBtn [4]
      Left = 279
      Top = 4
    end
    inherited OkBtn: TBitBtn [5]
      Left = 346
      Top = 4
    end
    object Label6: TLabel
      Left = 0
      Top = 3
      Width = 42
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Nazwa:'
      FocusControl = RxDBComboEdit3
    end
    object Label7: TLabel
      Left = 9
      Top = 27
      Width = 34
      Height = 22
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Mag:'
      FocusControl = RxDBComboEdit2
    end
    object Label8: TLabel
      Left = 107
      Top = 27
      Width = 16
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
    end
    object Label9: TLabel
      Left = 147
      Top = 27
      Width = 15
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = '='
    end
    object Label10: TLabel
      Left = 229
      Top = 27
      Width = 21
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Dla:'
      FocusControl = DBEdit10
    end
    object DBText1: TDBText
      Left = 280
      Top = 27
      Width = 129
      Height = 16
      DataField = 'JEDN'
      DataSource = DataSource2
    end
    object DBEdit8: TDBEdit
      Left = 160
      Top = 25
      Width = 30
      Height = 21
      DataField = 'PRZEL'
      DataSource = DataSource2
      TabOrder = 3
      OnEnter = EditEnter
    end
    object DBEdit9: TDBEdit
      Left = 193
      Top = 25
      Width = 31
      Height = 21
      DataField = 'JEDN'
      DataSource = DataSource2
      TabOrder = 4
      OnEnter = EditEnter
    end
    object DBEdit10: TDBEdit
      Left = 252
      Top = 25
      Width = 27
      Height = 21
      DataField = 'GRAM'
      DataSource = DataSource2
      TabOrder = 5
      OnEnter = EditEnter
    end
    object DBEdit7: TDBEdit
      Left = 119
      Top = 25
      Width = 31
      Height = 21
      DataField = 'JMAG'
      DataSource = DataSource2
      TabOrder = 2
      OnEnter = EditEnter
    end
    object RxDBComboEdit2: TRxDBComboEdit
      Left = 45
      Top = 25
      Width = 58
      Height = 20
      ButtonHint = 'Przegl�d kartoteki'
      DataField = 'INDX_MAT'
      DataSource = DataSource2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      ButtonWidth = 20
      NumGlyphs = 2
      TabOrder = 1
      OnButtonClick = RxDBComboEdit2ButtonClick
      OnEnter = EditEnter
    end
    object RxDBComboEdit3: TRxDBComboEdit
      Left = 45
      Top = 3
      Width = 364
      Height = 19
      ButtonHint = 'Przegl�d kartoteki'
      DataField = 'NAZWA'
      DataSource = DataSource2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      ButtonWidth = 20
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 2
      TabOrder = 0
      OnButtonClick = RxDBComboEdit2ButtonClick
      OnEnter = EditEnter
    end
  end
  inherited SpeedBar1: TSpeedBar [1]
    Width = 414
    inherited Label1: TLabel
      Left = 81
      Width = 47
      Caption = '&Surowiec:'
      Visible = True
    end
    inherited Label2: TLabel
      Left = 311
    end
    inherited RxDBComboEdit1: TRxDBComboEdit [2]
      Width = 281
      Visible = True
    end
    inherited RxDBLookupCombo1: TRxDBLookupCombo [3]
      Left = 289
      Width = 121
    end
  end
  inherited MdDBGrid1: TMdDBGrid [2]
    Top = 74
    Width = 414
    Height = 162
  end
  inherited RxSplitter1: TRxSplitter [3]
    Top = 71
    Width = 414
    ControlFirst = PanelSu
    Visible = True
  end
  inherited DataSource2: TDataSource
    Left = 216
  end
end
