unit rest;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, nas, rutils, fpjson, classes;

type


  { TNasAction }

  TNasAction = class(specialize TBrookGAction<TNas>)
  private
    FOpf: TNasOpf;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure Get; override;
    procedure Post; override;
    procedure Put; override;
    procedure Delete; override;
    property Opf: TNasOpf read FOpf;
  end;



implementation

{ TRadIpPoolAction }


/////////////////////// NAS

{ TPersonRESTAction }

constructor TNasAction.Create;
begin
  inherited Create;
  FOpf := TNasOpf.Create;
end;

destructor TNasAction.Destroy;
begin
  FOpf.Free;
  inherited Destroy;
end;


procedure TNasAction.Get;
var
  VUGroup: TNas;
  VUGroups: TNasOpf.TEntities;
  VJArray: TJSONArray;
  VJObject: TJSONObject;
  ts: tstrings;
begin
  if Values.Values['id'] <> '' then
  begin
  //FOpf.Entity.Id := StrToIntDef(Values.Values['id'],0);
  //FOpf.Get;
  //with TJSONObject.Create do
  //  try
  //    Add('id',FOpf.Entity.Id);
  //    Add('shortname',FOpf.Entity.ShortName);
  //    Write(AsJSON);
  //  finally
  //    Free;
  //  end;
  end
  else
  begin
  ts := tstringlist.create;
  VJObject := TJSONObject.Create;
  VJArray := TJSONArray.Create;
  VUGroups := TNasOpf.TEntities.Create;
  try
    FOpf.List(VUGroups);
    for VUGroup in VUGroups do
      begin
      VJObject.Clear;
      ObjectToJSON(FOpf.Table.PropList, FOpf.Table.PropCount , VUGroup, VJObject,
       ts);
      VJArray.Add(VJObject.Clone);
      end;
      Write(VJArray.AsJSON);

         finally
          VJObject.free;
          ts.Free;
          VJArray.Free;
        end;


  end;

end;

procedure TNasAction.Post;
begin

  Entity.Validate;
  FOpf.Add(Entity);
  FOpf.Apply;
end;

procedure TNasAction.Put;
begin
  Entity.Validate;
  FOpf.Modify(Entity);
  FOpf.Apply;
end;

procedure TNasAction.Delete;
begin
  FOpf.Remove(Entity);
  FOpf.Apply;
end;

initialization
  TNasAction.Register('/nas');
  TNasAction.Register('/nas/:id');

end.
