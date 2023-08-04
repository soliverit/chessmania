
void Main()
{
	
	Board	board;
	Game game	= Game(board, Player(true), Player(false));
	while(true){	
		board.Render();
		yield();
	}

}
