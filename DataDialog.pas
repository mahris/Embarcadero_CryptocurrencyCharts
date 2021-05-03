unit DataDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.StorageXML, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TDataDlg = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    bnFill: TButton;
    edApiKey: TLabeledEdit;
    cbPeriod: TComboBox;
    cbStep: TComboBox;
    edStep: TEdit;
    udStep: TUpDown;
    ProgressBar1: TProgressBar;
    bnSave: TButton;
    bnLoad: TButton;
    ActionList1: TActionList;
    acLoad: TAction;
    acSave: TAction;
    acFill: TAction;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    procedure acLoadExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acFillExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataDlg: TDataDlg;

implementation

uses IOUtils, CryptocurrencyForm, FireDAC.Stan.Intf, DateUtils,
  CryptocurrencyDM;

{$R *.dfm}

var
  DataDir: string = '';
function GetDataDir: string;
begin
  if DataDir='' then
    DataDir := IncludeTrailingPathDelimiter(TDirectory.GetParent(TDirectory.GetParent(GetCurrentDir)))+'Data';
  result := DataDir;
end;
procedure SetDataDir(const s: string);
begin
  DataDir := s;
end;

procedure TDataDlg.acFillExecute(Sender: TObject);
var
  dtEnd, dtStart, dt: TDateTime;
  int: integer;
  btc, eth: double;
  msg, msglast: string;
  nAllRequests, nBadRequests: integer;
begin
  CryptocurrencyFrm.ExchangeMemTable.DisableControls;
  bnFill.Cursor := crHourGlass;
  try
    CryptocurrencyFrm.ExchangeMemTable.EmptyDataSet;
    CryptocurrencyFrm.ExchangeMemTable.active := true;
    //exit;
    int := - trunc(udStep.Position);
    dtEnd := Yesterday; // today may be unavailable
    case cbPeriod.ItemIndex of
      0: dtStart := IncYear(dtEnd, -1);
      1: dtStart := IncMonth(dtEnd, -1);
      2: dtStart := IncWeek(dtEnd, -1);
      else begin
        ShowMessage('Invalid period');
        exit;
      end;
    end;
    //log(fmtdt(dtb)+'..'+fmtdt(dte));
    dt := dtEnd;
    while dt > dtStart do begin
      //sdt := fmtdt(dt);
      //log(sdt);
      CryptocurrencyFrm.ExchangeMemTable.Append;
      CryptocurrencyFrm.ExchangeMemTable.Fields[0].AsDateTime := dt;
      CryptocurrencyFrm.ExchangeMemTable.Post;
      case cbStep.ItemIndex of
        0: dt := IncMonth(dt, -1);
        1: dt := IncWeek(dt, -1);
        2: dt := IncDay(dt, int);
        else begin
          ShowMessage('Invalid step');
          exit;
        end;
      end;
    end;
    CryptocurrencyFrm.ExchangeMemTable.First;
    if CryptocurrencyFrm.ExchangeMemTable.Eof then exit;
    ProgressBar1.Visible := false;
    ProgressBar1.Position := 0;
    ProgressBar1.Max := CryptocurrencyFrm.ExchangeMemTable.RecordCount;
    ProgressBar1.Visible := true;
  //try
    nAllRequests := 0;
    nBadRequests := 0;
    while not CryptocurrencyFrm.ExchangeMemTable.Eof do begin
      Application.ProcessMessages;
      inc(nAllRequests);
      if CryptocurrencyData.GetOneDate(edApiKey.Text,
        CryptocurrencyFrm.ExchangeMemTable.Fields[0].AsDateTime, btc, eth, msg)
      then begin
        CryptocurrencyFrm.ExchangeMemTable.Edit;
        CryptocurrencyFrm.ExchangeMemTable.Fields[1].AsFloat := btc;
        CryptocurrencyFrm.ExchangeMemTable.Fields[2].AsFloat := eth;
        CryptocurrencyFrm.ExchangeMemTable.Post;
      end
      else begin
        inc(nBadRequests);
        msglast := msg;
      end;
      CryptocurrencyFrm.ExchangeMemTable.Next;
      ProgressBar1.Position := ProgressBar1.Position + 1;
    end;
  finally
    CryptocurrencyFrm.ExchangeMemTable.EnableControls;
    bnFill.Cursor := crDefault;
  end;
  if nBadRequests > 0 then
    ShowMessage('Failed ' + IntToStr(nBadRequests) + ' requests of ' + IntToStr(nAllRequests) + '.'
      + #13#10'LastError: ' + msglast);
  CryptocurrencyFrm.DBChart1.RefreshData;
  CryptocurrencyFrm.DBChart2.RefreshData;
end;

procedure TDataDlg.acLoadExecute(Sender: TObject);
begin
  OpenDialog1.InitialDir := GetDataDir;
  if not OpenDialog1.Execute then exit;
  SetDataDir(ExtractFilePath(OpenDialog1.FileName));
  CryptocurrencyFrm.ExchangeMemTable.DisableControls;
  bnFill.Cursor := crHourGlass;
  try
    CryptocurrencyFrm.ExchangeMemTable.Active := false;
    CryptocurrencyFrm.ExchangeMemTable.LoadFromFile(OpenDialog1.FileName);
  finally
    CryptocurrencyFrm.ExchangeMemTable.EnableControls;
    bnFill.Cursor := crDefault;
  end;
  CryptocurrencyFrm.DBChart1.RefreshData;
  CryptocurrencyFrm.DBChart2.RefreshData;
end;

procedure TDataDlg.acSaveExecute(Sender: TObject);
begin
  SaveDialog1.InitialDir := GetDataDir;
  if not SaveDialog1.Execute then exit;
  SetDataDir(ExtractFilePath(SaveDialog1.FileName));
  CryptocurrencyFrm.ExchangeMemTable.SaveToFile(SaveDialog1.FileName, sfXML );
end;

procedure TDataDlg.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var
  b : boolean;
begin
  b := cbStep.ItemIndex = 2;
  udStep.Visible := b;
  edStep.Visible := b;
  b := CryptocurrencyFrm.ExchangeMemTable.RecordCount > 0;
  acSave.Enabled := b;
end;

end.
