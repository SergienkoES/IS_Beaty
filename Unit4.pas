unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TMasters = class(TForm)
    Backgroud: TImage;
    DB_Connect: TADOConnection;
    Query_Masters: TADOQuery;
    DS_Masters: TDataSource;
    Query_Insert: TADOQuery;
    L_Customers: TLabel;
    T_Registry: TDBGrid;
    AddCustomer: TLabel;
    L_FirstName: TLabel;
    L_LastName: TLabel;
    L_MiddleName: TLabel;
    MiddleName: TEdit;
    LastName: TEdit;
    FirstName: TEdit;
    B_AddCustomer: TButton;
    CB_Speciality: TDBLookupComboBox;
    L_Speciality: TLabel;
    procedure B_AddCustomerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Masters: TMasters;

implementation

{$R *.dfm}

uses Unit1;

procedure TMasters.B_AddCustomerClick(Sender: TObject);
begin
if (FirstName.Text='') AND (LastName.Text='') AND (MiddleName.Text='') then
    begin
    showmessage('Обнаружены незаполненные поля!');
    end
else
  try
  Query_Insert.Close;
  Query_Insert.SQL.Clear;
  Query_Insert.SQL.Add('INSERT INTO Мастера(Фамилия,Имя,Отчество,Код_специальности) VALUES(:FN,:LN,:MN,:KS);');
  Query_Insert.Parameters.ParamByName('FN').Value:=FirstName.Text;
  Query_Insert.Parameters.ParamByName('LN').Value:=LastName.Text;
  Query_Insert.Parameters.ParamByName('MN').Value:=MiddleName.Text;
  Query_Insert.Parameters.ParamByName('KS').Value:=CB_Speciality.KeyValue;
  Query_Insert.ExecSQL;
  Query_Masters.Close;
  Query_Masters.Open;
  FirstName.Text:='';
  LastName.Text:='';
  MiddleName.Text:='';
  except
  showmessage('Не удалось добавить сотрудника!');
  end;
end;

procedure TMasters.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Masters.Hide;
MainForm.show;
end;

end.
