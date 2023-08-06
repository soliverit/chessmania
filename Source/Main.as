
void Main()
{
	Console	console 	= Console(380, 50);
	console.Opacity		= 0.9;
	console.FontSize	= 15;
	console.BufferSize	= 9;
	// Board	board;

	Chess game		= Chess();
	int baseWidth	= game.GameBoard.Width;
	int baseHeight	= game.GameBoard.Height;
	int baseX		= game.GameBoard.X;
	int baseY		= game.GameBoard.Y;
	game.IsVisible	= true;
	game.IsFinished	= false;
	bool largeMode	= false;
	game.Render();
	while(true){	
		game.Render();
		yield();
		game.MakeMove();
	}

}
