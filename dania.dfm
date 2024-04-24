inherited DaniaForm: TDaniaForm
  Left = 390
  Top = 170
  Caption = 'DaniaForm'
  ClientHeight = 260
  ClientWidth = 625
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited MdDBGrid1: TMdDBGrid
    Width = 625
    Height = 231
  end
  inherited RxSplitter1: TRxSplitter
    Width = 625
  end
  inherited SpeedBar1: TSpeedBar
    Width = 625
    inherited Label1: TLabel
      Left = 100
      Width = 41
      Caption = '&Element:'
    end
    inherited Label2: TLabel
      Left = 367
      Width = 28
      Caption = '&Dieta:'
      FocusControl = nil
    end
    inherited CancelBtn: TBitBtn
      Left = 495
    end
    inherited OkBtn: TBitBtn
      Left = 562
    end
    inherited RxDBLookupCombo1: TRxDBLookupCombo
      Left = 566
    end
    inherited RxDBComboEdit1: TRxDBComboEdit
      Width = 217
      DataField = 'ELEMENT'
      DirectInput = False
      ButtonWidth = 25
      OnChange = RxDBComboEdit1Change
    end
    object ComboBox1: TComboBox [6]
      Left = 400
      Top = 4
      Width = 89
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 4
      Visible = False
      OnChange = ComboBox1Change
    end
    inherited BtnFilter: TSpeedItem
      Left = 50
    end
    inherited BtnSearch: TSpeedItem
      Left = 5
    end
    inherited BtnLink: TSpeedItem
      Left = 73
    end
    inherited BtnLicz: TSpeedItem
      Left = 96
      Top = 5
    end
    inherited BtnEdit: TSpeedItem
      Left = 27
    end
  end
end
