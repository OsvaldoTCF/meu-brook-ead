unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Dialogs, StdCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btGet: TButton;
    btPost: TButton;
    btPut: TButton;
    btDelete: TButton;
    btOption: TButton;
    btSearch: TButton;
    edUri: TEdit;
    edDado: TEdit;
    edEncUri: TEdit;
    edUrl: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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

//const
//  ROOT_URL = 'http://localhost:2000';

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
//var
//  st: TStringStream;
//  http: TBrookHttpClient;
//begin
//  http := TBrookHttpClient.Create('fclweb');
//  st := TStringStream.Create('');
//  try
//    http.Post(edUrl.Text, st);
//    ShowMessage(st.DataString);
//  finally
//    st.Free;
//    http.Free;
//  end;
var
  nome, form, s: string;
  st: TStringStream;
  http: TBrookHttpClient;
begin
  nome := '';
  http := TBrookHttpClient.Create('fclweb');
  st := TStringStream.Create('');
  try
    edEncUri.Text := HTTPEncode(edDado.Text);
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
  st: TStringStream;
  http: TBrookHttpClient;
begin
  http := TBrookHttpClient.Create('fclweb');
  st := TStringStream.Create('');
  try
    http.Put(edUrl.Text, st);
    ShowMessage(st.DataString);
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
    http.Delete(edUrl.Text, st);
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

