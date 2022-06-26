unit Algorithms.View.Form.SortingAlgorithms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Algorithms.View.Form.ChildTemplate,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Algorithms.View.Styles.Colors,
  System.ImageList, Vcl.ImgList;

type
  TFormSortingAlgorithms = class(TFormChildTemplate)
    BtnInsertionSort: TSpeedButton;
    PnlHeader: TPanel;
    PnlMain: TPanel;
    PnlSideMenu: TPanel;
    SpeedButton1: TSpeedButton;
    ImgLstButtons: TImageList;
  private
  public
    procedure ApplyStyle; override;
  end;

var
  FormSortingAlgorithms: TFormSortingAlgorithms;

implementation

{$R *.dfm}

{ TFormSortingAlgorithms }

procedure TFormSortingAlgorithms.ApplyStyle;
begin
  PnlHeader.Color := COLOR_MENU_BACKGROUND;
  PnlMain.Color := COLOR_BACKGROUND;
end;

end.
