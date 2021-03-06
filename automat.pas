unit automat;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

type
  TZustand = 0..1;

  TAutomat = class
    altGen: array of TZustand;
    neueGen: array of TZustand;
    regel: array[0..7] of TZustand;
    nummer: byte;
    constructor Create;
    procedure regel_setzen(nr: byte);
    procedure breite_setzen(br: cardinal);
    function breite_geben: cardinal;
    procedure startgeneration;
    procedure neue_gen_berechnen;
  end;



implementation

constructor TAutomat.Create;
begin
  self.nummer := 0;
  Randomize;
end;

procedure TAutomat.regel_setzen(nr: byte);
var
  i: cardinal;
begin
  self.nummer := nr;
  for i := 0 to 7 do
  begin
    regel[i] := nr mod 2;
    nr := nr div 2;
  end;
end;

procedure TAutomat.breite_setzen(br: cardinal);
begin
  SetLength(self.neueGen, br);
  SetLength(self.altGen, br);
end;

function TAutomat.breite_geben: cardinal;
begin
  result:= length(self.altGen);
end;

procedure TAutomat.startgeneration;
var
  i: cardinal;
begin
  for i := 0 to Length(self.neueGen) - 1 do
  begin
    self.neueGen[i] := Random(2);
  end;
end;

procedure TAutomat.neue_gen_berechnen;
var
  i, regelpos: cardinal;
begin
  self.altGen := self.neueGen;

  for i := 0 to Length(self.neueGen) - 1 do
  begin
    regelpos := altGen[(i - 1) mod Length(self.neueGen)] * 4 +
      altgen[i mod Length(self.neueGen)] * 2 + altgen[(i + 1) mod Length(self.neueGen)];
    neueGen[i] := self.regel[regelpos];
  end;
end;

end.

