object frmTorlesMegerositese: TfrmTorlesMegerositese
  Left = 282
  Top = 202
  Width = 163
  Height = 212
  Caption = 'T�rl�s meger�s�t�se'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680500001600000028000000100000002000
    0000010008000000000000010000000000000000000000000000000000000000
    00004000000080000000FF000000002000004020000080200000FF2000000040
    00004040000080400000FF400000006000004060000080600000FF6000000080
    00004080000080800000FF80000000A0000040A0000080A00000FFA0000000C0
    000040C0000080C00000FFC0000000FF000040FF000080FF0000FFFF00000000
    20004000200080002000FF002000002020004020200080202000FF2020000040
    20004040200080402000FF402000006020004060200080602000FF6020000080
    20004080200080802000FF80200000A0200040A0200080A02000FFA0200000C0
    200040C0200080C02000FFC0200000FF200040FF200080FF2000FFFF20000000
    40004000400080004000FF004000002040004020400080204000FF2040000040
    40004040400080404000FF404000006040004060400080604000FF6040000080
    40004080400080804000FF80400000A0400040A0400080A04000FFA0400000C0
    400040C0400080C04000FFC0400000FF400040FF400080FF4000FFFF40000000
    60004000600080006000FF006000002060004020600080206000FF2060000040
    60004040600080406000FF406000006060004060600080606000FF6060000080
    60004080600080806000FF80600000A0600040A0600080A06000FFA0600000C0
    600040C0600080C06000FFC0600000FF600040FF600080FF6000FFFF60000000
    80004000800080008000FF008000002080004020800080208000FF2080000040
    80004040800080408000FF408000006080004060800080608000FF6080000080
    80004080800080808000FF80800000A0800040A0800080A08000FFA0800000C0
    800040C0800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000
    A0004000A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040
    A0004040A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080
    A0004080A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0
    A00040C0A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000
    C0004000C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040
    C0004040C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080
    C0004080C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0
    C00040C0C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000
    FF004000FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040
    FF004040FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080
    FF004080FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0
    FF0040C0FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF000000
    0000009292929292920000000000000000929280808080808092920000000000
    92808080E0E0E0E080808092000000E08080E0E00000000080808080920000E0
    8080000000000092808080809200E08080920000000092808080E0808092E080
    920000000092808080E000E08092E0809200000092808080E00000E08092E080
    92000092808080E0000000E08092E080920092808080E000000000E08092E080
    8092808080E000000000E080809200E080808080E00000000000E080920000E0
    80808092000000009280808092000000E0808080929292928080809200000000
    00E0E0808080808080E0E00000000000000000E0E0E0E0E0E00000000000F81F
    FFFFE007FFFFC003FFFF83C1FFFF8F81FFFF0F00FFFF1E08FFFF1C18FFFF1838
    FFFF1078FFFF00F0FFFF81F1FFFF83C1FFFFC003FFFFE007FFFFF81FFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 137
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'T�nyleg t�r�lni akarod az aktu�lis rekordot?'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 137
    Height = 26
    Alignment = taCenter
    AutoSize = False
    Caption = 'A t�r�lt adatok ut�lag nem �ll�that�k helyre.'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 137
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'Amennyiben m�g mindig t�r�lni akarod, jel�ld be az al�bbi jel�l�' +
      'n�gyzetet.'
    WordWrap = True
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 136
    Width = 113
    Height = 17
    Caption = 'Igen, t�r�lni akarom'
    TabOrder = 0
  end
  object Button1: TBitBtnWithColor
    Left = 0
    Top = 160
    Width = 75
    Height = 25
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
    Color = clBtnFace
  end
  object Button2: TBitBtnWithColor
    Left = 80
    Top = 160
    Width = 75
    Height = 25
    Caption = '&M�gse'
    ModalResult = 2
    TabOrder = 2
    Color = clBtnFace
  end
end