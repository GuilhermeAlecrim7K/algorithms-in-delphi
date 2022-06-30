object FormChildTemplate: TFormChildTemplate
  Left = 0
  Top = 0
  Align = alClient
  ClientHeight = 1469
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBody: TPanel
    Left = 0
    Top = 57
    Width = 744
    Height = 1412
    Align = alClient
    BevelOuter = bvNone
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 1
    OnResize = PnlBodyResize
    DesignSize = (
      744
      1412)
    object Scrollbar: TScrollBar
      Left = 724
      Top = 0
      Width = 15
      Height = 1495
      Align = alRight
      Kind = sbVertical
      PageSize = 1
      TabOrder = 1
      OnScroll = ScrollbarScroll
      ExplicitLeft = 719
      ExplicitHeight = 453
    end
    object PnlContents: TPanel
      Left = 1
      Top = 47
      Width = 722
      Height = 1500
      Anchors = []
      BevelOuter = bvNone
      Ctl3D = True
      Padding.Right = 5
      Padding.Bottom = 5
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      ExplicitTop = 0
    end
  end
  object Pnltop: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 18
    Padding.Top = 10
    Padding.Right = 15
    Padding.Bottom = 10
    ParentBackground = False
    TabOrder = 0
  end
end
