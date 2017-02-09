unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBGrids, Vcl.Grids, Vcl.Samples.Calendar, Vcl.DBCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TRegistry = class(TForm)
    Backgroud: TImage;
    CB_Masters: TDBLookupComboBox;
    L_Master: TLabel;
    CB_Speciality: TDBLookupComboBox;
    L_Speciality: TLabel;
    CB_Customers: TDBLookupComboBox;
    L_Customers: TLabel;
    Calendar1: TCalendar;
    Label1: TLabel;
    L_LastRegistry: TLabel;
    T_Registry: TDBGrid;
    CB_Time: TComboBox;
    B_Registry: TButton;
    DB_Connect: TADOConnection;
    Query_Customers: TADOQuery;
    Query_Speciality: TADOQuery;
    Query_Masters: TADOQuery;
    Query_Registry: TADOQuery;
    Query_Insert: TADOQuery;
    DS_Customers: TDataSource;
    DS_Speciality: TDataSource;
    DS_Masters: TDataSource;
    DS_Registry: TDataSource;
    procedure CB_SpecialityClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Calendar1Click(Sender: TObject);
    procedure B_RegistryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Registry: TRegistry;
  fl1:integer;
  fl2:integer;
implementation

{$R *.dfm}

uses Unit1;

procedure TRegistry.B_RegistryClick(Sender: TObject);
begin
fl1:=DS_Customers.DataSet.FieldByName('��_�������').Value;
fl2:=DS_Masters.DataSet.FieldByName('��_�������').Value;
  try
  Query_insert.Close;
  Query_insert.SQL.Clear;
  Query_insert.SQL.Add('INSERT INTO [������ ������](��_�������,��_�������,[���� ������],[����� ������]) VALUES('+Inttostr(fl1)+','+IntTostr(fl2)+','''+ DateTimetoStr(Calendar1.CalendarDate)+''','''+CB_Time.Text+''');');
  Query_insert.ExecSQL;
  showmessage('������ ���������!');
  except
  showmessage('������ �� ���������!��������� ��������� ������!');
  end;
end;

procedure TRegistry.Calendar1Click(Sender: TObject);
begin
Query_Registry.Close;
Query_Registry.SQL.Clear;
Query_Registry.SQL.Add('SELECT �������.�������,[���� ������],[����� ������]');
Query_Registry.SQL.Add('FROM [������ ������] INNER JOIN ������� ON �������.��_�������=[������ ������].��_�������');
Query_Registry.SQL.Add('WHERE [������ ������].��_�������=:reg AND [���� ������]=:date;');
Query_Registry.Parameters.ParamByName('reg').Value:=CB_Masters.KeyValue;
Query_Registry.Parameters.ParamByName('date').Value:=Calendar1.CalendarDate;
Query_Registry.Open;
end;

procedure TRegistry.CB_SpecialityClick(Sender: TObject);
begin
Query_Masters.Close;
Query_Masters.SQL.Clear;
Query_Masters.SQL.Add('SELECT * FROM �������');
Query_Masters.SQL.Add('WHERE ���_�������������=:master;');
Query_Masters.Parameters.ParamByName('master').Value:=CB_Speciality.KeyValue;
Query_Masters.Open;
end;

procedure TRegistry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Registry.Hide;
MainForm.show;
end;

end.
