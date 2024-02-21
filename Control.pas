Unit Control;
Uses GraphABC;
var
  ///Игровые клавиши
  UP,DOWN,LEFT,RIGHT,ENTER: boolean; //здесь можно ещё индикаторы добавить, если нужно
  ///Координаты мыши
  MouseX, MouseY: integer;
  ///Нажата ли кнопка мыши?
  MousePressed: boolean;
  ///Двигается ли мышь?
  MouseMoved: boolean;
  ///Код нажатой кнопки мыши
  MouseCode: integer;
  ///Изменился ли размер окна?
  Resized: boolean;
procedure KeyDown(key: integer);
begin
  case key of
    VK_UP: UP := true;
    VK_DOWN: DOWN := true;
    VK_LEFT: LEFT := true;
    VK_RIGHT: RIGHT := true;
    VK_ENTER: ENTER := true;
  end;
end;
procedure KeyUp(key: integer);
begin
  case key of
    VK_UP: UP := false;
    VK_DOWN: DOWN := false;
    VK_LEFT: LEFT := false;
    VK_RIGHT: RIGHT := false;
    VK_ENTER: ENTER := false;
  end;
end;
procedure MouseDown(x,y,mb: integer);
begin
  MouseX := x;
  MouseY := y;
  MousePressed := true;
  MouseCode := mb;
end;
procedure MouseMove(x,y,mb: integer);
begin
  MouseX := x;
  MouseY := y;
  MouseCode := mb;
  MouseMoved := true;
end;
procedure MouseUp(x,y,mb: integer);
begin
  MousePressed := false;
end;
procedure Resize := Resized:= true;
begin
  OnKeyDown := KeyDown;
  OnKeyUp := KeyUp;
  OnMouseDown := MouseDown;
  OnMouseMove := MouseMove;
  OnMouseUp := MouseUp;
  OnResize := Resize;
end.