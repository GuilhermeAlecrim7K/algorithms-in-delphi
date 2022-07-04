unit Algorithms.View.Form.Splash;

interface

uses
  Algorithms.Controller.Application,

  System.Classes,
  System.SysUtils,
  System.Variants,
  
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Imaging.pngimage,

  Winapi.Messages,
  Winapi.Windows;

type
  TFormSplash = class(TForm)
    PnlSplashImage: TPanel;
    ImgSplash: TImage;
    procedure OnTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FTimer: TTimer;
    procedure ApplyStyle;
    procedure SetUpTimer(AInterval: integer);
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.dfm}

{ TFormSplash }

procedure TFormSplash.ApplyStyle;
begin
  Self.Height := ImgSplash.Picture.Height;
  Self.Width := ImgSplash.Picture.Width;
end;

procedure TFormSplash.SetUpTimer(AInterval: integer);
begin
  FTimer.Enabled := false;
  FTimer.Interval := AInterval;
  FTimer.OnTimer := Self.OnTimer;
  FTimer.Enabled := true;
end;

procedure TFormSplash.OnTimer(Sender: TObject);
begin
  if not ApplicationController.FinishedLoading then
    SetUpTimer(1000)
  else
    Self.Close;
end;

procedure TFormSplash.FormCreate(Sender: TObject);
begin
  ApplyStyle;
  FTimer := TTimer.Create(Self);
end;

procedure TFormSplash.FormDestroy(Sender: TObject);
begin
  FTimer.Free;
end;

procedure TFormSplash.FormShow(Sender: TObject);
begin
  SetUpTimer(3000);
  ApplicationController.LoadApplicationDependencies;
end;

end.
