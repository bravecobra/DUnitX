{***************************************************************************}
{                                                                           }
{           DUnitX                                                          }
{                                                                           }
{           Copyright (C) 2015 Vincent Parrett & Contributors               }
{                                                                           }
{           vincent@finalbuilder.com                                        }
{           http://www.finalbuilder.com                                     }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}

unit DUnitX.Banner;

interface

{$I DUnitX.inc}

procedure ShowBanner;

implementation

uses
  {$IFDEF USE_NS}
  System.DateUtils,
  System.SysUtils,
  {$ELSE}
  DateUtils,
  SysUtils,
  {$ENDIF}
  DUnitX.ConsoleWriter.Base,
  DUnitX.ServiceLocator;


procedure ShowBanner;
var
  consoleWriter : IDUnitXConsoleWriter;
  yr : integer;

  procedure WriteLine(const value : string);
  begin
    if consoleWriter <> nil then
      consoleWriter.WriteLn(value)
    else
      System.Writeln(value);
  end;


begin
  consoleWriter := TDUnitXServiceLocator.DefaultContainer.Resolve<IDUnitXConsoleWriter>();
  if consoleWriter <> nil then
    consoleWriter.SetColour(ccBrightWhite, ccDefault);

  yr := YearOf(Today);


  WriteLine('**********************************************************************');
  WriteLine(Format('*        DUnitX - (c) 2015-%d Vincent Parrett & Contributors       *', [yr]));
  WriteLine('*                                                                    *');
  WriteLine('*        License - http://www.apache.org/licenses/LICENSE-2.0        *');
  WriteLine('**********************************************************************');
  WriteLine('');
  if consoleWriter <> nil then
    consoleWriter.SetColour(ccDefault);
end;

end.
