program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Unit2 in 'Unit2.pas' {Registry},
  Unit3 in 'Unit3.pas' {Customers},
  Unit4 in 'Unit4.pas' {Masters},
  Unit5 in 'Unit5.pas' {Jornal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TRegistry, Registry);
  Application.CreateForm(TCustomers, Customers);
  Application.CreateForm(TMasters, Masters);
  Application.CreateForm(TJornal, Jornal);
  Application.Run;
end.
