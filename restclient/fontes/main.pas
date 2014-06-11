unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, StdCtrls, rutils, fpjson;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btGet: TButton;
    btPost: TButton;
    btPut: TButton;
    btDelete: TButton;
    btOption: TButton;
    btSearch: TButton;
    edDado2: TEdit;
    edUri: TEdit;
    edDado1: TEdit;
    edEncUri: TEdit;
    edUrl: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btGetClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btPutClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btOptionClick(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;


var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

uses
  BrookHttpClient, HTTPDefs;

{ TfrmMain }

procedure TfrmMain.btGetClick(Sender: TObject);
var
  st: TStringStream;
  http: TBrookHttpClient;

begin
  http := TBrookHttpClient.Create('fclweb');
  st := TStringStream.Create('');
  try
    http.Get(edUrl.Text+edUri.text, st);
    ShowMessage(st.DataString);
  finally
    st.Free;
    http.Free;
  end;
end;

procedure TfrmMain.btPostClick(Sender: TObject);
var
  nome, form, s: string;
  st: TStringStream;
  http: TBrookHttpClient;
begin
  nome := '';
  http := TBrookHttpClient.Create('fclweb');
  st := TStringStream.Create('');
  try
    edEncUri.Text := HTTPEncode(edDado1.Text);
    form := edEncUri.Text;
    http.PostForm(edUrl.Text+edUri.Text, form, st);
    s := StringReplace(st.DataString, '<br />', LineEnding, [rfReplaceAll]);
    ShowMessage(s);
  finally
    st.Free;
    http.Free;
  end;
end;

procedure TfrmMain.btPutClick(Sender: TObject);
var
  s, d1, d2: string;
  st: TStringStream;
  http: TBrookHttpClient;
begin
  http := TBrookHttpClient.Create('fclweb');
  st := TStringStream.Create('');
  d1 := HTTPEncode(edDado1.Text);
  d2 := HTTPEncode(edDado2.Text);

  try
    if (edDado1.Text='') and (edDado2.Text<>'') then
    edEncUri.Text := d2
    else
    if (edDado2.Text='') and (edDado1.Text<>'') then
    edEncUri.Text := d1
    else
    edEncUri.Text := d1+'&'+d2;
    http.PutForm(edUrl.Text+edUri.Text, edEncUri.Text, st);
    s := StringReplace(st.DataString, '<br />', LineEnding, [rfReplaceAll]);
    ShowMessage(s);
  finally
    st.Free;
    http.Free;
  end;
end;

procedure TfrmMain.btDeleteClick(Sender: TObject);
var
  st: TStringStream;
  http: TBrookHttpClient;
begin
  http := TBrookHttpClient.Create('fclweb');
  st := TStringStream.Create('');
  try
    http.Delete(edUrl.Text+edUri.Text, st);
    ShowMessage(st.DataString);
  finally
    st.Free;
    http.Free;
  end;
end;

procedure TfrmMain.btOptionClick(Sender: TObject);
begin
  //
end;

procedure TfrmMain.btSearchClick(Sender: TObject);
begin
  //
end;

end.

