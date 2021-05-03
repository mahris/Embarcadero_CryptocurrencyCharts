object CryptocurrencyData: TCryptocurrencyData
  OldCreateOrder = False
  Height = 316
  Width = 399
  object TmpExchangeMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 39
    Top = 16
  end
  object ExchangeResponse: TRESTResponse
    RootElement = 'rates'
    Left = 148
    Top = 16
  end
  object ExchangeClient: TRESTClient
    BaseURL = 
      'http://api.coinlayer.com/api/2021-04-29?access_key=62ed3f8b122e5' +
      '839ed7e2ab485586f11&symbols=BTC,ETH'
    Params = <>
    Left = 144
    Top = 72
  end
  object ExchangeAdapter: TRESTResponseDataSetAdapter
    Dataset = TmpExchangeMemTable
    FieldDefs = <>
    Response = ExchangeResponse
    Left = 40
    Top = 80
  end
  object ExchangeRequest: TRESTRequest
    Client = ExchangeClient
    Params = <>
    Response = ExchangeResponse
    SynchronizedEvents = False
    Left = 56
    Top = 144
  end
end
