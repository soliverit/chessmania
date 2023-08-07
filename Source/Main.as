
void Main()
{
	Console	console 	= Console(380, 50);
	console.Opacity		= 0.9;
	console.FontSize	= 15;
	console.BufferSize	= 9;
	Chess game		= Chess();
	game.IsVisible	= false;
	game.IsFinished	= false;
	bool largeMode	= false;
	game.Render();
	uint64 lastTime		= Time::get_Now();
	while(true)
	{	
		uint64 time =Time::get_Now();
		if(time - lastTime > 2000)
		{
			print("shoe");
			lastTime	= time;
			game.MakeMove();
		}
		game.Render();
		
		yield();
		
	}
}