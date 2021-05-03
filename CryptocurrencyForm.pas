unit CryptocurrencyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList,
  FireDAC.Stan.StorageXML, Vcl.StdCtrls, Vcl.ExtCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart;

type
  TCryptocurrencyFrm = class(TForm)
    PageControl1: TPageControl;
    tsBTC: TTabSheet;
    tsBTC_ETH: TTabSheet;
    Panel1: TPanel;
    bnData: TButton;
    ExchangeMemTable: TFDMemTable;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    DBChart2: TDBChart;
    Series2: TLineSeries;
    Series3: TLineSeries;
    procedure bnDataClick(Sender: TObject);
  private
  public
  end;

var
  CryptocurrencyFrm: TCryptocurrencyFrm;

implementation

uses IOUtils, CryptocurrencyDM, DateUtils, DataDialog;

{$R *.dfm}

procedure TCryptocurrencyFrm.bnDataClick(Sender: TObject);
begin
  DataDlg.ShowModal;
end;

end.
