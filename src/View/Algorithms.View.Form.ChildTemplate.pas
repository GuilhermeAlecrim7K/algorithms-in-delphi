unit Algorithms.View.Form.ChildTemplate;

interface

uses
  System.Classes, 
  System.SysUtils, 
  System.Variants, 
  Vcl.Buttons,
  Vcl.Controls, 
  Vcl.Dialogs, 
  Vcl.ExtCtrls, 
  Vcl.Forms, 
  Vcl.Graphics,
  Vcl.StdCtrls, 
  Winapi.Messages, 
  Winapi.Windows; 

type
  TFormChildTemplate = class abstract(TForm)
    Pnltop: TPanel;
    PnlBody: TPanel;
    Scrollbar: TScrollBar;
    PnlContents: TPanel;
    procedure PnlBodyResize(Sender: TObject);
    procedure ScrollbarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  public
    procedure ApplyStyle; virtual;
    class procedure CreateInto(Parent: TPanel);
  end;

  TFormChildClass = class of TFormChildTemplate;

var
  FormChildTemplate: TFormChildTemplate;

implementation

{$R *.dfm}

uses Algorithms.View.Styles.Colors;

{ TFormChildTemplate }

procedure TFormChildTemplate.ApplyStyle;
begin
  PnlTop.Color := COLOR_INNER_MENU_BACKGROUND;
  PnlContents.Color := COLOR_PANEL_BACKGROUND;
  PnlContents.Top := 0;
  PnlContents.Left := 0;
  PnlContents.Width := PnlBody.Width - ScrollBar.Width;
end;

class procedure TFormChildTemplate.CreateInto(Parent: TPanel);
begin
  if Assigned(FormChildTemplate) then
    FormChildTemplate.Free;
  FormChildTemplate := Self.Create(Parent);
  FormChildTemplate.Parent := Parent;
  FormChildTemplate.Color := Parent.Color;
  FormChildTemplate.BorderStyle := bsNone;
  FormChildTemplate.Visible := True;
  FormChildTemplate.ApplyStyle;
end;

procedure TFormChildTemplate.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  I: Integer;
begin
  I := ScrollBar.Position + 1;
  if I <= PnlContents.Height then
  begin
    ScrollBar.ScrollBy(0, I);
    ScrollBar.SetParams(I, 0, 100);
    ScrollBar.OnScroll(Self, TScrollCode.sclineup, I);
  end;
end;

procedure TFormChildTemplate.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  I: Integer;
begin
  I := ScrollBar.Position - 1;
  if I >= 0 then
  begin
    ScrollBar.ScrollBy(0, I);
    ScrollBar.SetParams(I, 0, 100);
    ScrollBar.OnScroll(Self, TScrollCode.sclinedown, I);
  end;
end;

procedure TFormChildTemplate.PnlBodyResize(Sender: TObject);
begin
  PnlContents.Left := 0;
  PnlContents.Top := 0;
  PnlContents.Width := PnlBody.Width - ScrollBar.Width - 1;
end;

procedure TFormChildTemplate.ScrollbarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  PnlContents.Top := Round((-PnlContents.Height + PnlBody.Height) / ScrollBar.Max) * ScrollPos;
end;

end.
