
void Main()
{
	Console	console 			= Console(380, 50);
	console.Opacity				= 0.9;
	console.FontSize			= 15;
	console.BufferSize			= 15;
	Board	board;
	Game game	= Game(board, Player(true), Player(false));
	
	while(true){	
		board.Render();
		vec2 mousePosition	= board.GetMouseLocation();
		console.AddLine("X:" + mousePosition.x + ", " + mousePosition.y);
		console.Render();
		yield();
	}

}
