unit CryptocurrencyDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, REST.Types, REST.Client, REST.Response.Adapter,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TCryptocurrencyData = class(TDataModule)
    TmpExchangeMemTable: TFDMemTable;
    ExchangeResponse: TRESTResponse;
    ExchangeClient: TRESTClient;
    ExchangeAdapter: TRESTResponseDataSetAdapter;
    ExchangeRequest: TRESTRequest;
  private
  public
    function GetOneDate(const key: string; dt: TDateTime; var btc, eth: double; var msg: string): boolean;
  end;

var
  CryptocurrencyData: TCryptocurrencyData;

implementation

uses Windows;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TCryptocurrencyData }

// For payed key, we can retrieve all history in one request
// For freeware key, wee should use a separate request for every date
function TCryptocurrencyData.GetOneDate(const key: string; dt: TDateTime;
  var btc, eth: double; var msg: string): boolean;
var
  url: string;
begin
  url := 'http://api.coinlayer.com/api/'
    + FormatDateTime('yyyy-mm-dd', dt)
    + '?access_key='+key
    + '&symbols=BTC,ETH'
    + '';
  ExchangeClient.BaseURL := url;
  try
    ExchangeRequest.Execute;
    btc := CryptocurrencyData.TmpExchangeMemTable.FieldByName('BTC').AsFloat;
    eth := CryptocurrencyData.TmpExchangeMemTable.FieldByName('ETH').AsFloat;
    result := true;
  except
    on e: Exception do begin
      result := false;
      msg := e.Message;
    end;
  end;
end;

end.
