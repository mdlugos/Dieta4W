object MemoForm: TMemoForm
  Left = 298
  Top = 206
  Width = 435
  Height = 300
  Caption = 'MemoForm'
  Color = clBtnFace
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    00000000C00000C0000000C0C000C0000000C000C000C0C00000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000BBBBBBBB00000000000
    0000000000BBBBBBBBBBBBB00000000000000000BBBBBBBBBBB000000000000B
    00000033BBBBBBBB000BBBB00000000B0000033BBBBBBB00BBBBBB000000000B
    000033BBBBBB00BBBBBB00000000000B30033BBBBBB0BBBBBB0000000000000B
    B333BBBBBB0BBBBB000000000000000BB333BBBBB0BBBBB00000000000000000
    BBBBBBBB0BBBB0000000000000000000BBBBBB00BBB300000000000000000000
    0BBB00F0BB30000000000000000000000000FFF0B33000000000000000000000
    00FFFFF0B330000000000000000000000FFFFFF0BB3300000000000000000000
    0FFFFFFF0BBB300000000000000000000FFFFFF000BBBBB00000000000000000
    0FFFFF000000BBBBB0000000000000000FFFFF00000000000000000000000000
    00FFF00000000000000000000000000000FFF000000000000000000000000000
    000F000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF807FFFFC001FEFF0000FCFC00007C780
    0007C700000FC600003FC00000FFC00003FFC0000FFFE0001FFFE0007FFFF000
    FFFFF000FFFFF800FFFFF0007FFFF0001FFFF00801FFF01C03FFF01F07FFF83F
    FFFFF83FFFFFFC7FFFFFFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = Memo1KeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 427
    Height = 266
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WantTabs = True
    WordWrap = False
  end
  object ComboBox1: TComboBox
    Left = 134
    Top = 15
    Width = 134
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object FormStorage1: TFormStorage
    IniFileName = '.\dieta4w.ini'
    OnRestorePlacement = FormStorage1RestorePlacement
    StoredProps.Strings = (
      'ComboBox1.Text')
    StoredValues = <>
    Left = 80
    Top = 40
  end
end
