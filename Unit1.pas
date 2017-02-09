unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Backgroud: TImage;
    B_Registry: TButton;
    B_Custorers: TButton;
    B_Day: TButton;
    B_Masters: TButton;
    procedure B_RegistryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_CustorersClick(Sender: TObject);
    procedure B_MastersClick(Sender: TObject);
    procedure B_DayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5;

procedure TMainForm.B_DayClick(Sender: TObject);
begin
MainForm.Hide;
Jornal.show;
end;

procedure TMainForm.B_MastersClick(Sender: TObject);
begin
MainForm.Hide;
Masters.show;
end;

procedure TMainForm.B_CustorersClick(Sender: TObject);
begin
MainForm.Hide;
Customers.show;
end;

procedure TMainForm.B_RegistryClick(Sender: TObject);
begin
MainForm.hide;
Registry.show;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
