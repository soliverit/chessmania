
void Main()
{
	// Console	console 	= Console(380, 50);
	// console.Opacity		= 0.9;
	// console.FontSize	= 15;
	// console.BufferSize	= 9;
	Chess game		= Chess();
	game.IsVisible	= true;
	game.IsFinished	= false;
	bool largeMode	= false;
	game.Render();
	while(true)
	{	
		game.MakeMove();
		game.Render();
		
		yield();
		
	}
}