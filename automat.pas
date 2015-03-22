unit automat;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

type
  TZustand = 0..1;

  TAutomat = class
    altGen: array[0..255] of TZustand;
    neueGen: array[0..255] of TZustand;
    nummer: byte;
    constructor Create;
  procedure Create(nummmer,length:cardinal);
    procedure startgeneration;
    procedure neue_gen_berechnen;
  end;



implementation

constructor TAutomat.Create;
begin
     self.nummer := 0;
     Randomize;
end;

procedure TAutomat.Create(nummmer,length:cardinal);
begin

end;

procedure TAutomat.startgeneration;
var
  i: cardinal;
begin
  for i := 0 to Length(self.neueGen)-1 do
  begin
    self.neueGen[i] := Random(2);

    ShowMessage(IntToStr(self.neueGen[i]));
  end;
end;

procedure TAutomat.neue_gen_berechnen;
var
  i: cardinal;                                                   t
begin
  self.altGen := self.neueGen;

  for i := 0 to Length(self.neueGen)-1 do
  begin


    ShowMessage(IntToStr(self.neueGen[i]));
  end;
end;

end.
