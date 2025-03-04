object ChildForm: TChildForm
  Left = 467
  Top = 220
  ActiveControl = MdDBGrid1
  AutoScroll = False
  ClientHeight = 236
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000002222222000000000000000
    0000000222121213222200000000000000000022131131313131310000000000
    0000222131311311111311110000000000021213111111111111131100000000
    0001213111991919191911131000000000221311991991919191911110000000
    0121319919999999999911911100000002111111999999999991991911000000
    0131191999999999999991919100000013119199999999999999999919100000
    1111199999999999999999999110000011199199999999999999999999100000
    1191999999999999999999999110000011191999999999999999999999100000
    11919999999999999999393991100000191999999999999999399B9399100000
    01919999999999993999B9B9910000000119199911119993979B9B9B91000000
    0111919110111939737B79B91100000000111919010111973FBFB79910000000
    00011110000009397BBB7B310000000000000000020000199BBFB39100000000
    22220002202220019933911000000002222222222A02230119991000000000A2
    A2A2A2A2A20022200111000000000A2A2A2A2A20009002220000000000000000
    02A2A0000000000A20000000000000000000000000000000A200000000000000
    00000000000000000A220000000000000000000000000000000000000000FFFC
    07FFFFE000FFFFC0003FFF00000FFE000007FC000007FC000003F8000003F000
    0001F0000001F0000001E0000000E0000000E0000000E0000000E0000000E000
    0000E0000000F0000001F0000001F0000001F8000003FC000007F0000007C000
    000FC000001F8000007F000000FF800C03FFF87FC03FFFFFE07FFFFFF0FF}
  Menu = RxMainMenu1
  OldCreateOrder = True
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MdDBGrid1: TMdDBGrid
    Left = 0
    Top = 29
    Width = 403
    Height = 207
    Align = alClient
    BorderStyle = bsNone
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = MdDBGrid1DblClick
    OnEditButtonClick = MdDBGrid1EditButtonClick
    OnEnter = MdDBGrid1Enter
    OnKeyDown = MdDBGrid1KeyDown
    OnKeyPress = MdDBGrid1KeyPress
    IniStorage = FormStorage1
    MultiSelect = True
    OnMsgShow = MdDBGrid1MsgShow
    CanModify = True
    CanSearch = True
    CanUseFilter = True
    CanUseIndex = False
  end
  object RxSplitter1: TRxSplitter
    Left = 0
    Top = 26
    Width = 403
    Height = 3
    ControlSecond = MdDBGrid1
    Align = alTop
    Visible = False
  end
  object SpeedBar1: TSpeedBar
    Left = 0
    Top = 0
    Width = 403
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = []
    BtnOffsetHorz = 4
    BtnOffsetVert = 4
    BtnWidth = 19
    BtnHeight = 19
    BevelOuter = bvNone
    TabOrder = 2
    InternalVer = 1
    object Label1: TLabel
      Left = 138
      Top = 8
      Width = 3
      Height = 13
      Alignment = taRightJustify
      FocusControl = RxDBComboEdit1
      Visible = False
    end
    object Label2: TLabel
      Left = 302
      Top = 8
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '&Posi³ek:'
      FocusControl = RxDBLookupCombo1
      Visible = False
    end
    object CancelBtn: TBitBtn
      Left = 273
      Top = 3
      Width = 61
      Height = 20
      Anchors = [akTop, akRight]
      TabOrder = 2
      Visible = False
      Kind = bkCancel
    end
    object OkBtn: TBitBtn
      Left = 340
      Top = 3
      Width = 61
      Height = 20
      Anchors = [akTop, akRight]
      TabOrder = 3
      Visible = False
      Kind = bkOK
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 344
      Top = 4
      Width = 59
      Height = 20
      DropDownCount = 8
      EscapeClear = False
      DataSource = DataSource2
      Anchors = [akTop, akRight]
      IndexSwitch = False
      LookupField = 'Posilek'
      LookupDisplay = 'Posilek;Opis'
      LookupDisplayIndex = 1
      TabOrder = 1
      Visible = False
      OnEnter = EditEnter
    end
    object RxDBComboEdit1: TRxDBComboEdit
      Left = 144
      Top = 4
      Width = 145
      Height = 20
      ButtonHint = 'Przegl¹danie'
      DataField = 'Data'
      DataSource = DataSource2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333888003000003333
        300088F888883F333888E00BFBFB033333338883333F8F33333FE0BFBF000333
        330088F3338883F33388E0FBFBFBF033330088F3333FF8FFF388E0BFBF000000
        333388F3338888883F3FE0FBFBFBFBFB039988F33FFFFFFF8388E0BF00000000
        339988FF888888883388000BFB03333333338883FF833333333F333000333333
        3300333888333333338833333333333333003333333333333388333333333333
        333333333333333333FF33333333333330003333333333333888333333333333
        3000333333333333388833333333333333333333333333333333}
      ButtonWidth = 20
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 2
      TabOrder = 0
      Visible = False
      OnButtonClick = RxDBComboEdit1ButtonClick
      OnEnter = EditEnter
    end
    object SpeedbarSection2: TSpeedbarSection
      Caption = 'Untitled (0)'
    end
    object SpeedbarSection3: TSpeedbarSection
      Caption = 'Untitled (1)'
    end
    object SpeedbarSection1: TSpeedbarSection
      Caption = 'Child'
    end
    object BtnSearch: TSpeedItem
      AllowAllUp = True
      BtnCaption = 'Wyszukiwanie'#13#10'F3'
      Caption = 'Wyszukiwanie'
      GroupIndex = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333883888333333333C33
        3000333FF33338F33888339933333C3333333388F33338F3333F339933333C33
        33003388333338F33388333333333C333300333F333338F33388339333333C33
        3333338FF3333833333F33993333C33333003388FF33833333883339933C3333
        330033388FF83F33338833339933C33333333FF388F383F3333F993399333C33
        330088F388F338F33388993399333C33330088FF883338F33388399993333C33
        33333888833338F333FF333333333C33300033333333383FF8883333333333CC
        3000333333333388388833333333333333333333333333333333}
      Hint = 'Wyszukiwanie'#13#10'F3'
      NumGlyphs = 2
      Spacing = 1
      Left = 4
      Top = 4
      Visible = True
      OnClick = BtnSearcClick
      SectionName = 'Child'
    end
    object BtnFilter: TSpeedItem
      AllowAllUp = True
      BtnCaption = 'Filtruj'#13#10'F9, Ctrl+F'
      Caption = 'Filtruj'
      GroupIndex = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333388888F33FFFFFFFF09
        990F33333333338F338F333FFFFFFF09990F33333333338F338F3333FFFFFF09
        990F33333333338FFF8F33333FFFFF00000F3333333333888883333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF88888F3333338FF30EEE0333FFF0
        00FF8F338FFF333888FF0EEE00033F00000F8F33888F3888888F0EEE0E033000
        00008FFF8F8FF888888800000E00033000FF888883888F3888F3330EEE0E0330
        00FF338FFF8F8F3888F33300000E033000FF338888838F38883333330EEE0300
        03FF33338FFF88888333333300000333333F3333888883333333}
      Hint = 'Filtruj'#13#10'F9, Ctrl+F'
      NumGlyphs = 2
      Spacing = 1
      Left = 41
      Top = 4
      Visible = True
      OnClick = BtnFilteClick
      OnMouseUp = BtnFilteMouseUp
      SectionName = 'Child'
    end
    object BtnLink: TSpeedItem
      AllowAllUp = True
      BtnCaption = '£¹cz okna'#13#10'F6'
      Caption = '£¹cz okna'
      GroupIndex = 4
      Glyph.Data = {
        76020000424D7602000000000000760000002800000040000000100000000100
        0400000000000002000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300033300000
        00003888FF388888888830003330000000003888FF388888888808080330FFFF
        FFF088888F38F3FF3FF808080330FFFFFFF088888F38F3FF3FF808380330F00F
        00F088F88F38F883883808380330F00F00F088F88F38F883883808380330FFFF
        FFF088F88F38F3FFFF3808380330FFFFFFF088F88F38F3FFFF3808080330F000
        0FF088888338F888833808080330F0000FF088888338F888833830003330FFFF
        FFF038883338F3FF3FF830003330FFFFFFF038883338F3FF3FF833033330F00F
        0000338FFF38F883888833033330F00F0000338FFF38F883888833000330FFFF
        0FF033888338F3FF8F3833000330FFFF0FF033888FF8F3FF8F3833008330F07F
        0F0333888338F8838F8333008030F07F0F03338888F8F8838F8330803300FFFF
        003338883388FFFF883330803800FFFF003338883888FFFF8833308333800000
        0333388F338888888FFF3083338000000333388FF38888888FFF330330803330
        000333833888FF38888F33083080333000033388F888FF38888F333388000308
        8880333388888F8888883330880003088880333888888F888888333300330000
        3300333388338888FF883333003300003300333388338888FF88333333333308
        8880333333333388888833333333330888803333333333888888333333333330
        0003333333333338888333333333333000033333333333388883}
      Hint = '£¹cz okna'#13#10'F6'
      NumGlyphs = 4
      Spacing = 1
      Left = 59
      Top = 4
      Visible = True
      OnClick = BtnLinClick
      SectionName = 'Child'
    end
    object BtnLicz: TSpeedItem
      AllowAllUp = True
      BtnCaption = 'Licz...'#13#10'F7'
      Caption = 'Licz...'
      Glyph.Data = {
        76020000424D7602000000000000760000002800000040000000100000000100
        0400000000000002000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333338FF333333333333303333333333333338FF333333333333000333
        3333333333888F3333333333330003333333333333888F333333333333070333
        3333333333888F3333333333330803333333333F33888FF33F33333333000333
        3333333333888F33333333B33B000B33B3333383F888883F83333333330F0333
        33333333338F8F333333333BBB0B0BBB33333338838F8F88F3333333330F0333
        33333333338383F33333333BBB0F0BBB33333338338383F83F33333330F8F033
        333333333838F83F333333BBB0F8F0BBB333338F3838F83F8F3333330FF8FF03
        333333338F38F38F333333BB0FB8BF0BB3333F838F38F38F83FF33330FF8FF03
        333333338F38338F3333BBBB0BF8FB0BBBB3883F8F38338F388333330FFFFF03
        3333333383F33383333333BB0FBFBF0BB333338F83F333838F33333330FFF033
        33333333383FF833333333BBB0FBF0BBB3333383F83FF8338333333333000333
        33333333338883333333333BBB000BBB33333338FF888338F333333333333333
        33333333333333333333333BBBBBBBBB3333333883FF3F883F33333333333333
        3333333333333333333333B33BBBBB33B3333383388388338333333333333333
        333333333333333333333333333B3333333333333338F3333333333333333333
        333333333333333333333333333B333333333333333833333333}
      Hint = 'Licz...'#13#10'F7'
      NumGlyphs = 4
      Spacing = 1
      Left = 78
      Top = 4
      SectionName = 'Child'
    end
    object BtnEdit: TSpeedItem
      AllowAllUp = True
      BtnCaption = 'Zezwól na edycjê'#13#10'F4'
      Caption = 'Zezwól na edycjê'
      GroupIndex = 2
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333388888888883333330FFFFFFFF03FF3FF8FF33F3FF800300000FF0F
        00F088F888883F838838E00BFBFB0FFFFFF08883333F8F3333F8E0BFBF000FFF
        F0F088F3338883F3F838E0FBFBFBF0F00FF088F3333FF8F88F38E0BFBF00000B
        0FF088F3338888838338E0FBFBFBFBF0FFF088F33FFFFFF83338E0BF0000000F
        FFF088FF888888833FF8000BFB00B0FF00F08883FF88383388383330000B0FFF
        FFF03338888383333FF8333330B0FFFF00003333383833FF888833330B0FF00F
        0FF03333838F38838F383330B00FFFFF0F033338F88F33338F833309030FFFFF
        00333388838FFFFF883333303300000003333338338888888333}
      Hint = 'Zezwól na edycjê'#13#10'F4'
      NumGlyphs = 2
      Spacing = 1
      Left = 22
      Top = 4
      Visible = True
      OnClick = BtnEdiClick
      SectionName = 'Child'
    end
  end
  object FormStorage1: TFormStorage
    Options = [fpPosition]
    OnSavePlacement = FormStorage1SavePlacement
    OnRestorePlacement = FormStorage1RestorePlacement
    StoredProps.Strings = (
      'BtnEdit.Down'
      'BtnSearch.Down'
      'BtnFilter.Down')
    StoredValues = <
      item
        Name = 'Filter'
        Value = ''
      end>
    Left = 208
    Top = 176
  end
  object DataSource1: TDataSource
    OnStateChange = DataSource1StateChange
    OnDataChange = DataSource1DataChange
    Left = 96
    Top = 176
  end
  object DataSource2: TDataSource
    Left = 208
    Top = 11
  end
  object RxMainMenu1: TRxMainMenu
    Tag = 1
    MinTextOffset = 18
    Style = msOwnerDraw
    ShowCheckMarks = False
    OnGetItemParams = RxMainMenu1GetItemParams
    Left = 256
    Top = 176
    object Przyciski1: TMenuItem
      Caption = 'Przy&ciski'
      GroupIndex = 2
      HelpContext = 3
      OnClick = Przyciski1Click
      object Filtruj1: TMenuItem
        Tag = 3
        Caption = 'Filtruj'
        HelpContext = 3
        Hint = 'BtnFilter'
        ShortCut = 120
        OnClick = MenuToolClick
      end
      object Wyrfiltra1: TMenuItem
        Tag = 3
        Caption = 'Wyra¿enie filtra...'
        HelpContext = 3
        Hint = 'BtnFilter'
        ShortCut = 16454
        OnClick = Wyrfiltra1Click
      end
      object Lcz1: TMenuItem
        Tag = 4
        Caption = 'L¹cz'
        HelpContext = 3
        Hint = 'BtnLink'
        ShortCut = 117
        OnClick = MenuToolClick
      end
      object Wyszukiwanie1: TMenuItem
        Tag = 1
        Caption = 'Wyszukiwanie'
        HelpContext = 3
        Hint = 'BtnSearch'
        ShortCut = 114
        OnClick = MenuToolClick
      end
      object Edytowalny1: TMenuItem
        Tag = 2
        Caption = 'Edytowalny'
        HelpContext = 3
        Hint = 'BtnEdit'
        ShortCut = 115
        OnClick = MenuToolClick
      end
      object Liczzapotrzebowanie1: TMenuItem
        Tag = 5
        Caption = 'Licz...'
        HelpContext = 3
        Hint = 'BtnLicz'
        ShortCut = 118
        OnClick = MenuToolClick
      end
    end
    object Edycja2: TMenuItem
      Caption = '&Edycja'
      GroupIndex = 3
      HelpContext = 2
      object Kopiuj1: TMenuItem
        Tag = 6
        Caption = '&Kopiuj'
        HelpContext = 2
        Hint = 'BtnKopiuj'
        ShortCut = 16451
        OnClick = MenuToolClick
      end
      object Wklej1: TMenuItem
        Tag = 8
        Caption = '&Wklej'
        HelpContext = 2
        Hint = 'BtnWklej'
        ShortCut = 16470
        OnClick = MenuToolClick
      end
      object Wytnij1: TMenuItem
        Tag = 7
        Caption = 'Wy&tnij'
        HelpContext = 2
        Hint = 'BtnWytnij'
        ShortCut = 16472
        OnClick = MenuToolClick
      end
      object Zaznaczwszystko1: TMenuItem
        Tag = 10
        Caption = '&Zaznacz wszystko'
        HelpContext = 2
        Hint = 'BtnSelectAll'
        ShortCut = 16449
        OnClick = MenuToolClick
      end
      object Kalkulator1: TMenuItem
        Tag = 11
        Caption = 'Kalkulato&r'
        HelpContext = 2
        Hint = 'BtnKalkul'
        ShortCut = 16459
        OnClick = MenuToolClick
      end
      object Ponumeruj1: TMenuItem
        Tag = 12
        Caption = 'Ponumeruj'
        HelpContext = 2
        Hint = 'BtnRenumber'
        OnClick = MenuToolClick
      end
    end
  end
end
