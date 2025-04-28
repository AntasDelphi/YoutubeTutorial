object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Koneksi: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\User\OneDrive\Desktop\Show Record To Listview\' +
        'Win32\Debug\CONFIG\antas.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 88
    Top = 40
  end
  object SQLShow: TFDQuery
    Connection = Koneksi
    SQL.Strings = (
      'select*from tbsiswa')
    Left = 135
    Top = 40
    object SQLShowNIS: TStringField
      FieldName = 'NIS'
      Origin = 'NIS'
      Size = 10
    end
    object SQLShowNAMA: TStringField
      FieldName = 'NAMA'
      Origin = 'NAMA'
      Size = 25
    end
    object SQLShowKELAMIN: TStringField
      FieldName = 'KELAMIN'
      Origin = 'KELAMIN'
      Size = 10
    end
    object SQLShowKELAS: TStringField
      FieldName = 'KELAS'
      Origin = 'KELAS'
      Size = 25
    end
    object SQLShowANGKATAN: TIntegerField
      FieldName = 'ANGKATAN'
      Origin = 'ANGKATAN'
    end
    object SQLShowWALI: TStringField
      FieldName = 'WALI'
      Origin = 'WALI'
      Size = 50
    end
    object SQLShowFoto: TBlobField
      FieldName = 'Foto'
      Origin = 'Foto'
    end
  end
end
