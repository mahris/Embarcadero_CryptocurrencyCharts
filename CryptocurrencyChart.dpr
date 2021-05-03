program CryptocurrencyChart;

uses
  Vcl.Forms,
  CryptocurrencyForm in 'CryptocurrencyForm.pas' {CryptocurrencyFrm},
  CryptocurrencyDM in 'CryptocurrencyDM.pas' {CryptocurrencyData: TDataModule},
  DataDialog in 'DataDialog.pas' {DataDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCryptocurrencyFrm, CryptocurrencyFrm);
  Application.CreateForm(TCryptocurrencyData, CryptocurrencyData);
  Application.CreateForm(TDataDlg, DataDlg);
  Application.Run;
end.
