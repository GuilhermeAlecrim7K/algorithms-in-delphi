unit Algorithms.View.Form.Main;

interface

uses
  Algorithms.View.Form.ChildTemplate, 
  Algorithms.View.Form.DataStructures,
  Algorithms.View.Styles.Colors,

  System.Classes, 
  System.ImageList, 
  System.SysUtils, 
  System.Variants, 

  Vcl.Buttons, 
  Vcl.Controls, 
  Vcl.Dialogs, 
  Vcl.ExtCtrls,
  Vcl.Forms, 
  Vcl.Graphics,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  Vcl.ImgList,

  Winapi.Messages, 
  Winapi.Windows;

type

  TFormMain = class(TForm)
    PnlSideMenu: TPanel;
    PnlMain: TPanel;
    ImgLstButtons: TImageList;
    BtnHome: TSpeedButton;
    PnlHeader: TPanel;
    ImgProfilePicture: TImage;
    BtnSideMenu: TSpeedButton;
    BtnDataStructures: TSpeedButton;
    BtnSQL: TSpeedButton;
    BtnAPIIntegration: TSpeedButton;
    BtnSettings: TSpeedButton;
    procedure BtnHomeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnMouseEnter(Sender: TObject);
    procedure BtnMouseLeave(Sender: TObject);
    procedure BtnDataStructuresClick(Sender: TObject);
    procedure BtnSideMenuClick(Sender: TObject);
  private
    FLastClickedButton: TSpeedButton;
    FSideMenuExpanded: boolean;
    procedure ApplyStyle;
    procedure ExpandSideMenu;
    procedure FillBtnsCaptions;
    procedure RetractSideMenu;
    procedure ClearBtnsCaptions;
    procedure AdjustButtonsStyle(Sender: TSpeedButton);
    procedure SetUpPnlMain(AForm: TFormChildClass; Sender: TSpeedButton);
  private const
    FBtnsCaptions: array [0..4] of string = ('Home', 'Data structures', 'SQL', 'API Integration', 'Settings');
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses Algorithms.View.Styles.Fonts;

procedure TFormMain.AdjustButtonsStyle(Sender: TSpeedButton);
begin
  if Assigned(FLastClickedButton) then
    BtnMouseLeave(FLastClickedButton);
  BtnMouseEnter(Sender);
  FLastClickedButton := Sender;
end;

procedure TFormMain.ApplyStyle;
const
  MENU_BUTTON_WIDTH = 50;
begin
  Self.WindowState := wsMaximized;
  PnlSideMenu.Color := COLOR_MENU_BACKGROUND;
  PnlMain.Color := COLOR_PANEL_BACKGROUND;
  PnlHeader.Color := COLOR_MENU_BACKGROUND;
  Self.Font.Name := MAIN_FONT_NAME;
  Self.Font.Size := MAIN_FONT_SIZE;
  Self.Font.Color := COLOR_PANEL_BACKGROUND;
  BtnSideMenu.Width := MENU_BUTTON_WIDTH;
  RetractSideMenu;
  BtnHome.Click;
end;

procedure TFormMain.BtnSideMenuClick(Sender: TObject);
begin
  if FSideMenuExpanded then
    RetractSideMenu
  else
    ExpandSideMenu;
end;

procedure TFormMain.ExpandSideMenu;
const
  EXPANDED_SIDEPANEL_WIDTH = 200;
begin
  FillBtnsCaptions;
  PnlSideMenu.Width := EXPANDED_SIDEPANEL_WIDTH;
  FSideMenuExpanded := true;
end;

procedure TFormMain.FillBtnsCaptions;
var
  I: Integer;
  Button: TSpeedButton;
begin
  for I := 0 to PnlSideMenu.ControlCount - 1 do
  begin
    if PnlSideMenu.Controls[I] is TSpeedButton then
    begin
      Button := TSpeedButton(PnlSideMenu.Controls[I]);
      Button.Caption := FBtnsCaptions[I];
    end;
  end;
end;

procedure TFormMain.RetractSideMenu;
const
  SAFE_DISTANCE = 15;
begin
  PnlSideMenu.Width := BtnSideMenu.Left + BtnSideMenu.Width + SAFE_DISTANCE;
  FSideMenuExpanded := false;
  ClearBtnsCaptions;
end;

procedure TFormMain.ClearBtnsCaptions;
var
  I: Integer;
  Button: TSpeedButton;
begin
  for I := 0 to PnlSideMenu.ControlCount - 1 do
  begin
    if PnlSideMenu.Controls[I] is TSpeedButton then
    begin
      Button := TSpeedButton(PnlSideMenu.Controls[I]);
      Button.Caption := EmptyStr;
    end;
  end;
end;

procedure TFormMain.BtnHomeClick(Sender: TObject);
begin
//  SetUpPnlMain(TFormHome, TSpeedButton(Sender));
end;

procedure TFormMain.BtnDataStructuresClick(Sender: TObject);
begin
  SetUpPnlMain(TFormDataStructures, TSpeedButton(Sender));
end;

procedure TFormMain.BtnMouseEnter(Sender: TObject);
var
  Btn: TSpeedButton;
begin
  Btn := TSpeedButton(Sender);
  Btn.Font.Color := CG_BLUE;
  Btn.Font.Style := [fsBold];
end;

procedure TFormMain.BtnMouseLeave(Sender: TObject);
var
  Btn: TSpeedButton;
begin
  Btn := TSpeedButton(Sender);
  Btn.Font.Style := [fsBold];
  if not Btn.Down then
  begin
    Btn.Font.Color := COLOR_PANEL_BACKGROUND;
    Btn.Font.Style := [];
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  ApplyStyle;
end;

procedure TFormMain.SetUpPnlMain(AForm: TFormChildClass; Sender: TSpeedButton);
begin
  AForm.CreateInto(PnlMain);
  AdjustButtonsStyle(Sender);
end;

end.
