unit Algorithms.Controller.Application;

interface

uses
  Algorithms.View.Form.Main,

  System.Classes,
  
  Vcl.Forms;

type

  TApplicationController = class
  private
    FFinishedLoading: boolean;
  public
    constructor Create;
    procedure LoadApplicationDependencies;
    property FinishedLoading: boolean read FFinishedLoading;
  end;

var
  ApplicationController: TApplicationController;

implementation

{ TApplicationController }

constructor TApplicationController.Create;
begin
  FFinishedLoading := false;
end;

procedure TApplicationController.LoadApplicationDependencies;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      //Insert other procedures here
      FFinishedLoading := true;
    end
  ).Start;
end;

initialization
  ApplicationController := TApplicationController.Create;

finalization
  ApplicationController.Free;

end.
