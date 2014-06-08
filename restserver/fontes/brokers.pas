unit Brokers;

{$mode objfpc}{$H+}

interface

uses
  BrookUtils,

//  BrookFCLEventLogBroker,

//BrookFCLCGIBroker,
////BrookFCLHTTPDaemonBroker,
////BrookFCLHTTPAppBroker,
////BrookApplication,
////fpmimetypes,
////BrookStaticFileBroker,
//BrookHTTPConsts, BrookSQLdbBroker, SQLite3Conn;// Classes, SysUtils
//  BrookFCLHttpDaemonBroker; // daemon
  BrookFCLHttpAppBroker;      // standalone
 // BrookFCLCGIBroker;


implementation

initialization
BrookSettings.Port := 2000;
//BrookSettings.LogActive := True;
//BrookSettings.LogFile := 'MYAPP.LOG';

//BrookSettings.Charset := BROOK_HTTP_CHARSET_UTF_8;
//BrookSettings.Page404File := PUBLIC_HTML + '404.html';
//BrookSettings.Page500File := PUBLIC_HTML + '500.html';
//BrookSettings.Configuration := '../cfg/boo.cfg';
//BrookSettings.ContentType := BROOK_HTTP_CONTENT_TYPE_APP_JSON;
//BrookSettings.Page404 := '{ "error": "Page not found." }';
//BrookSettings.Page500 := '{ "error": "@error" }';

end.
