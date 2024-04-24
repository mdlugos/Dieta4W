object MemoForm1: TMemoForm1
  Left = 263
  Top = 115
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ActiveControl = OKBtn
  AutoScroll = False
  ClientHeight = 199
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000007777770000000000000000
    0000000000000007000000000000000000000000000000070000000000000000
    0000000000777007000000000000000000077070007770070000700000000000
    0077000700787000000007000000000007708000077877000070007000000000
    07088807777777770777000700000000008F88877FFFFF077887700700000000
    00088888F88888FF08870070000000000000880888877778F070007000000007
    77088888880007778F770077777000700008F088007777077F07000000700700
    008F08880800077778F7700000700708888F0880F08F807078F7777700700708
    F88F0780F070F07078F7887700700708888F0780F077807088F7777700700700
    008F0788FF00080888F77000007000000008F0780FFFF0088F77007000000000
    0008F07788000888887700700000000000008F07788888880870007000000000
    00088FF0077788088887000700000000008F888FF00000F87887700700000000
    0708F8088FFFFF88078700700000000007708000088888000070070000000000
    0077007000888007000070000000000000077700008F80070007000000000000
    0000000000888007000000000000000000000000000000070000000000000000
    000000000777777700000000000000000000000000000000000000000000FFFF
    FFFFFFFC0FFFFFFC0FFFFFF80FFFFFF80FFFFE180E7FFC00043FF800001FF800
    000FF800000FFC00001FFE00001FE0000001C000000180000001800000018000
    00018000000180000001FC00001FFC00001FFE00001FFC00000FF800000FF800
    001FF800003FFC180C7FFE380EFFFFF80FFFFFF80FFFFFF80FFFFFFFFFFF}
  OldCreateOrder = True
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 318
    Height = 158
    Align = alClient
    BorderStyle = bsNone
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 117
      Height = 26
      Caption = '&Import kosztów ¿ywienia od dnia:'
      FocusControl = DateTimePicker1
      WordWrap = True
    end
    object DateTimePicker1: TDateTimePicker
      Left = 128
      Top = 13
      Width = 89
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CalAlignment = dtaLeft
      Date = 37325.6803341435
      Time = 37325.6803341435
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object OKBtn: TBitBtn
      Left = 224
      Top = 7
      Width = 86
      Height = 28
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = OKBtnClick
      Kind = bkOK
    end
  end
  object Query1: TAdsQuery
    DatabaseName = 'magazyn'
    StoreActive = False
    AdsTableOptions.AdsLockType = Compatible
    AdsTableOptions.AdsCharType = OEM
    RequestLive = True
    SourceTableType = ttAdsCDX
    AdsConnection = magazyn
    Left = 40
    Top = 56
    ParamData = <>
  end
  object FormStorage1: TFormStorage
    IniFileName = '.\dieta4w.ini'
    StoredValues = <>
    Left = 224
    Top = 56
  end
  object magazyn: TAdsConnection
    ConnectPath = 'e:\m\scr\magazyn\roboczy'
    AdsServerTypes = [stADS_LOCAL]
    LoginPrompt = False
    Username = 'ADSSYS'
    StoreConnected = False
    Left = 8
    Top = 56
  end
end
