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
    nummer: byte;
    constructor Create; overload;
    procedure Create(nummmer: byte; length: cardinal); overload;
    procedure startgeneration;
    procedure neue_gen_berechnen;
  end;



implementation

constructor TAutomat.Create;
begin
  self.nummer := 0;
  Randomize;
end;

procedure TAutomat.Create(nummmer: byte; length: cardinal);
begin
  self.nummer := nummer;
  setLength(self.alteGen, length);
  setLength(self.neueGen, length);
end;

procedure TAutomat.startgeneration;
var
  i: cardinal;
begin
  for i := 0 to Length(self.neueGen) - 1 do
  begin
    self.neueGen[i] := Random(2);

    ShowMessage(IntToStr(self.neueGen[i]));
  end;
end;

procedure TAutomat.neue_gen_berechnen;
var
  i: cardinal;
begin
  self.altGen := self.neueGen;

  //todo Nummer zurückrechnen

  for i := 0 to Length(self.neueGen) - 1 do
  begin
    // i-1: length mod (i-1)

    ShowMessage(IntToStr(self.neueGen[i]));
  end;
end;

end.


