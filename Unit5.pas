unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Grids, Vcl.Samples.Calendar, Vcl.DBCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TJornal = class(TForm)
    Backgroud: TImage;
    CB_Masters: TDBLookupComboBox;
    Calendar1: TCalendar;
    L_Master: TLabel;
    Label1: TLabel;
    T_Registry: TDBGrid;
    Query_Journal: TADOQuery;
    DS_Journal: TDataSource;
    DB_Connect: TADOConnection;
    procedure CB_MastersClick(Sender: TObject);
    procedure Calendar1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Jornal: TJornal;

implementation

{$R *.dfm}

uses Unit1;

procedure TJornal.Calendar1Click(Sender: TObject);
begin
Query_Journal.Close;
Query_Journal.SQL.Clear;
Query_Journal.SQL.Add('SELECT Клиенты.Фамилия,[Дата приема], [Время приема]');
Query_Journal.SQL.Add('FROM [Журнал записи] INNER JOIN Клиенты ON Клиенты.ИД_Клиента=[Журнал записи].ИД_Клиента');
Query_Journal.SQL.Add('WHERE [Журнал записи].ИД_Клиента=:reg AND [Дата приема]=:date;');
Query_Journal.Parameters.ParamByName('reg').Value:=CB_Masters.KeyValue;
Query_Journal.Parameters.ParamByName('date').Value:=Calendar1.CalendarDate;
Query_Journal.Open;
end;

procedure TJornal.CB_MastersClick(Sender: TObject);
begin
Query_Journal.Close;
Query_Journal.SQL.Clear;
Query_Journal.SQL.Add('SELECT Клиенты.Фамилия,[Дата приема],[Время приема]');
Query_Journal.SQL.Add('FROM [Журнал записи] INNER JOIN Клиенты ON Клиенты.ИД_Клиента=[Журнал записи].ИД_Клиента');
Query_Journal.SQL.Add('WHERE [Журнал записи].ИД_Клиента=:reg AND [Дата приема]=:date;');
Query_Journal.Parameters.ParamByName('reg').Value:=CB_Masters.KeyValue;
Query_Journal.Parameters.ParamByName('date').Value:=Calendar1.CalendarDate;
Query_Journal.Open;
end;

procedure TJornal.FormClick(Sender: TObject);
begin
Jornal.hide;
MainForm.show;
end;

end.
