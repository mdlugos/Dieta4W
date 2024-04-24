object SzukamForm: TSzukamForm
  Left = 289
  Top = 132
  Width = 283
  Height = 300
  ActiveControl = MdDBGrid1
  Caption = 'Szukam'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clBlack
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000008888888800000000000000000000008800000000880000000000000
    0000008000088880000800000000000000000080000888800008000000000000
    0000008000007700000800000000000000000008800070000880000000000000
    0000000008807088800000000000000FF0FF000000007700000000000000000F
    F0FF000000088877000000000000000000000000000008877700000000000F7F
    7F7F7F777777000877000000000000000007F7F7F7F7F7000770000000000000
    00000F7F7F000F707F700000000000000000000000FFF0F7F700000000000000
    000000FFF004F07F7700000000000000000000F4000770777000000000000000
    0000007707000F777700777700000000000000000FFFF7777707888770000000
    0000000000F777707F088888770000000000000006F777700708888887000000
    00000006FF6FF7F00F708888870000000000000000F6FF6F07F7088807000000
    000000877600F000F07F70007000000000000077007767000007F7F700000000
    000000707777070000000000000000000000000777707F000000000000000000
    0000000F77077F00000000000000000000000000F7FFF0000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFF807FFFFE001FFFFC000FFFFC000FFFFC000FFFFE001FFE4F8
    07FFC07E0EFFC07C01FF8000017F000000FF000000FFFC00007FFF0000BFFF80
    017FFF80000FFF800007FFC00003FFF00001FF000001FFC00001FF000001FF80
    0003FF801407FF80160FFF801BFFFFC01FFFFFE03FFFFFF07FFFFFFFFFFF}
  Menu = RxMainMenu1
  OldCreateOrder = True
  Position = poDefault
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 275
    Height = 35
    Align = alBottom
    BorderWidth = 3
    TabOrder = 0
    object DBStatusLabel1: TDBStatusLabel
      Left = 144
      Top = 4
      Width = 127
      Height = 27
      DataSource = DataSource1
      ShowOptions = doGlyph
      Align = alRight
    end
    object DBStatusLabel2: TDBStatusLabel
      Left = 37
      Top = 4
      Width = 107
      Height = 27
      DataSource = DataSource1
      Style = lsRecordNo
      Align = alRight
    end
    object OkBtn: TBitBtn
      Left = 78
      Top = 5
      Width = 60
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object DBNavigator1: TDBNavigator
      Left = 142
      Top = 5
      Width = 120
      Height = 25
      DataSource = DataSource1
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 5
      Top = 5
      Width = 69
      Height = 25
      TabOrder = 2
      Kind = bkCancel
    end
  end
  object MdDBGrid1: TMdDBGrid
    Left = 0
    Top = 0
    Width = 275
    Height = 200
    Align = alClient
    BorderStyle = bsNone
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = EASTEUROPE_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = MdDBGrid1DblClick
    OnKeyPress = MdDBGrid1KeyPress
    ClearSelection = False
    MultiSelect = True
    TitleButtons = True
    OnMsgShow = MdDBGrid1MsgShow
    CanModify = True
    CanSearch = True
    CanUseFilter = True
    CanUseIndex = True
  end
  object DataSource1: TDataSource
    OnStateChange = DataSource1StateChange
    Left = 72
    Top = 32
  end
  object FormStorage1: TFormStorage
    IniFileName = '.\dieta4w.ini'
    StoredValues = <>
    Left = 159
    Top = 34
  end
  object RxMainMenu1: TRxMainMenu
    Tag = 1
    MinTextOffset = 18
    Style = msOwnerDraw
    ShowCheckMarks = False
    OnGetItemParams = RxMainMenu1GetItemParams
    Left = 200
    Top = 32
    object Edycja2: TMenuItem
      Caption = '&Edycja'
      GroupIndex = 3
      HelpContext = 2
      OnClick = MenuToolClick
      object Kopiuj1: TMenuItem
        Tag = 7
        Caption = '&Kopiuj'
        HelpContext = 2
        Hint = 'BtnKopiuj'
        ShortCut = 16451
        OnClick = MenuToolClick
      end
      object Wklej1: TMenuItem
        Tag = 9
        Caption = '&Wklej'
        HelpContext = 2
        Hint = 'BtnWklej'
        ShortCut = 16470
        OnClick = MenuToolClick
      end
      object Wytnij1: TMenuItem
        Tag = 8
        Caption = 'Wy&tnij'
        HelpContext = 2
        Hint = 'BtnWytnij'
        ShortCut = 16472
        OnClick = MenuToolClick
      end
      object Zaznaczwszystko1: TMenuItem
        Tag = 11
        Caption = 'Zaznacz wszystko'
        HelpContext = 2
        Hint = 'BtnSelectAll'
        ShortCut = 16449
        OnClick = MenuToolClick
      end
    end
  end
end
