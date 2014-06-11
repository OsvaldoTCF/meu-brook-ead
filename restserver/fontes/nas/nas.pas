unit nas;

{$mode objfpc}{$H+}

interface

uses
  dSQLdbBroker, dbutils, SysUtils;

type
  ENas = class(Exception);

  { TNas }

//{   id integer NOT NULL,
//    nasname character varying(128) NOT NULL,
//    shortname character varying(32) NOT NULL,
//    type character varying(30) DEFAULT 'other'::character varying NOT NULL,
//    ports integer,
//    secret character varying(60) NOT NULL,
//    server character varying(64),
//    community character varying(50),
//    description character varying(200)}

  TNas = class
  private
    FId: Int64;
    //FNasName: string;
    FShortName: string;
    FType: string;
    //FPorts: integer;
    //FSecret: string;
    //FServer: string;
    //FCommunity: string;
    //FDescription: string;

  public
    procedure Validate;
  published
    property Id: Int64 read FId write FId;
    //property NasName: string read FNasName write FNasName;
    property ShortName: string read FShortName write FShortName;
    property &Type: string read FType write FType;
    //property Ports: integer read Fports write FPorts;
    //property Secret:string read FSecret write FSecret;
    //property Server: string read FServer write FServer;
    //property Community: string read FCommunity write FCommunity;
    //property Description: string read FDescription write FDescription;

  end;

  { TNasOpf }

  TNasOpf = class(specialize TdGSQLdbEntityOpf<TNas>)
  public
    constructor Create; overload;
  end;


implementation

{ TNas }

procedure TNas.Validate;
begin
  if Trim(FShortName) = '' then
    raise ENas.Create('Field "ShortName" must not be empty.');
  if Trim(FType) = '' then
    raise ENas.Create('Field "Type" must not be empty.');
end;

{ TNasOpf }

constructor TNasOpf.Create;
begin
  inherited Create(dbutils.con, 'nas');
end;

end.

