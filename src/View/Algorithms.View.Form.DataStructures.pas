unit Algorithms.View.Form.DataStructures;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Algorithms.View.Form.ChildTemplate,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Algorithms.View.Styles.Colors,
  System.ImageList, Vcl.ImgList;

type
  TFormDataStructures = class(TFormChildTemplate)
    ImgLstButtons: TImageList;
    BtnGenerics: TSpeedButton;
    BtnOO: TSpeedButton;
    BtnGraphs: TSpeedButton;
    BtnTrees: TSpeedButton;
    BtnMaps: TSpeedButton;
    BtnLists: TSpeedButton;
    PnlButtons: TPanel;
    procedure FormResize(Sender: TObject);
  private
    procedure AdjustTopButtons;
  public
    procedure ApplyStyle; override;
  end;

var
  FormDataStructures: TFormDataStructures;

implementation

{$R *.dfm}

{ TFormSortingAlgorithms }

procedure TFormDataStructures.AdjustTopButtons;
var
  Buttons: array of TSpeedButton;
  I, Left: integer;
const
  SAFE_DISTANCE = 50;
begin
  Buttons := [BtnLists, BtnMaps, BtnTrees, BtnGraphs, BtnOO, BtnGenerics];
  I := Low(Buttons);
  Left := 0;
  repeat
    Buttons[I].Left := SAFE_DISTANCE + Left;
    Left := Buttons[I].Left + Buttons[I].Width;
    Inc(I);
  until I > High(Buttons);
  PnlButtons.Width := Left + SAFE_DISTANCE;
  PnlButtons.Height := PnlButtons.Parent.Height;
  Self.Constraints.MinWidth := PnlButtons.Width;
end;

procedure TFormDataStructures.ApplyStyle;
begin
  inherited;
  AdjustTopButtons;
end;

procedure TFormDataStructures.FormResize(Sender: TObject);
begin
  inherited;
  PnlButtons.Left := Trunc((Pnltop.Width - PnlButtons.Width)/2);
end;

end.
