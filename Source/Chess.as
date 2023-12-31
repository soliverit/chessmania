/*
	The main game object. Keeps the players, board and does move management.
*/
class Chess
{
	string	BRAIN_URL	= "http://localhost:5001/chess";	// Chess server url
	Board GameBoard;		// Game board. The thing that's rendered, tracks piece locations
	Player Player1;			// Player 1
	Player Player2;			// Player 2
	Player CurrentPlayer;	// Plyaer who's taking their turn
	Player Winner;			// Whoever checks their mate
	bool IsVisible;			// Render the board? This is part of Chess object now (deprecated, I think...)
	bool IsFinished;		// Game is over?
	Move[] Moves;			// Actions that've been taken
	Chess(){}
	Chess()
	{
		GameBoard		= Board();
		Player1			= Player(true, true);
		Player2			= Player(false, true);
		CurrentPlayer	= Player1;
		Player1.CreatePieces();
		Player2.CreatePieces();
		SetUpPieces();
	}
	/*
		Handle the CurrentPlayer taking their turn.
	*/
	void MakeMove()
	{
		// Self explanatory
		if(IsFinished)
		{
			return;
		}
		/*
			AI charcters use the Stockfish chess engine. To use it an async request is sent to the
			python server (./server.py) in FEN format. The server returns universal chess interface
			move
		*/
		if(CurrentPlayer.IsAI)
		{
			// Pretty sure ReadyToMove is redundant since splitting Think() and IsThnking().
			// In any case, if the AI isn't thinking, tell it to.
			if(!CurrentPlayer.IsThinking() && !CurrentPlayer.ReadyToMove())
			{
				CurrentPlayer.Think(BRAIN_URL, GameBoard.ToFEN(CurrentPlayer.IsWhite()));
				return;
			}
			// When CurrentPlayer is ready to move.
			if(!CurrentPlayer.IsThinking() && CurrentPlayer.ReadyToMove())
			{
				Move move			= Move(GameBoard, CurrentPlayer, CurrentPlayer.GetNextMoveCode());
				Moves.InsertLast(move);
				Square@ startSquare	= GameBoard.Squares[move.StartPosition.y][move.StartPosition.x];
				Square@ endSquare	= GameBoard.Squares[move.EndPosition.y][move.EndPosition.x];
				Piece@	piece		= startSquare.HeldPiece;
				startSquare.RemovePiece();
				endSquare.SetPiece(piece);
				// Dirty: The Player makes the stockfish request and the Move can't be
				// made until the request is finished. The move needs the Board so it
				// would be dirtier to pass Board to player.
				//
				// Thought about linking up and down but left it for now.
				if(CurrentPlayer.Checkmate)
				{
					IsFinished	= true;
					Winner		= CurrentPlayer;
				}
				CurrentPlayer = CurrentPlayer.IsWhite() ? Player2 : Player1;
			}
		}
	}
	/*
		Set up the initial Board state.
	*/
	void SetUpPieces()
	{
		// Player 1 (Bottom)
		Square@[] row = GameBoard.Squares[7];
		row[0].SetPiece(Player1.TheFirstRook);
		row[1].SetPiece(Player1.TheFirstHorse);
		row[2].SetPiece(Player1.TheFirstBishop);
		row[3].SetPiece(Player1.TheQueen);
		row[4].SetPiece(Player1.TheKing);
		row[5].SetPiece(Player1.TheSecondBishop);
		row[6].SetPiece(Player1.TheSecondHorse);
		row[7].SetPiece(Player1.TheSecondRook);

		row	= GameBoard.Squares[6];
		row[0].SetPiece(Player1.Pawn1);
		row[1].SetPiece(Player1.Pawn2);
		row[2].SetPiece(Player1.Pawn3);
		row[3].SetPiece(Player1.Pawn4);
		row[4].SetPiece(Player1.Pawn5);
		row[5].SetPiece(Player1.Pawn6);	
		row[6].SetPiece(Player1.Pawn7);
		row[7].SetPiece(Player1.Pawn8);
		// Player 2 (Top)
		row = GameBoard.Squares[0];
		row[0].SetPiece(Player2.TheFirstRook);
		row[1].SetPiece(Player2.TheFirstHorse);
		row[2].SetPiece(Player2.TheFirstBishop);
		row[3].SetPiece(Player2.TheQueen);
		row[4].SetPiece(Player2.TheKing);
		row[5].SetPiece(Player2.TheSecondBishop);
		row[6].SetPiece(Player2.TheSecondHorse);
		row[7].SetPiece(Player2.TheSecondRook);

		row	= GameBoard.Squares[1];
		row[0].SetPiece(Player2.Pawn1);
		row[1].SetPiece(Player2.Pawn2);
		row[2].SetPiece(Player2.Pawn3);
		row[3].SetPiece(Player2.Pawn4);
		row[4].SetPiece(Player2.Pawn5);
		row[5].SetPiece(Player2.Pawn6);	
		row[6].SetPiece(Player2.Pawn7);
		row[7].SetPiece(Player2.Pawn8);
	}
	/*
		Render the board and anything else
	*/
	void Render()
	{
		if(IsVisible)
		{
			GameBoard.Render(CurrentPlayer.Colour);
		}
	}
}