//Заливка
Uses GraphABC, Control;
var
  W := 500;
  H := 500;
  Field: array[,] of integer;
  FW := 50;
  FH := FW;
  ToSee: array of point;
  TmSee: array of point;
  W2 := Round(W/FW);
  H2 := Round(H/FH);
procedure SC(R,G,B: integer) := Brush.Color := RGB(R,G,B);
procedure Init;
begin
  Window.SetSize(W,H);
  WindowCenter;
  LockDrawing;
  SetLength(Field,FW,FH);
  for i: integer := 0 to FH-1 do//
  for j: integer := 0 to FW-1 do//
    if Random(0,2) = 0 then Field[j,i] := 128;//
end;
procedure Show;
begin
  for i: integer := 0 to FH-1 do
  for j: integer := 0 to FW-1 do
  begin
    SC(Field[j,i],Field[j,i],Field[j,i]);
    FillRect(j*W2,i*H2,(j+1)*W2,(i+1)*H2);
  end;
  for i: integer := 0 to Length(ToSee)-1 do//
  begin//
    SC(128,255,64);//
    FillRect(ToSee[i].X*W2,ToSee[i].Y*H2,(ToSee[i].X+1)*W2,(ToSee[i].Y+1)*H2);//
  end;//
  Redraw;
end;
procedure Fill(X1,Y1,NewColor: integer);
var
  MainColor := Field[X1,Y1];
begin
  SetLength(ToSee,1);
  ToSee[0].X := X1;
  ToSee[0].Y := Y1;
  while Length(ToSee) > 0 do
  begin
    for i: integer := 0 to Length(ToSee)-1 do
      Field[ToSee[i].X,ToSee[i].Y] := NewColor;
    
    Show;
    
    SetLength(TmSee,0);
    for i: integer := 0 to Length(ToSee)-1 do
    begin
      if ToSee[i].X+1 < FW then
      if Field[ToSee[i].X+1,ToSee[i].Y] = MainColor then
      begin SetLength(TmSee,Length(TmSee)+1);
            Field[ToSee[i].X+1, ToSee[i].Y] := 128;
            TmSee[Length(TmSee)-1].X := ToSee[i].X+1;
            TmSee[Length(TmSee)-1].Y := ToSee[i].Y end;
            
      if ToSee[i].X-1 > -1 then
      if Field[ToSee[i].X-1,ToSee[i].Y] = MainColor then
      begin SetLength(TmSee,Length(TmSee)+1);
            Field[ToSee[i].X-1, ToSee[i].Y] := 128;
            TmSee[Length(TmSee)-1].X := ToSee[i].X-1;
            TmSee[Length(TmSee)-1].Y := ToSee[i].Y end;
            
      if ToSee[i].Y+1 < FH then
      if Field[ToSee[i].X,ToSee[i].Y+1] = MainColor then
      begin SetLength(TmSee,Length(TmSee)+1);
            Field[ToSee[i].X, ToSee[i].Y+1] := 128;
            TmSee[Length(TmSee)-1].Y := ToSee[i].Y+1;
            TmSee[Length(TmSee)-1].X := ToSee[i].X end;
            
      if ToSee[i].Y-1 > -1 then
      if Field[ToSee[i].X,ToSee[i].Y-1] = MainColor then
      begin SetLength(TmSee,Length(TmSee)+1);
            Field[ToSee[i].X, ToSee[i].Y-1] := 128;
            TmSee[Length(TmSee)-1].Y := ToSee[i].Y-1;
            TmSee[Length(TmSee)-1].X := ToSee[i].X end;
    end;
    SetLength(ToSee,Length(TmSee));
    for i: integer := 0 to Length(ToSee)-1 do
    begin
      ToSee[i].X := TmSee[i].X;
      ToSee[i].Y := TmSee[i].Y;
    end;
  end;
end;
begin
  Init;
  while true do
  begin
    Show;
    while not MousePressed do;
    Fill(MouseX div W2,MouseY div H2,Random(0,255));
  end;
end.