unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TCustomers = class(TForm)
    Backgroud: TImage;
    L_Customers: TLabel;
    AddCustomer: TLabel;
    T_Registry: TDBGrid;
    DB_Connect: TADOConnection;
    Query_Customers: TADOQuery;
    DS_Customers: TDataSource;
    FirstName: TEdit;
    LastName: TEdit;
    MiddleName: TEdit;
    DateBrith: TEdit;
    L_FirstName: TLabel;
    L_LastName: TLabel;
    L_MiddleName: TLabel;
    L_DateBrith: TLabel;
    B_AddCustomer: TButton;
    Query_Insert: TADOQuery;
    procedure B_AddCustomerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Customers: TCustomers;

implementation

{$R *.dfm}

uses Unit1;

procedure TCustomers.B_AddCustomerClick(Sender: TObject);
begin
if (FirstName.Text='') AND (LastName.Text='') AND (MiddleName.Text='') AND (DateBrith.Text='') then
    begin
    showmessage('Обнаружены незаполненные поля!');
    end
  else
  begin
    try
    Query_Insert.Close;
    Query_Insert.SQL.Clear;
    Query_Insert.SQL.Add('INSERT INTO Клиенты(Фамилия,Имя,Отчество,ДатаРождения) VALUES(:FN,:LN,:MN,:DB);');
    Query_Insert.Parameters.ParamByName('FN').Value:=FirstName.Text;
    Query_Insert.Parameters.ParamByName('LN').Value:=LastName.Text;
    Query_Insert.Parameters.ParamByName('MN').Value:=MiddleName.Text;
    Query_Insert.Parameters.ParamByName('DB').Value:=DateBrith.Text;
    Query_Insert.ExecSQL;
    Query_Customers.Close;
    Query_Customers.Open;
    showmessage('Клиент добавлен');
    except
    showmessage('Не удалось добавить клиента');
    end;
    end;
end;

procedure TCustomers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Customers.Hide;
MainForm.show;
end;

end.
