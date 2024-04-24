inherited dSurowceForm: TdSurowceForm
  Left = 362
  Top = 104
  Caption = 'dSurowceForm'
  ClientHeight = 279
  ClientWidth = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited MdDBGrid1: TMdDBGrid
    Top = 100
    Width = 474
    Height = 179
  end
  inherited RxSplitter1: TRxSplitter
    Top = 97
    Width = 474
    ControlFirst = PanelDa
    Visible = True
  end
  object PanelDa: TPanel [2]
    Left = 0
    Top = 26
    Width = 474
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label3: TLabel
      Left = 74
      Top = 22
      Width = 31
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Jedn:'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 141
      Top = 22
      Width = 31
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Die&ta:'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 0
      Top = 45
      Width = 42
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = '&Uwagi:'
      FocusControl = DBMemo1
    end
    object Label6: TLabel
      Left = 5
      Top = 0
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = '&Nazwa:'
      FocusControl = DBEdit1
    end
    object Label7: TLabel
      Left = 13
      Top = 24
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = '&Gram:'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 45
      Top = 1
      Width = 425
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAZWA'
      DataSource = DataSource2
      TabOrder = 0
      OnEnter = EditEnter
    end
    object DBEdit2: TDBEdit
      Left = 45
      Top = 23
      Width = 30
      Height = 21
      DataField = 'GRAMATURA'
      DataSource = DataSource2
      TabOrder = 1
      OnEnter = EditEnter
    end
    object DBEdit3: TDBEdit
      Left = 107
      Top = 23
      Width = 30
      Height = 21
      DataField = 'JEDN'
      DataSource = DataSource2
      TabOrder = 2
      OnEnter = EditEnter
    end
    object DBEdit4: TDBEdit
      Left = 174
      Top = 23
      Width = 30
      Height = 21
      DataField = 'DIETA'
      DataSource = DataSource2
      TabOrder = 3
      OnEnter = EditEnter
    end
    object DBMemo1: TDBMemo
      Left = 45
      Top = 46
      Width = 425
      Height = 21
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'OPIS'
      DataSource = DataSource2
      TabOrder = 4
      OnEnter = EditEnter
    end
  end
  inherited SpeedBar1: TSpeedBar
    Width = 474
    inherited Label1: TLabel
      Left = 109
      Width = 32
      Caption = 'Label1'
    end
    inherited CancelBtn: TBitBtn
      Left = 342
    end
    inherited OkBtn: TBitBtn
      Left = 409
    end
    inherited RxDBLookupCombo1: TRxDBLookupCombo
      Left = 345
      Width = 60
    end
    inherited RxDBComboEdit1: TRxDBComboEdit
      Width = 153
    end
    inherited BtnEdit: TSpeedItem [12]
    end
    inherited BtnLicz: TSpeedItem [13]
      Hint = 'Licz danie...'#13#10'F7'
      Visible = True
      OnClick = BtnLiczDanieClick
    end
  end
  inherited DataSource2: TDataSource
    OnDataChange = LiczDanieDataChange
    Left = 184
    Top = 19
  end
end
