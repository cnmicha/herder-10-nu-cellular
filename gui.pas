unit gui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    edBreite: TEdit;
    edNummer: TEdit;
    edAnzahl: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure ImageKonstruieren;
    procedure ImageLeeren;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ImageKonstruieren;
var
  r: Trect;
begin
  r.left := 0;
  r.top := 0;
  r.right := Image1.Width;
  r.bottom := Image1.Height;

  Image1.canvas.fillrect(r);
end;

procedure TForm1.ImageLeeren;
var
  i, o: cardinal;
begin
  for i := 0 to Image1.Height do
  begin
    for o := 0 to Image1.Width do
      Image1.canvas.Pixels[i, o] := clWhite;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ;
  Image1.Width := StrToInt(edBreite.Text);
  Image1.Height := StrToInt(edAnzahl.Text);
  ImageLeeren;
  ImageKonstruieren;
  Image1.canvas.Pixels[1, 1] := clBlack;
  Image1.canvas.Pixels[1, 5] := clBlack;
end;

end.