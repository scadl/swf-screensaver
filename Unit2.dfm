object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Twilight ScreenSaver Config'
  ClientHeight = 294
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 221
    Top = 262
    Width = 156
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #1071#1079#1099#1082'...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnMouseDown = Label1MouseDown
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 80
    Width = 177
    Height = 57
    Caption = ' Background - Type '
    ItemIndex = 0
    Items.Strings = (
      'Transparent'
      'Filled')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object GroupBox1: TGroupBox
    Left = 191
    Top = 80
    Width = 186
    Height = 57
    Caption = ' Background - Color '
    Enabled = False
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 21
      Width = 8
      Height = 13
      Caption = '#'
      Enabled = False
    end
    object Button1: TButton
      Left = 87
      Top = 16
      Width = 82
      Height = 23
      Caption = 'Set Color'
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 30
      Top = 18
      Width = 51
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = 'c1c1c1'
    end
  end
  object Button2: TButton
    Left = 136
    Top = 262
    Width = 73
    Height = 25
    Caption = 'Test'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 262
    Width = 57
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 71
    Top = 262
    Width = 59
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = Button4Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 369
    Height = 66
    Caption = ' Path to your SWF '
    TabOrder = 5
    object Button5: TButton
      Left = 320
      Top = 27
      Width = 33
      Height = 25
      Caption = '...'
      TabOrder = 0
      OnClick = Button5Click
    end
    object Edit2: TEdit
      Left = 16
      Top = 29
      Width = 298
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 143
    Width = 369
    Height = 58
    Caption = ' Scale SWF-Canvas (+ pixels) '
    TabOrder = 6
    object Label3: TLabel
      Left = 14
      Top = 26
      Width = 43
      Height = 13
      Caption = 'Width ->'
    end
    object Label4: TLabel
      Left = 307
      Top = 26
      Width = 46
      Height = 13
      Caption = '<- Height'
    end
    object SpeedButton1: TSpeedButton
      Left = 145
      Top = 24
      Width = 74
      Height = 23
      Hint = 'Sync Values (preserv aspect ratio)'
      Caption = 'D'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Wingdings 3'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpinEdit1: TSpinEdit
      Left = 73
      Top = 24
      Width = 66
      Height = 22
      MaxValue = 5000
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = SpinEdit1Change
    end
    object SpinEdit2: TSpinEdit
      Left = 225
      Top = 24
      Width = 66
      Height = 22
      MaxValue = 5000
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = SpinEdit2Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 207
    Width = 369
    Height = 49
    Caption = ' Additional Options '
    TabOrder = 7
    object CheckBox1: TCheckBox
      Left = 13
      Top = 20
      Width = 339
      Height = 17
      Caption = 'MultiMonitor Support (may cause sgnificant lags)'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  object ColorDialog1: TColorDialog
    Left = 144
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Looped SWF|*.SWF'
    Left = 184
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 8
    object ENGMUI1: TMenuItem
      Caption = 'English Interface'
      Checked = True
      OnClick = ENGMUI1Click
    end
    object RUMUI1: TMenuItem
      Caption = #1056#1091#1089#1089#1082#1080#1081' '#1080#1085#1090#1077#1088#1092#1077#1081#1089
      OnClick = RUMUI1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 264
    Top = 8
  end
end
