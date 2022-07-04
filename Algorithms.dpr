program Algorithms;

uses
  Vcl.Forms,
  Algorithms.View.Form.Main in 'src\View\Algorithms.View.Form.Main.pas' {FormMain},
  Algorithms.View.Form.ChildTemplate in 'src\View\Algorithms.View.Form.ChildTemplate.pas' {FormChildTemplate},
  Algorithms.View.Styles.Colors in 'src\View\Styles\Algorithms.View.Styles.Colors.pas',
  Algorithms.View.Form.SortingAlgorithms in 'src\View\Algorithms.View.Form.SortingAlgorithms.pas' {FormSortingAlgorithms},
  Algorithms.View.Form.Splash in 'src\View\Algorithms.View.Form.Splash.pas' {FormSplash},
  Algorithms.Controller.Application in 'src\Controller\Algorithms.Controller.Application.pas';

procedure SetUpMainForm;
begin
  Application.CreateForm(TFormMain, FormMain);
  Application.MainForm.Hide;
end;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  
  FormSplash := TFormSplash.Create(nil);
  try
    FormSplash.Show;
    SetUpMainForm;
    while FormSplash.Showing do
      Application.ProcessMessages;
  finally
    FormSplash.Free;
  end;

  Application.MainForm.Show;
  Application.Run;
end.
